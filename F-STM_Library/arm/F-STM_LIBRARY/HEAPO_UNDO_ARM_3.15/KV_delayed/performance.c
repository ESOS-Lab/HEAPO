#include <stdio.h>
#include <stdlib.h>
//#include <pos-lib.h> 
#include <string.h> 
#include <time.h>
#include "list/pos-list.h" 
#include "list/pos-list-stm.h" 
#include "hashtable/pos-hashtable.h" 
#include "hashtable/pos-hashtable-stm.h" 
#include "hashtable/pos-hashtable_private.h" 
#include "btree/pos-btree.h" 
#include <pthread.h>


static char * obj_store = NULL ; 	
static int static_key[3100000] = {0} ; 	

extern int thread_num = 0 ; //all file shared this variable. 
pthread_mutex_t mmutex = PTHREAD_MUTEX_INITIALIZER ; 

#define T_LOCK 1 
#ifndef T_LOCK 
	void mlock(){;} 
	void munlock(){;} 
#else 
	void mlock(){pthread_mutex_lock(&mmutex);}
	void munlock(){pthread_mutex_unlock(&mmutex);} 
#endif 

/* 
	EACH Interface correlated with data structure(list,hash,btree) 
*/ 
void* stm_hi( void *data ){ // stm hash insert operation. 
	int i = 0 ; 
	int dat = *(int *)data; 	
	int ret_dat = dat * 30000 ; 	
	int ret_val = 0 ; 	
	//TM_THREAD_INIT 
	stm_pos_tm_init(obj_store); 
	for( i=0+ret_dat ; i<30000+ret_dat ; i++){ 
		ret_val = stm_pos_hashtable_insert(obj_store,&static_key[i],&static_key[i],8);
	}
	//TM_THREAD_EXIT
	stm_pos_tm_exit(obj_store); 
} 
void* stm_hr( void *data ){ // stm hash remove operation.
	int i = 0 ; 
	int dat = *(int *)data; 	
	int ret_dat = dat * 30000 ; 	
	int ret_val = 0 ; 	
	//TM_THREAD_INIT 
	stm_pos_tm_init(obj_store); 
	for( i=0+ret_dat ; i<30000+ret_dat ; i++){ 
		ret_val = stm_pos_hashtable_remove(obj_store,&static_key[i]);
	}
	//TM_THREAD_EXIT
	stm_pos_tm_exit(obj_store); 
}

