#include<stdio.h>
#include<assert.h> 
#include<getopt.h>
#include<limits.h> 
#include<signal.h> 
#include<sys/time.h> 
#include<pthread.h>

#include "stm.h" 
#include "mod_ab.h" 

#define MAX_THREAD 1000

#define RO	1
#define RW	0
#include<time.h> 

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER; 	
void lock(){ pthread_mutex_lock( &mutex );} 
void unlock(){ pthread_mutex_unlock(&mutex);} 

void print_time(struct timeval T1 , struct timeval T2){
        long sec, usec ;
        double time;
        double rate ;
        time_t t ;
        if( T1.tv_usec > T2.tv_usec ){
                sec = T2.tv_sec - T1.tv_sec - 1;
                usec = 1000000 + T2.tv_usec - T1.tv_usec ;
        }else{
                sec = T2.tv_sec - T1.tv_sec ;
                usec = T2.tv_usec - T2.tv_usec ;
        }
        time = (double)sec + (double)usec/1000000;
        printf("[Time]:%8ld sec %06ld us\n" , sec , usec) ;

}


/*#define START(id,ro)	{sigjmp_buf *_e = stm_get_env(); stm_tx_attr_t _a = {id,ro}; sigsetjmp(*_e,0); stm_start(_a)
#define LOAD(addr)	stm_load((stm_word_t *)addr) 
#define STORE(addr,value) stm_store((stm_word_t *)addr , (stm_word_t)value)
#define COMMIT	stm_commit();} 
*/ 	

#define TM_START(tid , ro) 	{ stm_tx_attr_t a = {{.id = tid, .read_only = ro}}; sigjmp_buf * _e = stm_start(a); if(_e != NULL) sigsetjmp(*_e, 0)
#define TM_LOAD(addr) 		stm_load((stm_word_t *)addr) 
#define TM_STORE(addr , value) 	stm_store((stm_word_t *)addr , (stm_word_t)value) 
#define TM_COMMIT		stm_commit(); } 


#define TM_INIT_THREAD 		stm_init_thread() ; 	
#define TM_EXIT_THREAD		stm_exit_thread() ; 	
static int sum = 0 ; 	
int function_call(){ 
	int tmp = 0 ; 	
//	TM_START( 0 , RW ) ;	
	tmp = (int)TM_LOAD(&sum) ; 	
	//TM_COMMIT;  	
	tmp = tmp+1;
	return tmp ;
//	TM_COMMIT ; 	
//	TM_START( 1 , RW ) ; 	
//	TM_STORE(&sum , tmp) ;  
	//return tmp; 
//	TM_COMMIT ; 
} 
int save_call(int tmp){ 
	TM_STORE(&sum , tmp) ; 		
}
int function_call2(){ 
	int tmp ; 	
//	TM_START(1, RW) ; 	
	tmp = (int)TM_LOAD(&sum) ; 	
	tmp = tmp+1; 	
//	TM_COMMIT ; 
	return tmp ; 	
}  
int save_call2(int tmp){ 
	printf(" b sum : %d\n" , sum) ; 	
	TM_START(1, RW) ; 	
	TM_STORE(&sum , tmp) ; 	
	printf(" c sum : %d\n" , sum); 
	TM_COMMIT ; 	
	printf(" a sum : %d\n" , sum) ;
//	printf(" a sum : %d\n" , sum) ; 
}
int function(){ 
	//TM_START( 2, RW) ; 	
	int tmp ; 	
	TM_START(2, RW) ; 	
	tmp = (int)TM_LOAD(&sum) ; 	
	tmp = tmp+1;
//	printf("sbum = %d\n", sum) ; 	
	TM_STORE(&sum ,tmp) ; 	
	TM_COMMIT; 
//	printf("abum = %d\n",sum) ; 	
} 
int function2(){ 
	int tmp ; 	
	TM_START(2, RW) ; 	
	tmp = (int)TM_LOAD(&sum) ; 	
	tmp = tmp+1;
	printf(" sum : %d\n", sum) ; 	
	TM_STORE(&sum ,tmp) ; 	
		printf("after sum : %d\n" ,sum) ;
	TM_COMMIT; 
}  
int thread_main( void * arg ){ 
	TM_INIT_THREAD ; // create Transaction // 
//	TM_START( 0 , RW ) ; 	
	int i = 0 ; 	
	for( i = 0 ; i < 3000 ; i++){ 
		TM_START(1, RW) ; 	
//		function();
		function2();
		TM_COMMIT ;
	//	TM_START(1,RW); 
	//	int tmp = function_call2() ; 	
	//	save_call2(tmp) ;
	//	TM_COMMIT;  	
		//int tmp = (int)TM_LOAD(&sum) ; 	
		//int tmp = sum ; 
		//tmp = tmp+1 ; 	
		//TM_STORE(&sum , tmp); 
		//printf("%d\n" , sum) ; 
		//sum = tmp ; 
	}
		
//	TM_COMMIT;
	TM_EXIT_THREAD ; 
//	TM_COMMIT ; 	
} 
int main(void){ 
	int a ; 	
	pthread_t thread[30] ; 	
	int thread_info[30] ; 	
	int thread_num = 30;  	
	int status = 0 ; 	
	
	int i = 0 ; 	
	for( i = 0 ; i < 30 ; i++) thread_info[i] = i ; 
	printf("initializaing tinySTM\n") ; 	

//	stm_init() ; 
	printf("initializing end\n") ; 	
	struct timeval T1, T2 ; 	
	gettimeofday( &T1 , NULL ) ; 	
	for( i = 0 ; i < thread_num ; i++){ 
		int ret = pthread_create(( pthread_t*)&thread[i],NULL,(void*)thread_main, &thread_info[i]) ; 	
	}
	for( i = 0 ; i < thread_num ; i++){ 
		pthread_join(thread[i] , (void **)&status) ; 
	}
	gettimeofday(&T2 , NULL) ; 	
	print_time(T1 ,T2) ; 
	printf(" delete tinySTM\n") ; 
//	stm_exit();  	
	printf(" delete end\n") ;
	printf("sum = %d\n" , sum) ; 
	return 0 ;
} 
