#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <semaphore.h>
#include <time.h>
#include <stdint.h>
#include <string.h>

#define POS_DEBUG_BTREE_TEST	1
#define BILLION 	1000000000L

//#define INSERT_COUNT            10000000

sem_t sem_threadID;

char TEST_OBJ_NAME[30];
//__thread unsigned long num[INSERT_COUNT][2];

pthread_mutex_t insert_mutex = PTHREAD_MUTEX_INITIALIZER;
unsigned int insert_count, total_threads;

// 쓰레드 함수
void *t_function(void *data)
{
    	int id;
	unsigned long i, j; 
        unsigned long key[2];
	unsigned long val[2];
        struct list_node *ln=NULL; 
        unsigned long count=0, a=0; 

 	id = *((int *)data);
	id = id-1;
	sem_post(&sem_threadID);
	count = insert_count;

        srand(time(NULL));
        for(i=0; i<count; i++) {
//printf("id : %d, count : %lu\n", id, count);
                key[0] = key[1] = 30000 + (id * count) + i;
		//key[0] = key[1] = 30000 + i;
//printf("chk2\n");
                val[0] = val[1] = rand()%1000+500;
//printf("chk3\n");
                if(pos_btree_insert(TEST_OBJ_NAME, (void *)key, (void *)val, 8) < 0) {
                        printf("insertion failed!\n");
                }
#if POS_DEBUG_BTREE_TEST == 1
                //printf("[%d : USER] INSERT[%lu]\n", id, (id*count)+i);
		printf("[Thead %d] INSERT[%lu]\n", id, i+1);
#endif
        }
 
	#if POS_DEBUG_BTREE_TEST
	printf("[Thead %d] INSERTION COMPLETE\n", id);
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
        int obj_type=2; 
        int obj_size=120; 
        int key_num=5;
        int val_num=5;
	unsigned long key[2], val[2], tmp_key[2];
	int sem_retval = 1;
	struct timespec start_T, end_T;
	long long diff, sec;
	int garbage_count=0;
	
	numOfThreads = atoi(argv[2]);
	strcpy(TEST_OBJ_NAME, argv[1]);
	insert_count = atoi(argv[3]);
	garbage_count = atoi(argv[4]);
	//num_of_garbage /= 2;
	//number_of_garbage = (insert_count * numOfThreads) - gc_count;
	
	total_threads = numOfThreads;
	sem_retval = sem_init(&sem_threadID, 0, 0);

	#if POS_DEBUG_BTREE_TEST == 1 
        printf("[CREATE POS OBJECT]\n"); 
	#endif 
        if(pos_btree_init(TEST_OBJ_NAME) < 0) { 
                printf("error of creating object storage!\n"); 
                return 0; 
        }
	syscall(402, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);

	count = insert_count * numOfThreads;

        #if POS_DEBUG_BTREE_TEST == 1 
        printf("Object sotre %s is created as Btree.\n", TEST_OBJ_NAME); 
        #endif 
//	#if POS_DEBUG_BTREE_TEST == 1
//	printf("[Parent : MAP BTREE]\n");
//	printf("obj : %s\n", TEST_OBJ_NAME);
//	#endif 
        pos_map(TEST_OBJ_NAME); 

	#if POS_DEBUG_BTREE_TEST == 1
	sleep(3);
        printf("[INSERT BTREE NODES]\n");
	#endif
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

#if POS_DEBUG_BTREE_TEST == 1
	sleep(10);
        printf("[MAKE GARBAGES]\n");
#endif
        unlink_leaf_nodes(TEST_OBJ_NAME, garbage_count);

#if POS_DEBUG_BTREE_TEST == 1
	sleep(5);
        //printf("[INSERT BTREE ADDITIONAL NODES]\n");
	printf("[PERFORM GARBAGE COLLECTION]\n");
#endif
        a = count;
        //for(i=0; i<43; i++) {
	for(i=0; i<200; i++) {
                key[0] = key[1] = 30000+a;
                val[0] = val[1] = rand()%1000+500;
                if(pos_btree_insert(TEST_OBJ_NAME, (void *)key, (void *)val, 8) < 0) {
                        printf("insertion failed!\n");
                }
#if POS_DEBUG_BTREE_TEST == 1
                //printf("[USER] INSERT[%lu]\n", i);
#endif
                a++;
        }

//	clock_gettime(CLOCK_MONOTONIC, &end_T);
//	diff = BILLION * (end_T.tv_sec - start_T.tv_sec) + end_T.tv_nsec - start_T.tv_nsec;
//	sec = diff/(1000*1000*1000);
	
	//#if POS_DEBUG_BTREE_TEST == 1    
        //printf("[DISTROY LIST]\n");
	//#endif
        //pos_list_delete(TEST_OBJ_NAME);

//	pos_unmap(TEST_OBJ_NAME);
//	#if POS_DEBUG_BTREE_TEST == 1 
 //       printf("[FINISH PROGRAM]\n");
//	#endif
	//printf("\n\tTotal Time : %lld msec(%lld sec %lld min)\n\n", diff/(1000*1000), sec, sec/60);

    	return 0;
}
