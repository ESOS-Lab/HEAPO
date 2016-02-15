/* ESOS Header */ 
#ifndef ESOS_H
#define ESOS_H 
char *tiny_obj_store; 

/*******************************************
	TINY_DEBUG 
		COMMIT_PRINT
		CHECKSUM_PRINT

******************************************/
#define TINY_DEBUG 0 /* manage all debug_print */ 


#define HEAP_TINY_FLAGS 1
#define KEONWOO_DEBUG 1

//#define COMMIT_DELAYED_FLAGS 		1  /* commit , delayed flags */ 	
//#define COMMIT_NON_DELAYED_FLAGS 	0  /* commit , non-delayed flags */ 
//#define CHECKSUM_DELAYED_FLAGS		0  /* checksum , delayed flags */ 
//#define CHECKSUM_NON_DELAYED_FLAGS 	0  /* checksum , non-delayed flags */ 

//#if COMMIT_DELAYED_FLAGS == 1 
//	#define HEAP_TINY_COMMIT_FLAGS 			1
//	#define HEAP_TINY_DELAYED_CACHE_FLUSH_FLAGS 	1

//#elif COMMIT_NON_DELAYED_FLAGS == 1 
//	#define HEAP_TINY_COMMIT_FLAGS			1
//	#define HEAP_TINY_DELAYED_CACHE_FLUSH_FLAGS 	0
//#elif CHECKSUM_DELAYED_FLAGS == 1 
	
//#elif CHECKSUM_NON_DELAYED_FLAGS == 1 
//
//#endif



/* commit mark and check sum flag */
#define HEAP_TINY_COMMIT_FLAGS 0 /* if commit flags use, */ 
#define HEAP_TINY_CHECKSUM_FLAGS 1   /* if checksum use */ 
/* refer to commit debug */ 
#if TINY_DEBUG == 1
	#define COMMIT_PRINT(...)	printf(__VA_ARGS__); 
#else
	#define COMMIT_PRINT(...) 	
#endif
/* refer to checksum debug */ 
#if TINY_DEBUG == 1 
	#define CHECKSUM_PRINT(...) 	printf(__VA_ARGS__) ; 	
#else
	#define CHECKSUM_PRINT(...) 
#endif 


/* delayed cache flush mark */ 
#define HEAP_TINY_DELAYED_CACHE_FLUSH_FLAGS 1  /* flag for delayed cache flush */ 
/* If this flag set 0, clflush will occured per operation(TM_STORE). 
 	and If this flag set 1, clflush will delayed until commit(TM_COMMIT) */

/* global count whether per thread or tinySTM */
#define HEAP_TINY_GLOBAL_COUNT_FLAGS 1 /* flag for global count */ 
/* If this flag set 0, declare global count to tinySTM 
        and If this flags value is 1, global count is declared per object storage */



/* sequence number */
#define HEAP_TINY_SEQ_FLAGS 1 

#define SEQ_DEBUG 1 

/* Recovery flags */ 
#define HEAP_TINY_RECOVERY_FLAGS 1


#endif 
