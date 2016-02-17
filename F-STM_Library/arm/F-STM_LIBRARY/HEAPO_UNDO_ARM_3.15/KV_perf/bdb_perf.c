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

#define BTREE	1	
#define HASH 	2
#define DB_DIRECTORY	"/tmp"
DB *db = NULL ; 	
DB_ENV *db_env = NULL ; 	
int kv_type ; 	
int log_flag = 1; 	

/* total count can divide into thread number */
#define TOTAL_COUNT 252000
int per_thread_count = 0 ; 	

static int static_key[3100000] = {0} ; 	
static int *rm_static_key[3100000] = {0} ; 	
static int check_static_key[3100000] = {0} ; 

void help(){ 
	printf("[1] stm list insert\n") ; 
	printf("[2] stm hash insert\n") ; 	
	printf("[3] stm btree insert\n") ; 	
	return ; 	
}
/************ TO DO LIST ***************
	1) sync operation 
	2) locking mechanism 
****************************************/

/* skeleton interface is here */
pthread_mutex_t stm_mutex = PTHREAD_MUTEX_INITIALIZER;
void stm_lock(){pthread_mutex_lock(&stm_mutex);}
void stm_unlock(){pthread_mutex_unlock(&stm_mutex);}

/* sync to secondary storage per 10000 insert */
void *bdb_hash_insert( void *data ){ 
	/* thread start and get count number */ 
	/* lock insert */ 
	stm_lock() ; 
	int i = 0 ; 	
	int dat = *(int *)data ; 	
	int ret_dat = dat * per_thread_count ; 		
	
	
	unsigned long long tmp_key[2] ; 	
	unsigned long long *tmp_value ; 	
	DBT key,value ; 	
	unsigned long cnt , i ; 	
	int rval ; 
	
	tmp_value = (unsigned long long *)malloc(rec_size) ; 	
	cnt = 1;  	
	memset(&key,0,sizeof(DBT)) ; 	
	memset(&value,0,sizeof(DBT)) ; 
	key.data = tmp_key ; 	
	key.size = 16; // 16 byte because of unsigned long long 8 byte 
	value.data = tmp_value ; 	
	value.size = rec_size ; 	
	value.ulen = rec_size ; 	
	value.flags = DB_DBT_USERMEM ; 	
	
	/* iterate until for end */
	for( i = 0+ret_dat ; i <per_thread_count+ret_dat ; i++){ 
		/* setting key and value */ 
		tmp_key[0] = tmp_key[1] = static_key[i] ; 	
		for( i = 0 ; i < rec_size/8 ; i++ ){ 
			tmp_value[i] = rec_num + static_key[i] ; 	
		}
		if(db->put(db , NULL , &key , &value , DB_NOOVERWRITE)!=0){
			perror("[BDB db->put failed]") ; 	
			exit(1) ; 	
		}
		// just for debug
		cnt++ ; 	
	}
	free(tmp_value) ; 	
	/* unlock insert */
	stm_unlock() ; 

	return cnt-1; 	
} 
void *bdb_btree_insert(void *data){ 
	bdb_hash_insert( data ) ; 
} 
int init_experiment( char *store_name){ 
	unsigned long env_flags , open_flags ; 
	int rval ; 
	env_flags = DB_CREAT | DB_INIT_MPOOL ; 
        if (log_flag == 1) {
                env_flags |= DB_RECOVER|DB_INIT_TXN|DB_INIT_LOG;
        }
        //env_flags |=  DB_THREAD|DB_INIT_LOCK;

        if (db_env_create(&db_env, 0) != 0) {
                printf("[BDB] db_env_create() fail!\n");
                return 0;
        }
        rval = db_env->set_cachesize(db_env, 0, 1024*1024*1024, 1);     // 0G + 1024M
        if (db_env->open(db_env, DB_DIRECTORY, env_flags, 0) != 0) {
                printf("[BDB] db_env->open() fail!\n");
                db_env->close(db_env, 0);
                return 0;
        }

        if(db_create(&db, db_env, 0) != 0) {
                printf("[BDB] db_create() fail!\n");
                return 0;
        }

        open_flags = DB_CREATE;
        if (log_flag == 1) {
                open_flags |= DB_AUTO_COMMIT;
        }
        if (kv_type == BTREE) {
                rval = db->open(db, NULL, store_name, NULL, DB_BTREE, open_flags, 0);
        } else if (kv_type == HASH) {
                rval = db->open(db, NULL, store_name, NULL, DB_HASH, open_flags, 0);
        }
        if (rval != 0) {
                printf("[BDB] db->open() fail!\n");
                return 0;
        }

        return 1;
} 
int terminate_experiment(char *store_name){ 
	db->close(db,0) ; 	
	return 1; 
} 
int main(int argc, char *argv[])
{
	struct timeval T1,T2 ; 	
	
	pthread_t *threads = NULL ; 	
	int thread_num = 0 ; 	
	char *store_name = NULL ; 	
	int mode = 0 ; 

	thread_num = atoi( argv[2] ) ; 	
	store_name = argv[1] ; 	
	mode = atoi(argv[3]) ; 	

	int a[10] = {0}; 	
	int q = 0 ; 	
	for(q = 0 ; q < 10 ; q++)
		a[q] = q; /* initialize parameter about stm operation*/  		
	for(q = 0 ; q < 3100000 ; q++) 
		static_key[q] = q ; /* insert key value setting */
	
	per_thread_count = TOTAL_COUNT / thread_num;
	/* count for per thread operation */ 	
	if(( threads == (pthread_t *)malloc(thread_num * sizeof(pthread_t)))
		== NULL){
		perror("thread malloc error") ; 	
		exit(1); 	
	}/* thread create and error check */ 	

	int ret_val = 0 ; /*return value check */ 	

	/* list is not exist in bdb lib */ 
	if( mode == 1 ){ /* hash function */ 
		kv_type = HASH ; 		
	}else if(mode == 2){ /* btree function */ 
		kv_type = BTREE ;
	}

	
	ret_val = init_experiment(store_name) ; 	
	if(ret_val != 1){ 
		perror("init_experiment error") ; 	
		exit(1) ; 	
	}
	/* insert & remove operation part */
	if( mode == 1 ){ /* hash insert */ 	 
		gettimeofday(&T1,NULL);
		for(i = 0 ; i < threads_num ; i++){ 
			if(pthread_create(&threads[i],NULL,bdb_hash_insert,
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
		ret_val = terminate_experiment(store_name) ; 	
		if(ret_val != 1){ 
			perror("terminate error") ; 	
			exit(1) ; 	
		}
	}else if(mode == 2){ 
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < threads_num ; i++){ 
			if(pthread_create(&threads[i],NULL,bdb_btree_insert, 
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
		ret_val = terminate_experiment(store_name) ; 	
		if(ret_val != 1){ 
			perror("terminate error") ; 	
			exit(1);
		}
	} 	

	return 0 ; 
}
