/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "esos_header.h" 
#include "workload_list.h"
#include "v7_pmu.h"
#include "db.h"

/* total count can divide into thread number */
#define TOTAL_COUNT 252000
/* to manage all printf output for this program */ 
#define KV_PRINT 1 
#define KV_DEBUG 0 

#if KV_PRINT == 0 
	#define PRINT(...)
#else
	#define PRINT(...) printf(__VA_ARGS__);
#endif 
#if KV_DEBUG == 0
	#define DEBUG_PRINT(...) 
#else
	#define DEBUG_PRINT(...) printf(__VA_ARGS__) ;
#endif // macro end

int threads_num = 0 ;
int per_thread_count = 0 ; 	
char *obj_store = NULL ; 
static int static_key[3100000] = {0} ; 	
static int *rm_static_key[3100000] = {0} ; 	
static int check_static_key[3100000] = {0} ; 
void print_time( struct timeval T1, struct timeval T2){
       long sec,usec;
        double time;
        double rate;

        time_t t;

        if(T1.tv_usec > T2.tv_usec)
        {
                sec = T2.tv_sec - T1.tv_sec -1;
                usec = 1000000 + T2.tv_usec - T1.tv_usec;
        }
        else
        {
                sec = T2.tv_sec - T1.tv_sec;
                usec = T2.tv_usec - T1.tv_usec;
        }

        time = (double)sec + (double)usec/1000000;

        printf("[TIME] :%8ld sec %06ldus.\n",sec,usec);
	/* later we calculate ops */
	
	printf("[TPS] : %f\n" ,TOTAL_COUNT/time);
}
void help(){ 
	printf("[Usage]:./global_test [obj_name] [mode]\n"); 
	printf("[1] list insert\n") ; 	
	printf("[2] hash insert\n") ; 
	printf("[3] btree insert\n") ;
	return ; 	
}
void *stm_list_insert( void *data ){ 
	int i = 0 ; 	
	int n = 0 ; 	
	//int dat = *(int *)data ; 
	//int ret_dat = dat * per_thread_count ; 	
	//int ret_val = 0 ; 	
	DEBUG_PRINT("[%s][%s] before [stm_pos_tm_init]\n",__func__,obj_store); 
	int ret_val = 0 ; 
	for( n = 0 ; n < threads_num ; n++ ){ //until threads_num(10)
		char name[128] = {0} ; 	
		char addchar[10] = {0} ; 
		strcpy( name , obj_store ) ; 
		sprintf( addchar , "TM_%d" , n ) ; 	
		strcat(name , addchar );
		
		stm_pos_tm_init(name) ; 	
		for( i=0 ; i < 500000; i++){
//		DEBUG_PRINT("[%s][%d][stm_pos_list_insert]\n",__func__, i) ; 
			ret_val = stm_pos_list_insert(name,&static_key[i],
					&static_key[i], 8) ; 	
			if(ret_val == -1){
				perror("[stm_list_insert] return error") ; 	
				exit(1) ; 	
			}		
		}
		DEBUG_PRINT("[%s] before [stm_pos_tm_exit]\n" ,__func__) ; 
		stm_pos_tm_exit(name) ; 
		return NULL ;	
	}
} 
void *stm_hash_insert( void *data ){ 
	int i = 0 ; 	
	int n = 0 ; 	
	int ret_val = 0 ; 
	for( n = 0 ; n <threads_num ; n++ ){ 
		char name[128] = {0}; 
		char addchar[10] = {0};
		strcpy(name , obj_store);
		sprintf(addchar , "TM_%d" , n);
		strcat(name , addchar) ; 	
		
		stm_pos_tm_init(name) ; 	
		for( i=0 ; i < 500000; i++){ 
			ret_val = stm_pos_hashtable_insert(name,&static_key[i],
					&static_key[i], 8);
			if(ret_val == -1){
				perror("[stm_list_insert] return error") ; 	
				exit(1) ; 	
			}		
		}
		stm_pos_tm_exit(name) ; 
		return NULL ;	
	}
} 
void *stm_btree_insert( void *data ){ 
	int i = 0 ; 	
	int n = 0 ; 	
	int ret_val = 0 ; 	
	for( n = 0 ; i < threads_num ; n++ ){ 
		char name[128] = {0}; 
		char addchar[10] = {0};
		strcpy(name ,obj_store);
		sprintf(addchar , "TM_%d" , n) ; 	
		strcat(name , addchar) ; 	


		stm_pos_tm_init(name) ; 	
		for( i=0 ; i < 500000; i++){ 
			ret_val = stm_pos_btree_insert(name,&static_key[i],
					&static_key[i] , 0);
			if(ret_val == -1){
				perror("[stm_list_insert] return error") ; 	
				exit(1) ; 	
			}		
		}
		stm_pos_tm_exit(name) ;
		return NULL ;	
	}
}  
int main(int argc, char *argv[])
{
	struct timeval T1,T2 ; 	
	int i = 0 ;	
	pthread_t *threads = NULL ; 	
	threads_num = 10 ; 	
	char *store_name = NULL ; 	
	int mode = 0 ; 
	printf("argc = %d\n" , argc) ;


	if( argc != 3 ){ 
		help() ; 	
		exit(1) ;
	}
	/* argument value setting */
	store_name = argv[1] ; 
	mode = atoi(argv[2]) ; 	
	obj_store = store_name ;

	PRINT("[GLOBAL_TEST] program informaction before start\n") ; 	
	#if HEAP_TINY_GLOBAL_COUNT_FLAGS == 0 
		printf("[GLOBAL_COUNT]: Declare only tinySTM\n") ; 	
	#elif HEAP_TINY_GLOBAL_COUNT_FLAGS == 1
		/* flag value is 1, declare variable on per object storage */ 
		printf("[GLOBAL_COUNT]: Declare per object storage\n") ; 		
	#endif 	
	#if HEAP_TINY_COMMIT_FLAGS == 1 
		printf("[COMMIT MODE]\n") ; 	
	#elif HEAP_TINY_COMMIT_FLAGS == 0 
		printf("[CHECKSUM MODE]\n") ; 	
	#endif 
	#if HEAP_TINY_DELAYED_CACHE_FLUSH_FLAGS == 1 
		printf("[DELAYED CACHE FLUSH MODE]:[o]\n") ;
	#elif HEAP_TINY_DELAYED_CACHE_FLUSH_FLAGS == 0
		printf("[DELAYED CACHE FLUSH MODE]:[x]\n") ; 
	#endif 
	printf("Press any key to start\n") ; 	
	getc(stdin) ;  


	/* address program information before start */ 	
	if( mode == 1 ){ 
		PRINT("mode [list insert]\n") ; 	
	}else if( mode == 2 ){ 
		PRINT("mode [hash insert]\n") ; 
	}else if( mode == 3 ){ 
		PRINT("mode [btree insert]\n") ; 
	}

	
	int a[10] = {0}; 	
	int q = 0 ; 	
	for(q = 0 ; q < 10 ; q++)
		a[q] = q; /* initialize parameter about stm operation*/  	
	for(q = 0 ; q < 3100000 ; q++)
		static_key[q] = q;  /* initialize key */ 
	/* record count per thread */	
	PRINT("[4] per_thread_count[%d]\n",per_thread_count) ; 	

	/* count for per thread operation */ 	
	if(( threads = (pthread_t *)malloc(threads_num * sizeof(pthread_t)))== NULL){
		perror("thread malloc error") ; 	
		exit(1); 	
	}/* thread create and error check */ 	

	int ret_val = 0 ; /*return value check */ 	

	int n = 0 ; 	
	printf("[Initialize %d Threads\n" , threads_num) ; 
	for( n = 0 ; n < threads_num ; n++ ){ /* until threads_num(10) */ 	
		char name[128] = {0} ; 	
		char addchar[10] = {0} ; 	
		strcpy( name , obj_store ) ; 	
		sprintf( addchar , "TM_%d" , n) ; 	
		strcat( name , addchar) ; 	
//		printf("[string about obj:%d]:%s\n" , n , name) ; 	
		if( mode == 1 ){ /* list insert operation */ 	
			DEBUG_PRINT("[%s][stm_pos_list_init]_called\n",__func__) ; 	
			ret_val = stm_pos_list_init(name) ; 		
			DEBUG_PRINT("[%s][stm_pos_list_open]_called\n",__func__) ; 	
			ret_val = stm_pos_list_open(name) ; 	
		}else if( mode == 2){ /* hash insert operation */ 	
			int rec_num = 8 ; /*hard coding will be changed */
			DEBUG_PRINT("[%s][stm_pos_create_hashtable]_called\n",__func__) ; 
			ret_val = stm_pos_create_hashtable(name,rec_num,NULL,NULL);
			DEBUG_PRINT("[%s][stm_pos_hashtable_open]_called\n" , __func__) ; 	
			ret_val = stm_pos_hashtable_open(name) ; 	
		}else if(mode == 3){ /* btree insert operation */ 	
			DEBUG_PRINT("[%s][stm_pos_btree_init]_called\n" , __func__) ; 	
			ret_val = stm_pos_btree_init(name); 
			DEBUG_PRINT("[%s][stm_pos_btree_open]_called\n" , __func__ ) ;
			ret_val = stm_pos_btree_open(name) ; 	
		} /* data structure init and open complete */
	}/* 10's object storage creating is finished */ 	

	
	DEBUG_PRINT("\n[%s][insert&remove operation part]\n" , __func__ );
	PRINT("\n\n[%s] Program Executing...\n", __func__ ) ;
	/* insert & remove operation part */
	if( mode == 1 ){ 
		gettimeofday(&T1,NULL);
		for(i = 0 ; i < threads_num ; i++){ 
			if(pthread_create(&threads[i],NULL,stm_list_insert,
				(void*)&a[i])!=0){
				fprintf(stderr,"error creating threads") ; 	
				exit(1) ; 	
			}
		}
		for(i = 0 ; i < threads_num ; i++){ 
			if(pthread_join(threads[i],NULL)!=0){
				fprintf(stderr,"error waiting threads") ; 	
				exit(1); 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2); /*calculate total response time*/
	}else if(mode == 2){ 
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < threads_num ; i++){ 
			if(pthread_create(&threads[i],NULL,stm_hash_insert, 
				(void*)&a[i])!=0){ 
				fprintf(stderr,"error creating threads") ; 	
				exit(1) ; 	
			}
		}	
		for( i = 0 ; i < threads_num ; i++){ 
			if( pthread_join(threads[i],NULL)!=0){ 
				fprintf(stderr,"error waiting threads") ; 	
				exit(1); 	
			}
		}	
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2); 
	}else if(mode == 3){ 
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < threads_num ; i++){ 
			if(pthread_create(&threads[i],NULL,stm_btree_insert, 
				(void*)&a[i])!=0){ 
				fprintf(stderr,"error creating threads") ; 	
				exit(1) ; 	
			}
		}	
		for( i = 0 ; i < threads_num ; i++){ 
			if( pthread_join(threads[i],NULL)!=0){ 
				fprintf(stderr,"error waiting threads") ; 	
				exit(1); 	
			}
		}	
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2); 
	} 	
	printf("[CLOSE ALL Object Storage]\n") ;
	for( n = 0 ; n < threads_num ; n++ ){ /* until threads_num(10) */ 	
		char name[128] = {0} ; 	
		char addchar[10] = {0} ; 	
		strcpy( name , obj_store ) ; 	
		sprintf( addchar , "TM_%d" , n) ; 	
		strcat( name , addchar) ; 	
//		printf("[string about obj:%d]:%s\n" , n , name) ; 	
		//obj_store = name ; 	
		if( mode == 1){stm_pos_list_close(name);}
		else if(mode == 2){stm_pos_hashtable_close(name);}
		else if(mode == 3){stm_pos_btree_close(name);}
	} 
	return 0 ; 
}
