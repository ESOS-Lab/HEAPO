#include<pthread.h> 
#include<stdio.h>
#include "atomic.h" 
//#include "stm.h"
//#include "mod_ab.h"
#define RO 1
#define RW 1

#define TM_START(tid , ro)      { stm_tx_attr_t a = {{.id = tid, .read_only = ro}}; sigjmp_buf * _e = stm_start(a); if(_e != NULL) sigsetjmp(*_e, 0)
#define TM_LOAD(addr)           stm_load((stm_word_t *)addr) 
#define TM_STORE(addr , value)  stm_store((stm_word_t *)addr , (stm_word_t)value) 
#define TM_COMMIT               stm_commit(); } 


#define TM_INIT_THREAD          stm_init_thread() ;     
#define TM_EXIT_THREAD          stm_exit_thread() ;   
static int sum =0 ; 
int thread_main(void * arg){
	int i =0 ; 	
	for( i = 0 ; i < 50000 ; i++){  
/*		int lsum = sum ; 	
		lsum++ ; 	
		printf("lsum\n") ;
		sum = lsum ;
		printf("lsum\n"); */ 
		//ATOMIC_LOAD(&sum) ; 	
		printf("lsum\n") ;
	ATOMIC_FETCH_INC_FULL(&sum);	
		printf("lsum") ; 	
	}
	
//	ATOMIC_FETCH_INC_FULL(&sum);	
//	ATOMIC_LOAD(&sum) ;
//	printf("sum = %d\n",sum) ; 	
//	ATOMIC_STORE(&sum,1) ;
//	printf("sum = %d\n " ,sum) ;
} 
int main(){ 
        int a ;
        pthread_t thread[5] ;
        int thread_info[5] ;
        int thread_num = 5;
        int status = 0 ;

        int i = 0 ;
        for( i = 0 ; i < thread_num ; i++) thread_info[i] = i ;
        printf("initializaing tinySTM\n") ;
        for( i = 0 ; i < thread_num ; i++){
                int ret = pthread_create(( pthread_t*)&thread[i],NULL,(void*)thread_main, &thread_info[i]) ;
        }
        for( i = 0 ; i < thread_num ; i++){
                pthread_join(thread[i] , (void **)&status) ;
        }
	printf(" sum = %d\n " , sum) ;

//	TM_INIT_THREAD ; 	
//	TM_START( 0 , RW) ; 	
//	int tmp = (int)TM_LOAD(&sum) ; 
//	tmp +=50 ; 	
//	TM_STORE(&sum , tmp) ; 	
//	TM_COMMIT;

	return 0 ; 	
} 
