#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <semaphore.h>
#include <time.h>
#include <stdint.h>
#include <string.h>

#define POS_DEBUG_LIST_TEST	1
#define BILLION 	1000000000L

//#define INSERT_COUNT            10000000

sem_t sem_threadID;

char TEST_OBJ_NAME[30];
//__thread unsigned long num[INSERT_COUNT][2];

pthread_mutex_t insert_mutex = PTHREAD_MUTEX_INITIALIZER;
unsigned int insert_count;
unsigned int gc_count;
int total_threads;

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
        unsigned long count=0; 
        unsigned long garbage_idx = 0; 

	//printf("check6\n");
 	id = *((int *)data);
	sem_post(&sem_threadID);
	count = insert_count;

        srand(time(NULL));
        for(i=0; i<count; i++) {
		val[0] = val[1] = rand()%100000+1;
                key[0] = key[1] = rand()%100000+1;
                if(pos_list_insert(TEST_OBJ_NAME, (void *)key, (void *)val, 8) < 0) {
                        printf("insertion failed!\n");
                }
		#if POS_DEBUG_LIST_TEST == 1
                printf("[Thead %d] INSERT[%lu]\n", id, i+1);
		#endif
        }

	#if POS_DEBUG_LIST_TEST == 1 
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
	unsigned long i;
	int sem_state;
        int obj_type=1; 
        int obj_size=32; 
        int key_num=2; 
        int val_num=2;
	unsigned long key[2];
	unsigned long val[2];
	int sem_retval = 1;
	struct timespec start_T, end_T;
	long long diff, sec;
	
	numOfThreads = atoi(argv[2]);
	strcpy(TEST_OBJ_NAME, argv[1]);
	insert_count = atoi(argv[3]);
	gc_count = atoi(argv[4])/2;
	gc_count = (insert_count * numOfThreads) - gc_count;

	sem_retval = sem_init(&sem_threadID, 0, 0);

	#if POS_DEBUG_LIST_TEST == 1 
        printf("[CREATE POS OBJECT]\n"); 
	#endif 
        if(pos_list_init(TEST_OBJ_NAME) < 0) { 
                printf("error of creating object storage!\n"); 
                return 0; 
        }
	syscall(402, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);

	#if POS_DEBUG_LIST_TEST == 1 
        printf("Object sotre %s is created as List.\n", TEST_OBJ_NAME); 
	#endif 
	//#if POS_DEBUG_LIST_TEST == 1
	//printf("[Parent : MAP LIST]\n");
	//printf("obj : %s\n", TEST_OBJ_NAME);
	//#endif 
        pos_map(TEST_OBJ_NAME); 

	#if POS_DEBUG_LIST_TEST == 1
	sleep(3);
        printf("[INSERT LIST NODES]\n");
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

	#if POS_DEBUG_LIST_TEST == 1
	sleep(10);
        printf("[MAKE GARBAGES]\n");
	#endif
        pos_delete_selected_node(TEST_OBJ_NAME, gc_count-1);
	#if POS_DEBUG_LIST_TEST == 1
	sleep(5);
       	//printf("[INSERT LIST ADDITIONAL NODES]\n");
	printf("[PERFORM GARBAGE COLLECTION]\n");
	#endif
	srand(time(NULL));
       	for(i=0; i<400; i++) {
               	key[0] = key[1] = rand()%100000+1;
		val[0] = val[1] = rand()%100000+1;
               	if(pos_list_insert(TEST_OBJ_NAME, (void *)key, (void *)val, 8) < 0) {
                       	printf("insertion failed!\n");
               	}
		#if POS_DEBUG_LIST_TEST == 1
       	        //printf("[USER] insert check[%lu]\n", i);
		#endif
       	}

	//clock_gettime(CLOCK_MONOTONIC, &end_T);
	//diff = BILLION * (end_T.tv_sec - start_T.tv_sec) + end_T.tv_nsec - start_T.tv_nsec;
	//sec = diff/(1000*1000*1000);
	
	//#if POS_DEBUG_LIST_TEST == 1    
        //printf("[DISTROY LIST]\n");
	//#endif
        pos_list_delete(TEST_OBJ_NAME);

	#if POS_DEBUG_LIST_TEST == 1 
        printf("[FINISH PROGRAM]\n");
	#endif
	//printf("\n\tTotal Time : %lld msec(%lld sec %lld min)\n\n", diff/(1000*1000), sec, sec/60);

    	return 0;
}
