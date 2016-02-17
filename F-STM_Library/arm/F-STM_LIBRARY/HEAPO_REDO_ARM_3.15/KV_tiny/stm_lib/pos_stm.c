#include "pos_stm.h" 
#include "pos-list.h" 
#include <stdio.h>
#include <string.h> 
#include "../pos-lib.h"

#include <unistd.h>
#include <syscall.h>

#define NAME_LENGTH 124
#define NAME_TM "_TM"
#define TM_LOG_SIZE 4 
#define SUB_LOG_SIZE 20


#define POS_NAME_TABLE 25
/* recovery using tinySTM */ 	
int stm_pos_recovery( char *name ){ 
	/* if log is mapped */ 	
	if( name == NULL ){ 
		perror("[stm_pos_recovery] name field null\n") ; 
		exit(-1) ; 	
	}
	struct pos_name_entry *name_entry; 	
	char log_name[NAME_LENGTH] = {0}  ; 	

	unsigned long *log_addr ; 	
	void *prime_ptr; 

	PR_DEBUG("[%s] obj_storage[%s]\n",__func__,name); 

	name_entry = pos_lookup_name_entry(name);//find object storage
	printf("name_entry[%p]\n" , name_entry) ;
	if(name_entry != NULL ){ /* if object is written on user cache */ 	
		strcpy( log_name , name ) ; 	
		strcat( log_name , NAME_TM );/* NAME_TM ex) obj_str_TM */
		//prime_ptr = pos_get_prime_object( log_name ) ; 	
		struct list_head *head = pos_get_prime_object(log_name) ; 	

		if( head->head == NULL ){ 
			tiny_pos_recovery(name); 
			tiny_pos_recovery(log_name) ;
			printf("Nothing to recovery\n") ; 	
			return 0; 	
		} 
		PR_DEBUG("[%s][%p]head\n",__func__,head) ;
		SLEEP_DEBUG(2) 
		/* send prime stm_tx descriptor to recovery mechanism */ 
		tm_recovery(name, head ) ; 	
		tiny_pos_recovery(name); 
		tiny_pos_recovery(log_name) ;
		/* 2015_07_31 */	
		printf("[%s] tiny_pos_recovery clear\n ") ;
		sleep(2) ; 	
	}else{ 
		printf("[%s][%s]obj_str is not written user cache\n",
			__func__ , name ) ; 	
		return -1; /* error code */
	}
	//log_addr = name_entry->log_addr;
	return 0 ;
} 
int stm_pos_log_map(char *name){ 
	int ret_val = 0 ; 	
	char log_name[NAME_LENGTH] = {0} ; 	
	int index ; 	
	
	if( name == NULL ){ 
		perror("[stm_pos_log_map] name field null\n") ; 	
		exit(-1) ; 	
	}

	// Check whther object storage is in user cache
	struct pos_name_entry *name_entry ; 	
	name_entry = pos_lookup_name_entry(name);
	if( name_entry == NULL){ 
		printf("[%s] name_entry NULL\n",__func__) ; 	
		exit(-1); 
	}
	
	/* CHECK Whether log is in user cache */ 	
	strcpy( log_name , name ) ; 	
	strcat( log_name , NAME_TM) ; 	
	index = pos_name_table_index(log_name) ; 
	name_entry = name_table[index] ; 	
	while(name_entry){ 
		if(strcmp(log_name,name_entry->name) == 0){ 
			printf("log_name : [%s] , name_entry->nam : [%s]\n" , 
				log_name , name_entry->name ) ; 
			printf("[%p]\n" , name_entry->mstate) ;			
			return 0 ; 	
		}
		name_entry = name_entry->next ; 	
	}
	/* IF log is not existed in user cache */ 	
	name_entry = (struct pos_name_entry *)malloc(sizeof(struct pos_name_entry));
	printf("[%s] pid:[%d]\n", log_name , getpid()) ;	
	strcpy( name_entry->name , log_name ) ; 
	/* sys_pos_map call */
	name_entry->mstate = (void *)syscall(385, log_name) ; 	
	PR_DEBUG("mstate : [%d]\n" , name_entry->mstate) ;

	name_entry->log_addr = NULL ; 	
	name_entry->next = name_table[index] ; 	
	name_table[index] = name_entry ; 	
	return 0; 	
}
int stm_pos_log_unmap(char *name){ 
	
	char log_name[NAME_LENGTH]={0}; 	

	if( name == NULL ){ 
		perror("[stm_pos_log_unmap] name field null\n") ; 	
		exit(-1) ; 	
	}

	strcpy(log_name , name) ; 	
	strcat(log_name , NAME_TM) ; 	
	pos_unmap(log_name) ; 
//	return syscall(302, log_name) ; 

} 
/* tinySTM Rollback-journal object storage create function */  
int stm_pos_create_object(char *name , int num_flags){ 
	/*When pos called TM_INIT; */ 	
	struct pos_name_entry *name_entry ; 	
	char log_name[ NAME_LENGTH ] ; 		
	struct list_head *head ; 	
	
	if( name == NULL){ 
		perror("[stm_pos_create_object] name field null\n") ; 	
		exit(-1) ; 	
	}	

	PR_DEBUG("[%s][obj:%s]\n", __func__ , name) ; 	

	// Find whether object storage is existed. 
	if( num_flags ==TOT_TM){ 
		name_entry = pos_lookup_name_entry(name); 
		if(name_entry == NULL){ 
			printf("[%s] name_entry already existed\n",__func__);
			return -1; 	
		}
		strcpy( log_name , name ); 
		strcat( log_name , NAME_TM); //added TM
		
		PR_DEBUG("[%s][log_name:%s]\n",__func__,log_name) ; 		

	}else if( num_flags == SUB_TM ){ 
		strcpy( log_name , name ); /* log name + pthread_self */
	} 
	if( num_flags == TOT_TM || num_flags == SUB_TM){ 
		//name_entry->log_addr 
		void *addr = NULL ; 	
		if( num_flags == TOT_TM){ 
			/* create a new object storage */ 
			addr= (void *)syscall(383,log_name,TM_LOG_SIZE*4);
			/* setting main name_entry's log_addr */ 
			//name_entry->log_addr = addr ;
			//if(name_entry->log_addr == NULL){
			//	printf("[%s] name_entry->log_addr setting err\n",__func__) ; 
			//	return -1;	
			//}
			//memset(name_entry->log_addr,0,TM_LOG_SIZE*1024) ; 
			
		} else if ( num_flags == SUB_TM){ 
			addr= (void *)syscall(383,log_name,SUB_LOG_SIZE) ; 	
			#if (KEONWOO_DEBUG == 1)
			printf("[20KB] allocate flags is SUB_TM\n") ; 	
			#endif 
		}/* working which create rollback-journal in nvram is completed */ 
	
		/* aftre create rollback-journal in nvram, write to log_entry to user_cache */
		int index = pos_name_table_index(log_name) ; 	
		/*name_entry = name_table[index] ; 	
		while(name_entry){ 
			if(strcmp(log_name,name_entry->name) == 0){
				return 0 ; 	
			} else { 
				name_entry = name_entry->next ; 
			}
		} // find log entry exist
		*/ 
		name_entry = (struct pos_name_entry*)malloc(sizeof(struct pos_name_entry));
		strcpy(name_entry->name , log_name) ; 			
		name_entry->mstate = addr ;
		if( name_entry->mstate == (void *)0){
			printf("[%s] mstate is null\n",__func__) ;
			free(name_entry) ; 	
			return 0 ; 
		}
		// Linkage on new object storage
		name_entry->next = name_table[index] ; 	
		name_table[index] = name_entry ;
	 
		if( num_flags == TOT_TM){ 
			head = (struct list_head *)pos_malloc(log_name,sizeof(struct list_head *)) ;
			printf("\n\nhead addr[%p]\n" , head) ; 
			pos_set_prime_object(log_name,head) ; 	
			head->head = NULL ; 	
		}
	}
/*	}else if(num_flags == SUB_TM){ 
		void *addr = syscall(299,log_name,TM_LOG_SIZE);	
		memset( addr , 0 , TM_LOG_SIZE*1024) ; 	
		
	}*/ 
	
 
	return 0; 
} 
int stm_pos_create_tx_object( char *name, int thread_num){ 

}
int stm_pos_delete_object(char *name){ 
	char log_name[ NAME_LENGTH ] ; 	
	if(name == NULL){ 
		perror("[stm_pos_delete_object] name field null\n") ; 	
		exit(-1) ; 	
	}
	strcpy( log_name , name ) ; 	
	strcat( log_name , NAME_TM ) ; 	
	return syscall( 384 , log_name ) ; 	
}


