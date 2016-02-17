
#define RO      1
#define RW      0
#define TOT_TM	1
#define SUB_TM 	2
//#include "./tinySTM-1.0.5/include/stm.h"
//#include "./tinySTM-1.0.5/include/mod_ab.h"
//#include "./tinySTM-1.0.5/src/tls.h" 
//#include "./tinySTM-1.0.5/src/stm_internal.h" 
#include "/home/kunulee/Downloads/tinySTM-1.0.5/include/stm.h" 
#include "/home/kunulee/Downloads/tinySTM-1.0.5/include/mod_ab.h" 


#define TM_START(tid , ro)      { stm_tx_attr_t a = {{.id = tid, .read_only = ro}}; sigjmp_buf * _e = stm_start(a); if(_e != NULL) sigsetjmp(*_e, 0)
#define TM_LOAD(addr)           stm_load((stm_word_t *)addr) 
#define TM_STORE(addr , value)  stm_store((stm_word_t *)addr , (stm_word_t)value) 

#define TM_COMMIT               stm_commit(); } 
#define TM_INIT                 stm_init(); mod_mem_init(0); mod_ab_init(0,NULL);
#define TM_EXIT                 stm_exit();

/* pos interface */ 
/* INIT,EXIT save stack experience */ 
#define TM_POS_INIT(name)		stm_pos_create_object(name); stm_init(); mod_mem_init(0); mod_ab_init(0,NULL); 
#define TM_POS_EXIT(name) 		stm_pos_delete_object(name); stm_exit() ; 	
#define TM_POS_INIT_THREAD(name) 	stm_pos_init_thread() ; 	
#define TM_POS_EXIT_THREAD(name) 	stm_pos_exit_thread() ; 


#define TM_INIT_THREAD          stm_init_thread() ;     
#define TM_EXIT_THREAD          stm_exit_thread() ;   

#define TM_CHECK		stm_check() ;

#define CONSISTENCY             0
#define UNDO_CONSISTENCY        0 
#define KEONWOO_DEBUG           0 

/* print flags */ 
#ifndef KEONWOO_PRINT
#define KEONWOO_PRINT 0 
#endif 
#if KEONWOO_PRINT == 1 	
	#define PR_DEBUG(...)	printf(__VA_ARGS__);	
#else 
	#define PR_DEBUG(...) 
#endif 

/* sleep flags */ 
#ifndef KEONWOO_SLEEP 
#define KEONWOO_SLEEP 0 
#endif 

#if KEONWOO_SLEEP == 1 
	#define SLEEP_DEBUG(n)	sleep(n);
#else
	#define SLEEP_DEBUG(n) 
#endif 
/* sleep flags - end */ 




int stm_pos_tm_init() ; 	
int stm_pos_tm_exit() ; 
int stm_pos_tm_check(); 
