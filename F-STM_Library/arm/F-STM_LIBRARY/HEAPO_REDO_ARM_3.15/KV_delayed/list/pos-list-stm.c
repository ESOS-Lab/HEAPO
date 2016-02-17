/*

	Author : Keonwoo Lee (kunulee@hanyang.ac.kr)
*/ 

#include<stdio.h>
#include<stdlib.h>
#include<string.h> 
#include"../pos-lib.h"
#include<unistd.h>
#include<pthread.h>

#include"pos-list.h"
#include"../stm_lib/pos_stm.h" 


#define MODE 
#define OFFSET_BASE 

/* Later We implement about undo logging with stm to modify tinySTM */ 
#define CONSISTENCY 		(1)
#define UNDO_CONSISTENCY 	(1)
#define ALL_UNDO_CONSISTENCY 	(1)
#define KEONWOO_DEBUG 		(1)

#define pos_write_value pos_write_value_kv

/* key_cmp , pos_list_lookup interface are using base function */

/* create two object storage */
int stm_pos_list_init( char *name){ 
	struct list_head *head; 
	int ret_val = 0 ; 	

	PR_DEBUG("[%s]\n", __func__ ) ; 	

	if(pos_create(name) == 0){ 
		PR_DEBUG("[%s] already created\n",__func__) ; 
		return 0;
	}
	/* create log */ 
	//#if (CONSISTENCY == 1) 	
	// Log for stm interface compose of list
	ret_val = stm_pos_create_object(name,TOT_TM);		
	if( ret_val == -1){ 
		PR_DEBUG("[%s] stm_pos_create_object err\n",__func__) ; 	
		return -1; 	
	}
	//#endif 
	head = (struct list_head *)pos_malloc(name,sizeof(struct list_head)); 
	pos_set_prime_object(name,head) ; 	
	head->head = NULL ; 	

	PR_DEBUG("[%s] log_unmap called\n",__func__) ; 
	stm_pos_log_unmap(name) ; 	
	PR_DEBUG("[%s] unmap called\n",__func__) ;
	pos_unmap(name) ;


	return 0 ; 
} 
int stm_pos_list_destroy( char *name){ 
	pos_map(name) ; 	
	#if (CONSISTENCY == 1)
	stm_pos_delete_object(name) ; 
	#endif
	pos_delete(name) ; 	
	return 0;
} 
int stm_pos_list_count( char *name){ 
	int ret_val = 0 ; 	
	struct list_head * head ; 	
	
	struct list_node * node ; 	
	struct list_node * tmp ; 	
	int cnt = 0 ; 	
	
	PR_DEBUG("=====[%s]======\n",__func__) ; 	
	head = (struct list_head *)pos_get_prime_object(name) ; 	
	PR_DEBUG(" head = %p\n" , head) ; 
	node = head->head ; 	
	tmp = head->head ; 	

	while( node ){ 
		PR_DEBUG("[%d] node : %p\n" , cnt , node) ; 	
		cnt++ ; 	
		node = node->next ; 	
	}	
	PR_DEBUG("head = %p\n" , head) ; 	
	PR_DEBUG("[total] node count : %d\n" ,cnt) ; 

	cnt = 0 ; 	
	
	return 0 ;	

} 
int stm_pos_list_open(char *name){ 
	/* TRANSACTION MEMORY INIT */ 
	TM_INIT; 
	int ret_val = 0 ; 	
	PR_DEBUG("[%s] pos_map called\n",__func__ ) 
	ret_val = pos_map(name) ; 	
	PR_DEBUG( "[%s] stm_pos_log_map called\n",__func__) 
	ret_val = stm_pos_log_map(name) ; 	

	PR_DEBUG("[%s]\n" , __func__ ) ; 	
	SLEEP_DEBUG(2) ; 	
	/* recovery mechanism */ 
	#if (CONSISTENCY == 1)
	ret_val = stm_pos_recovery(name) ; 	
	if(ret_val != 0){ 
		perror("[stm_pos_list_open recovery failed]\n") ; 	
		exit(-1) ;
	}
	#endif 
	return 0 ; 
} 
int stm_pos_list_close(char *name){
	int ret_val = 0 ; 	
	pos_unmap(name) ; 	
	PR_DEBUG("[%s] pos_unmap called\n", __func__ ) ; 	
	ret_val = stm_pos_log_unmap(name) ; 	
	PR_DEBUG("[%s] stm_pos_log_unmap called\n", __func__ ) ; 	
	SLEEP_DEBUG(2);

	/* TRANSACTION MEMORY EXIT */ 
	TM_EXIT ; 
	return 0 ; 
}
int stm_pos_list_insert(char *name, void *_key, void *_val, unsigned long val_size){
        struct list_head * head ;
        struct list_node * node ;
        unsigned long * key , val ;
        int i = 0 ;
        key = (unsigned long *)_key ;
        val = (unsigned long *)_val ;
	
        head = (struct list_head *)pos_get_prime_object(name) ; //not changed// 
        lock() ;
        node = (struct list_node *)pos_malloc(name ,sizeof(struct list_node)) ;
	node->value = (unsigned long *)pos_malloc(name , val_size) ; 	
        unlock() ; //alloc not affect to consistency about list. 
	
	TM_START(1,RW); 	
        for( i = 0 ; i < KEY_SIZE ; i++ ){
		TM_STORE(&node->key[i] , key[i]);
//               node->key[i] = key[i] ;
        }
	TM_STORE(&node->value , val) ; 
        //pos_clflush_cache_range(node->key , KEY_SIZE * sizeof(unsigned long));//one clflush
        //lock() ;
        //node->value = (unsigned long *)pos_malloc(name , val_size) ;
        //unlock() ;
	//pos_clflush_cache_range(&node->value , sizeof(node->value)); //two clflush
        //memcpy(node->value , val , val_size) ;
        //pos_clflush_cache_range( node->value ,val_size) ;
        //TM_START(1 , RW) ;
	TM_STORE(&node->next , TM_LOAD(&head->head)) ; 	
//        node->next = TM_LOAD( &head->head ) ;
//               pos_clflush_cache_range(&node->next , sizeof(node->next)) ;
        TM_STORE( &head->head , node) ;
//                pos_clflush_cache_range((void*)&head->head , sizeof(unsigned long)) ;
        TM_COMMIT ;
//	pos_clflush_cache_range(node->key , KEY_SIZE * sizeof(unsigned long)) ; 	
//	pos_clflush_cache_range(&node->value , sizeof(node->value)) ; 	
//	pos_clflush_cache_range(node->value  , val_size); 
//	pos_clflush_cache_range(&node->next  , sizeof(node->next)) ; 
//	pos_clflush_cache_range((void*)&head->head , sizeof(unsigned long)) ; 	
        return 0 ;
} 
int stm_pos_list_remove(char *name , void *_key){ 
        struct list_head * head;
        struct list_node *node, *prev_node;
        unsigned long *key;
        unsigned long *k ;
        int i;
        struct list_node * next ;

        key = (unsigned long *)_key;
        head = (struct list_head *)pos_get_prime_object(name);
        TM_START(2, RW);
        prev_node = (struct list_node *)TM_LOAD(&head->head) ;
        next = (struct list_node *)TM_LOAD(&prev_node->next) ;
        // modified in here to set prev_node 
	if( prev_node == head->head ){ 
		if( key_cmp( prev_node->key , key ) == 1 ){
			// matching with first entry
			TM_STORE( &head->head , next );	
			goto ret; 
		}
	} 
        while( next /*prev_node*/ ){
                /*if( (next == NULL ) && ( prev_node != NULL ) ){
                        //last node ;
                        #if (KEONWOO_DEBUG == 1)
                        PR_DEBUG("Last Node\n") ;
			PR_DEBUG("[%d] - [%d]\n" , *prev_node->key , *key) ;
                        #endif
                        if( key_cmp(prev_node->key , key)==1){
                                node = (struct list_node *)
                                        TM_LOAD(&prev_node->next);
                                if(node==NULL) node = 0 ;
                                //head->head = node ; 
                                //TM_STORE(prev_node , node ) ;        
                                TM_STORE(&head->head , node) ;
                                PR_DEBUG("prev_node : %p\n" , prev_node) ;
                                break;
                        }
                }*/
              if(key_cmp(next->key , key) == 1){ // if match
	                node = ( struct list_node *)TM_LOAD(&next->next) ;
                        TM_STORE(&prev_node->next , node ) ;
                        pos_clflush_cache_range( &prev_node->next, sizeof(struct list_node)) ;
                        goto ret;
                }
                prev_node = next ;
                next = (struct list_node *)TM_LOAD(&next->next) ;
        }
	

        ret:
        TM_COMMIT ;
        // after commit
/*      if( next != NULL ){ 
        r_lock() ;
        pos_free(name , next->value) ;
        pos_free(name , next) ;
        r_unlock() ;    
        }*/
        return 0;
}