/* insert and remove entry */ 
int stm_pos_insert_descriptor(char *name, void *_key, void *_val, unsigned long val_size){ 
//	char log_name[ NAME_LENGTH ] ; 	
//	strcpy( log_name , name) ; 	
//	strcat( log_name , NAME_TM ) ; 	
	printf("\n[%s]\n" , __func__) ;
	printf("[%s] name[%p]\n",name,_val);
	printf("val size:[%d]\n" , val_size) ;
	
	return stm_pos_list_insert( name , _key , _val , val_size ) ; 	
}
int stm_pos_remove_descriptor(char *name, void *_key){ 
	char log_name[ NAME_LENGTH ] ;	
	strcpy( log_name , name) ; 	
	strcat( log_name , NAME_TM ) ; 	
	return stm_pos_list_remove(log_name , _key) ; 	
}  


int stm_pos_tm_init(char *name){
	if( name == NULL){ 
		perror("[stm_pos_tm_init] name field null\n" ) ; 	
		exit(-1) ;
	}
        TM_POS_INIT_THREAD(name) ;
        return 0 ;
}
int stm_pos_tm_exit(char *name){
	if( name == NULL ){ 
		perror("[stm_pos_tm_exit] name field null\n") ; 	
		exit(-1) ; 
	}
        TM_POS_EXIT_THREAD(name) ;
        return 0 ;
}
int stm_pos_tm_check(){ 
//	int ret_val = stm_check() ; 	
 
	
	return 0 ;
} 
