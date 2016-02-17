/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "workload_list.h"
#include "v7_pmu.h"
#include "db.h"


/* total count can divide into thread number */
#define TOTAL_COUNT 252000
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
}
void help(){ 
	printf("[1] stm list insert\n") ; 
	printf("[2] stm hash insert\n") ; 	
	printf("[3] stm btree insert\n") ; 	
	return ; 	
}
void *stm_list_insert( void *data ){ 
	int i = 0 ; 	
	int dat = *(int *)data ; 
	int ret_dat = dat * per_thread_count ; 	
	int ret_val = 0 ; 	
	stm_pos_tm_init( obj_store ) ; 	
	for( i=0+ret_dat ; i < per_thread_count+ret_dat; i++){ 
		ret_val = stm_pos_list_insert(obj_store,&static_key[i],
				&static_key[i], 8) ; 	
		if(ret_val == -1){
			perror("[stm_list_insert] return error") ; 	
			exit(1) ; 	
		}		
	}
	stm_pos_tm_exit(obj_store) ; 
	return NULL ;	
} 
void *stm_hash_insert( void *data ){ 
	int i = 0 ; 	
	int dat = *(int *)data ; 
	int ret_dat = dat * per_thread_count ; 	
	int ret_val = 0 ; 	
	stm_pos_tm_init( obj_store ) ; 	
	for( i=0+ret_dat ; i < per_thread_count+ret_dat; i++){ 
		ret_val = stm_pos_hashtable_insert(obj_store,&static_key[i],
				&static_key[i], 8);
		if(ret_val == -1){
			perror("[stm_list_insert] return error") ; 	
			exit(1) ; 	
		}		
	}
	stm_pos_tm_exit(obj_store) ; 
	return NULL ;	
} 
void *stm_btree_insert( void *data ){ 
	int i = 0 ; 	
	int dat = *(int *)data ; 
	int ret_dat = dat * per_thread_count ; 	
	int ret_val = 0 ; 	
	stm_pos_tm_init( obj_store ) ; 	
	for( i=0+ret_dat ; i < per_thread_count+ret_dat; i++){ 
		ret_val = stm_pos_btree_insert(obj_store,&static_key[i],
				&static_key[i] , 0);
		if(ret_val == -1){
			perror("[stm_list_insert] return error") ; 	
			exit(1) ; 	
		}		
	}
	stm_pos_tm_exit(obj_store) ; 
	return NULL ;	
}  
int main(int argc, char *argv[])
{
	struct timeval T1,T2 ; 	
	int i = 0 ;	
	pthread_t *threads = NULL ; 	
	int threads_num = 0 ; 	
	char *store_name = NULL ; 	
	int mode = 0 ; 
	if( argc != 4 ){ 
		help() ; 	
		exit(1) ;
	}

	threads_num = atoi( argv[2] ) ; 	
	store_name = argv[1] ; 	
	mode = atoi(argv[3]) ; 	
	obj_store = store_name ; 	
	
	int a[10] = {0}; 	
	int q = 0 ; 	
	for(q = 0 ; q < 10 ; q++)
		a[q] = q; /* initialize parameter about stm operation*/  	
	for(q = 0 ; q < 3100000 ; q++)
		static_key[q] = q;  /* initialize key */ 
	
	per_thread_count = TOTAL_COUNT / threads_num;
	/* count for per thread operation */ 	
	if(( threads = (pthread_t *)malloc(threads_num * sizeof(pthread_t)))== NULL){
		perror("thread malloc error") ; 	
		exit(1); 	
	}/* thread create and error check */ 	

	int ret_val = 0 ; /*return value check */ 	

	if( mode == 1 ){ /* list insert operation */ 	
		ret_val = stm_pos_list_init(store_name) ; 	
		ret_val = stm_pos_list_open(store_name) ; 	
	}else if( mode == 2){ /* hash insert operation */ 	
		int rec_num = 8 ; /*hard coding will be changed */
		ret_val = stm_pos_create_hashtable(store_name,rec_num,NULL,NULL);
		ret_val = stm_pos_hashtable_open(store_name) ; 	
	}else if(mode == 3){ /* btree insert operation */ 	
		ret_val = stm_pos_btree_init(store_name); 
		ret_val = stm_pos_btree_open(store_name) ; 	
	} /* data structure init and open complete */
	
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
		stm_pos_list_close(store_name) ; 	
	
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
		stm_pos_hashtable_close(store_name);
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
		stm_pos_btree_close(store_name);
	} 	

	return 0 ; 
}
