#include<stdio.h>
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
int main(){ 
//	TM_INIT_THREAD ; 	
//	TM_START( 0 , RW) ; 	
//	int tmp = (int)TM_LOAD(&sum) ; 
//	tmp +=50 ; 	
//	TM_STORE(&sum , tmp) ; 	
//	TM_COMMIT;
//	return 0 ; 	
} 
