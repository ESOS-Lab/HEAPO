#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <semaphore.h>
#include <time.h>
#include <stdint.h>
#include <string.h>

#define POS_DEBUG_HASH_TEST	1
#define BILLION 	1000000000L

//#define INSERT_COUNT            10000000

sem_t sem_threadID;

char TEST_OBJ_NAME[30];
//__thread unsigned long num[INSERT_COUNT][2];

pthread_mutex_t insert_mutex = PTHREAD_MUTEX_INITIALIZER;
unsigned int insert_count, num_of_garbage, prime_num, total_threads;

// 쓰레드 함수
void *t_function(void *data)
{
    	int id;
	unsigned long i, j; 
        unsigned long key[2];
	unsigned long val[2];
        struct list_node *ln=NULL; 
        int obj_type=1; 
        int obj_size=32; 
        int key_num=2; 
        int val_num=2; 
        unsigned long count=0, a=0; 

 	id = *((int *)data);
	sem_post(&sem_threadID);
	count = insert_count;

        srand(time(NULL));
	#if POS_DEBUG_HASH_TEST == 1
        printf("[INSERT HASH NODES]\n");
	#endif
        count = count/2;
//printf("[%d: USER] count : %d\n", id, count);
//printf("[%d: USER] prime_num : %d\n", id, prime_num);
//printf("[%d: USER] num_of_garbage : %d, total_threads : %d\n", id, num_of_garbage, total_threads);

        for(i=0; i<num_of_garbage/total_threads; i++) {
                val[0] = val[1] = rand()%10000+9999;
                //key[0] = key[1] = prime_num * i;
		key[0] = key[1] = prime_num * (i + (num_of_garbage/total_threads));

                if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)key, (void *)val, 8)) {
                        printf("insertion failed!\n");
                }
                a++;
		#if POS_DEBUG_HASH_TEST == 1
                printf("[%d: USER] INSERT[%lu]\n", id, a);
		#endif
        }
        for(i=0; i<count-(num_of_garbage/total_threads); i++) {
                val[0] = val[1] = rand()%10000+9999;
                //key[0] = key[1] = prime_num * i + 1;
		key[0] = key[1] = prime_num * (i + (num_of_garbage/total_threads)) + 1;

                if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)key, (void *)val, 8)) {
                        printf("insertion failed!\n");
                }
                a++;
		#if POS_DEBUG_HASH_TEST == 1
                printf("[%d: USER] INSERT[%lu]\n", id, a);
		#endif
        }

	#if POS_DEBUG_HASH_TEST
	printf("[%d: FINISH WORK]\n", id);
	#endif

	return 0;
}

int main(int argc, char *argv[])
{
    	pthread_t p_thread[100];
    	int thr_id;
    	int status;
    	int threadID= 1;
	int numOfThreads = 0;
	unsigned long i, j, a;
	unsigned long count;
	int sem_state;
        int obj_type=3; 
        int obj_size=40; 
        int key_num=2;
        int val_num=2;
	unsigned long key[2], val[2], tmp_key[2];
	int sem_retval = 1;
	struct timespec start_T, end_T;
	long long diff, sec;
	
	numOfThreads = atoi(argv[1]);
	strcpy(TEST_OBJ_NAME, argv[2]);
	insert_count = atoi(argv[3]);
	num_of_garbage = atoi(argv[4]);
	num_of_garbage /= 2;
	//number_of_garbage = (insert_count * numOfThreads) - gc_count;
	
	total_threads = numOfThreads;
	sem_retval = sem_init(&sem_threadID, 0, 0);

	#if POS_DEBUG_HASH_TEST == 1 
        printf("[Parent : INIT HASH]\n"); 
	#endif 
        if(pos_create_hashtable(TEST_OBJ_NAME, 10, NULL, NULL) < 0) { 
                printf("error of creating object storage!\n"); 
                return 0; 
        }
	syscall(402, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);

	count = insert_count * numOfThreads;
        srand(time(NULL));
        count = count/2;
        if (count < 64) {
                prime_num = 97;
        } else if (count < 127) {
                prime_num = 193;
        } else if (count < 255) {
                prime_num = 389;
        } else if (count < 501) {
                prime_num = 769;
        } else if (count < 1004) {
                prime_num = 1543;
        } else if (count < 2003) {
                prime_num = 3079;
        } else if (count < 3999) {
                prime_num = 6151;
        } else if (count < 7988) {
		prime_num = 12289;
	} else {
		prime_num = 24593;
	}

	#if POS_DEBUG_HASH_TEST == 1
	printf("[Parent : MAP LIST]\n");
	printf("obj : %s\n", TEST_OBJ_NAME);
	#endif 
        pos_map(TEST_OBJ_NAME); 

	// 쓰레드 생성 아규먼트로 1 을 넘긴다.
	clock_gettime(CLOCK_MONOTONIC, &start_T);
	for(i=0; i<numOfThreads; i++) {
    		thr_id = pthread_create(&p_thread[i], NULL, t_function, ((void *)&threadID));
		sem_wait(&sem_threadID);
    		if (thr_id < 0)
   	 	{
      		  	perror("thread create error : ");
       		 	exit(0);
   	 	}
		else if(thr_id > 0) {
			printf("Thread(%d) is created!\n", threadID); 
			break;
		}
		threadID++;
	}

    	// 쓰레드 종료를 기다린다. 
	for(i=0; i<numOfThreads; i++) {
    		pthread_join(p_thread[i], (void **)&status);
	}

	#if POS_DEBUG_HASH_TEST == 1
        printf("[MAKE GARBAGES]\n");
	#endif
	pos_hashtable_remove2(TEST_OBJ_NAME, 0);

	#if POS_DEBUG_HASH_TEST == 1
       	//printf("[INSERT LIST ADDITIONAL NODES]\n");
	printf("[GC TRIGGER]\n");
	#endif
	srand(time(NULL));
        a = 0;
//printf("prime_num : %lu\n", prime_num);
//printf("num_of_garbage : %lu\n", num_of_garbage);
        for(i=0; i<500; i++) {
                for(j=0; j<2; j++) {
                        val[0] = val[1] = rand()%10000+9999;
                        //tmp_key[0] = tmp_key[1] = j + (prime_num*i);
                        //key[a] = tmp_key[0];
			key[0] = key[1] = j + (prime_num*i);
                        if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)key, (void *)val, 8)) {
                                printf("insertion failed!\n");
                        }
#if POS_DEBUG_HASH_TEST == 1
                        //printf("[USER] INSERT[%lu]\n", a);
#endif
                        ++a;
                }
        }

	clock_gettime(CLOCK_MONOTONIC, &end_T);
	diff = BILLION * (end_T.tv_sec - start_T.tv_sec) + end_T.tv_nsec - start_T.tv_nsec;
	sec = diff/(1000*1000*1000);
	
	//#if POS_DEBUG_HASH_TEST == 1    
        //printf("[DISTROY LIST]\n");
	//#endif
        //pos_list_delete(TEST_OBJ_NAME);

	#if POS_DEBUG_HASH_TEST == 1 
        printf("[FINISH PROGRAM]\n");
	#endif
	//printf("\n\tTotal Time : %lld msec(%lld sec %lld min)\n\n", diff/(1000*1000), sec, sec/60);

    	return 0;
}