void* stm_bi( void *data ){ // stm btree insert operation.
	int i = 0 ; 
	int dat = *(int *)data; 	
	int ret_dat = dat * 30000 ; 	
	int ret_val = 0 ; 	
	//TM_THREAD_INIT 
	stm_pos_tm_init(obj_store); 
	for( i=0+ret_dat ; i<30000+ret_dat ; i++){ 
		ret_val = stm_pos_btree_insert(obj_store,&static_key[i],&static_key[i],0);
	}
	//TM_THREAD_EXIT
	stm_pos_tm_exit(obj_store); 
} 
void* stm_br( void *data ){ // stm btree remove operation. 
	int i = 0 ; 
	int dat = *(int *)data; 	
	int ret_dat = dat * 30000 ; 	
	int ret_val = 0 ; 	
	//TM_THREAD_INIT 
	stm_pos_tm_init(obj_store); 
	for( i=0+ret_dat ; i<30000+ret_dat ; i++){ 
		ret_val = stm_pos_btree_remove(obj_store,&static_key[i]);
	}
	//TM_THREAD_EXIT
	stm_pos_tm_exit(obj_store); 
} 
void* stm_lr( void *data ){ // stm list remove operation.

	int i = 0 ; 	
	int dat = *(int *)data ; 	
	int ret_dat = dat * 30000 ; // remove 30000 ops per threads; 	
	int ret_val = 0 ;
	//TM_THREAD_INIT 
	stm_pos_tm_init(obj_store) ; 	
	for( i = 0+ret_dat  ; i < 30000+ret_dat ; i++ ){
		ret_val = stm_pos_list_remove( obj_store , &static_key[i]) ; 	
		if(ret_val == -1){ 
			printf("[stm_list_remove] return error\n") ; 	
			return NULL ; 		
		}
	} 
	//TM_THREAD_EXIT  
	stm_pos_tm_exit(obj_store) ;
	return NULL ; 		

} 
void* stm_li( void *data ){ // stm list insert operation.
	int i = 0 ; 	
	int dat = *(int *)data ; 	
	int ret_dat = dat * 30000 ; 	
	int ret_val = 0; 	
	//TM_THREAD_INIT 
//	mlock() ; 	
#ifdef T_LOCK 
	printf("[%s][dat:%d]\n",__func__,dat) ; 	
#endif 
	
	stm_pos_tm_init(obj_store) ; 	
	for( i = 0+ret_dat; i < 30000+ret_dat; i++ ){ 
		printf("[%s][%d][%p]\n",__func__,i,&static_key[i]) ;
		ret_val = stm_pos_list_insert(obj_store, &static_key[i], &static_key[i], 8) ; 
//		ret_val = stm_pos_list_insert(obj_store , &i, &i , 8) ;
		if( ret_val == -1){ 
			printf("[stm_list_insert] return error\n") ; 	
			exit(-1);
		}
	} 
	//TM_THREAD_EXIT 
	stm_pos_tm_exit(obj_store) ; 	

//	munlock() ;
	return NULL ; 	
} 
void help(){ 
	printf("[Usage]: ./performance [obj_name] [thread_num] [mode]\n") ; 	
	printf("[Mode Manual]\n") ; 	
	printf("[1] : list insert\n") ; 	
	printf("[2] : list remove\n") ; 	
	printf("[3] : list count\n") ; 	
	printf("[4] : hash insert\n") ; 	
	printf("[5] : hash remove\n") ; 	
	printf("[6] : hash count\n") ; 	
	printf("[7] : btree insert\n") ; 	
	printf("[8] : btree remove\n") ; 	
	printf("[9] : btree count\n") ; 	
} 
int main(int argc, char **argv){ 
	struct timeval T1, T2 ;
	int ret=0 ; 	
	int i , j , q = 0 ;  

        pthread_t * threads;
        // input obj , thread_num ;

        if( argc != 4){
		help() ; 	
                return ;
        }
        obj_store = argv[1] ;
        thread_num = atoi( argv[2] ) ;
        int mode = atoi( argv[3] ) ;

	// Initialization to send thread var.   	
	int a[50] = {0} ;
        for( q = 0 ; q < 50; q++){
                a[q] = q;
        }
	// Initialization node address ; 	
	for( j = 0 ; j < 3100000 ; j++ ){ 
		static_key[j] = j ; 	
	} 

	// thread initialization 
        if(( threads = (pthread_t *)malloc(thread_num * sizeof(pthread_t)))==NULL){
                perror("malloc");
                exit(1);
        }
	// initialization data structure( init & open ) 
	if( mode == 1 || mode == 2 || mode == 3){ 
		//[ STM_MODE ] 1-[list insert] 2-[list remove] 3-[list check] 
		//ret = pos_list_init( obj_store ) ; 
		if( mode == 1 || mode == 2){ 
			ret = stm_pos_list_init( obj_store ) ; 	
			if( ret == -1){ 
				printf("[stm_pos_list_init] return error\n") ; 	
				return -1; 	
			}
		}
		ret = stm_pos_list_open( obj_store ) ; 		
		if( ret == -1){ 
			printf("[stm_pos_list_open] return error\n") ; 	;
			return -1;	
		}
	}else if( mode == 4 || mode == 5 || mode == 6 ){ 
		//[STM MODE] 4-[hash insert] 5-[hash remove] 6-[hash check]	
		int rec_num = 8 ; //default value set. 
		if( mode == 4 || mode == 5  ){ 
			ret = stm_pos_create_hashtable( obj_store , rec_num , NULL , NULL );
			ret = stm_pos_hashtable_open( obj_store ) ; 
		}else{ 
			pos_hashtable_open(obj_store) ; 	
		}
		
	}else if( mode == 7 || mode == 8 || mode == 9 ){
		//[STM MODE] 7-[btree insert] 8-[btree remove] 9-[btree check]  
		if( mode == 7 || mode == 8 ){
		ret = stm_pos_btree_init( obj_store ) ; 	
		ret = stm_pos_btree_open ( obj_store );
		}else{ 
		ret = pos_btree_open(obj_store) ; 	
		}
	} 
	

	if( mode == 1 ){ 
		//list insert using tinySTM(stm_li) ;
		printf("[LIB] list insert mode\n") ; 	
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,stm_li,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_join(threads[i] , NULL) != 0){ 
				fprintf(stderr,"Error wating for threads\n") ; 	
				exit(1); 
			}
		}
		gettimeofday(&T2,NULL) ; 
		//print_time(T1,T2) ; 	
		// To call TM_EXIT; 
		stm_pos_list_close(obj_store);	
	
	} else if ( mode == 2 ){ 
		printf("[LIB] list remove mode\n") ; 	
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
 			if(pthread_create(&threads[i],NULL,stm_lr,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1);
			}
		}
                for( i = 0 ; i < thread_num ; i++ ){
                        if(pthread_join(threads[i] , NULL) != 0){
                                fprintf(stderr,"Error wating for threads\n") ;
                                exit(1);
                        }
                }
		gettimeofday(&T2,NULL) ; 	
		//print_time(T1,T2) ; 	
		//to call TM_EXIT; 	
		stm_pos_list_close(obj_store) ; 	
	} else if ( mode == 3 ){ 
		printf("[LIB] list check mode\n") ; 	
		stm_pos_list_count(obj_store) ;	
		stm_pos_list_close(obj_store) ; 
		//print_time(T1,T2) ; 	
		//to call TM_EXIT; 	
	} else if ( mode == 4 ){ 
		printf("[LIB] hash insert mode\n") ; 
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
 			if(pthread_create(&threads[i],NULL,stm_hi,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1);
			}
		}
                for( i = 0 ; i < thread_num ; i++ ){
                        if(pthread_join(threads[i] , NULL) != 0){
                                fprintf(stderr,"Error wating for threads\n") ;
                                exit(1);
                        }
                }
		gettimeofday(&T2,NULL) ; 	
		//print_time(T1,T2) ; 	
		//to call TM_EXIT; 
		stm_pos_hashtable_close(obj_store); 
	
	} else if ( mode == 5 ){ 
		printf("[LIB] hash remove mode\n") ; 	
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
 			if(pthread_create(&threads[i],NULL,stm_hr,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1);
			}
		}
                for( i = 0 ; i < thread_num ; i++ ){
                        if(pthread_join(threads[i] , NULL) != 0){
                                fprintf(stderr,"Error wating for threads\n") ;
                                exit(1);
                        }
                }
		gettimeofday(&T2,NULL) ; 	
		//print_time(T1,T2) ; 	
		//to call TM_EXIT; 
		stm_pos_hashtable_close(obj_store) ; 		
	} else if ( mode == 6 ){ 
		printf("[LIB] hash check mode\n") ; 	
		stm_pos_hashtable_count(obj_store,static_key) ; 	
		stm_pos_hashtable_close(obj_store) ; 
	} else if ( mode == 7 ){ 
		printf("[LIB] btree insert mode\n") ; 	
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
 			if(pthread_create(&threads[i],NULL,stm_bi,(void*)&a[i])!=0){
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1);
			}
		}
                for( i = 0 ; i < thread_num ; i++ ){
                        if(pthread_join(threads[i] , NULL) != 0){
                                fprintf(stderr,"Error wating for threads\n") ;
                                exit(1);
                        }
                }
		gettimeofday(&T2,NULL) ; 	
		//print_time(T1,T2) ; 	
		//to call TM_EXIT; 	
		stm_pos_btree_close( obj_store ) ; 	
	} else if ( mode == 8 ){ 
		printf("[LIB] btree remove mode\n") ; 	
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
 			if(pthread_create(&threads[i],NULL,stm_br,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1);
			}
		}
                for( i = 0 ; i < thread_num ; i++ ){
                        if(pthread_join(threads[i] , NULL) != 0){
                                fprintf(stderr,"Error wating for threads\n") ;
                                exit(1);
                        }
                }
		gettimeofday(&T2,NULL) ; 	
		//print_time(T1,T2) ; 	
		//to call TM_EXIT; 	
		stm_pos_btree_close(obj_store) ; 
	} else if ( mode == 9 ){ 
		printf("[LIB] btree check mode\n") ; 	
		stm_pos_btree_count(obj_store, static_key) ; 
		stm_pos_btree_close(obj_store) ;
	} 
    
	

} 
