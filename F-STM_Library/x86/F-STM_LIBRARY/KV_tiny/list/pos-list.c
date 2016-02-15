/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../pos-lib.h"
#include <unistd.h>

#include "pos-list.h"
#include "../stm_lib/pos_stm.h"

#define RO 1 
#define RW 0

//#include "stm.h"
//#include "mod_ab.h"
#define TM_START(tid , ro)      { stm_tx_attr_t a = {{.id = tid, .read_only = ro}}; sigjmp_buf * _e = stm_start(a); if(_e != NULL) sigsetjmp(*_e, 0)
#define TM_LOAD(addr)           stm_load((stm_word_t *)addr) 
#define TM_STORE(addr , value)  stm_store((stm_word_t *)addr , (stm_word_t)value) 

#define TM_COMMIT               stm_commit(); } 
#define TM_INIT                 stm_init(); mod_mem_init(0); mod_ab_init(0,NULL);
#define TM_EXIT                 stm_exit();

#define TM_INIT_THREAD          stm_init_thread() ;     
#define TM_EXIT_THREAD          stm_exit_thread() ;   


#define CONSISTENCY 0
#define KEONWOO_DEBUG 0 


#define MODE			1	// 1: absolute addressing, 2: offset addressing
#define OFFSET_BASE		(0x3FFEF8000000)
#define pos_write_value	pos_write_value_kv



#include <pthread.h> 
#define stm_debug 0 
pthread_mutex_t s_mutex = PTHREAD_MUTEX_INITIALIZER ; 	
void lock(){ pthread_mutex_lock(&s_mutex);} 
void unlock(){ pthread_mutex_unlock(&s_mutex);} 

pthread_mutex_t l_mutex = PTHREAD_MUTEX_INITIALIZER ; 	
void llock(){ pthread_mutex_lock(&l_mutex);} 
void lunlock(){ pthread_mutex_unlock(&l_mutex);} 
// global variable core_num and flags_num
int core_num = -1; 	
int flags_num =0 ; 
#define NORMAL_ROUTINE 0x1 
#define LOCK_ROUTINE 0x2
#define STM_ROUTINE 0x4 
int t_pos_tm_init(){ //whether STM routine or not. 
//        if(!((flags_num & NORMAL_ROUTINE) && (flags_num & STM_ROUTINE ))){
 //     		PR_DEBUG("[Lock or Normal Routine]\n") ; 	
//		return -1; 	
//	}
	TM_INIT_THREAD ; 	
	return 0 ;	

}
int t_pos_tm_exit(){ //whether STM routine or not.  
//	if(!((flags_num & NORMAL_ROUTINE) && (flags_num & STM_ROUTINE ))){ 
//		PR_DEBUG("[Lock or Normal Routine]\n") ; 	
//		return -1; 	
//	}
	TM_EXIT_THREAD ; 
	return 0 ; 
} 
int t_pos_list_init( char * name , int thread_num){ 
	#if (KEONWOO_DEBUG == 1) 
	PR_DEBUG("[%s] name,[%d]:thread_num\n",name,thread_num);
	#endif 
	if(core_num == -1){ 
		core_num = sysconf( _SC_NPROCESSORS_CONF) ;
		#if (KEONWOO_DEBUG == 1)
		PR_DEBUG("[%d]:core_num\n" ,core_num) ;
		#endif 
	}
	if( thread_num == 1 ){ 
		flags_num = NORMAL_ROUTINE ; 	
	}else if( thread_num > core_num ){ 
		flags_num = LOCK_ROUTINE | NORMAL_ROUTINE ; 	
	}else if( thread_num != 1 && thread_num <= core_num ){ 
		flags_num = STM_ROUTINE | NORMAL_ROUTINE ; 	
	}
	if( (flags_num & NORMAL_ROUTINE) && (flags_num & STM_ROUTINE )){ 
		#if (KEONWOO_DEBUG == 1)
		PR_DEBUG("STM ROUTINE\n") ; 	
		// software transactional memory initialization
		#endif  	
	//	PR_DEBUG("[TM_INIT]\n") ;	
	//	TM_INIT ; 	
	}else if( (flags_num & NORMAL_ROUTINE) && (flags_num & LOCK_ROUTINE)){ 
		#if (KEONWOO_DEBUG == 1)
		PR_DEBUG("LOCK ROUTINE\n") ; 	
		#endif 
	}else if( ( flags_num == 0x01 ) ){ 
		#if (KEONWOO_DEBUG == 1)
		PR_DEBUG("[NORMAL ROUTINE\n") ;
		#endif 
	}
	
	struct list_head * head ; 	
	#if (KEONWOO_DEBUG == 1)
	PR_DEBUG("[%s]:object name\n",name) ; 	
	#endif 	
	if(pos_create(name) == 0){ 
		PR_DEBUG("[pos_create] already create\n") ; 
		return -1;
	}
	head = (struct list_head *)pos_malloc(name ,sizeof(struct list_head)) ;	
	pos_set_prime_object(name , head) ; 	
	head->head = NULL ; 	
	pos_unmap(name) ; 	
	return 0 ; 	
} 
int t_pos_list_open(char *name, int thread_num)
{
	PR_DEBUG("[t_pos_list_open] called\n") ;
        if (!pos_map(name) == 1){ 
		PR_DEBUG("[pos_map] already mapped\n") ;
		return -1; 
	}// In this case -1 return is not error value
	return 0 ;
}


int pos_list_init(char *name)
{
	struct list_head *head;
	PR_DEBUG("%s name \n", name ) ;	
	if (pos_create(name) == 0)
		return -1;

#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
	pos_log_create(name);
	pos_transaction_start(name, POS_TS_INSERT);
	#endif
#endif
	head = (struct list_head *)pos_malloc(name, sizeof(struct list_head));
	
	// Keonwoo Consistency Point//
	// IF crash here, garbage created because of function pos_malloc. 

	pos_set_prime_object(name, head);
	head->head = NULL;

#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 
	pos_transaction_end(name);
	pos_log_unmap(name);
	#endif
#endif
	pos_unmap(name);
	return 0;
}

int pos_list_destroy(char *name)
{
	pos_map(name);
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 
	pos_log_map(name);
	pos_log_delete(name);
	#endif 
#endif
	pos_delete(name);

	return 0;
}
int pos_list_open(char *name)
{
	#if UNDO_CONSISTENCY == 0 
	#endif
	if (pos_map(name) == 1) {
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
		pos_log_map(name);

		// If transaction was ended abnormally.
		// Recovery is executed.
		pos_recovery(name);
	#endif
#endif
		return 0;
	} else
		return -1;
}

void pos_list_close(char *name)
{
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 
	pos_log_unmap(name);
	#endif
#endif
	pos_unmap(name);
}
struct list_head* pos_count(char * name){ 
	struct list_head * head ; 	
	struct list_node * node ; 	
	head = (struct list_head *)pos_get_prime_object(name); 
	PR_DEBUG("[pos_count] :%p\n" , head) ;
	node = head->head ; 	
	int cnt = 0 ; 	
	while(node){ 
		PR_DEBUG("[%d] node : %p\n" , cnt , node) ; 	
		cnt++; 	
		node = node->next ; 	
	}
	PR_DEBUG("node count : %d\n" , cnt) ; 	
	return 1; 


}
// (char * name , void * _key , int flags ){ 
/* flags == 0 normal flags == 1 lock flags == 2 stm flags == 3 selectvie */
int t_pos_list_remove( char *name , void *_key, int thread_num){ 
        struct list_head * head;
        struct list_node *node, *prev_node;
        unsigned long *key;
        unsigned long *k ;
        int i;
        struct list_node * next ;

        key = (unsigned long *)_key;
        head = (struct list_head *)pos_get_prime_object(name);

        TM_START(2, RW);
        prev_node = (struct list_node *)TM_LOAD(&head->head) ;
        next = (struct list_node *)TM_LOAD(&prev_node->next) ;
        // modified in here to set prev_node 
        while( prev_node ){
                if( (next == NULL ) && ( prev_node != NULL ) ){
                        //last node ;
                        #if (KEONWOO_DEBUG == 1)
                        PR_DEBUG("Last Node\n") ;
                        #endif
                        if( key_cmp(prev_node->key , key)==1){
                                node = (struct list_node *)
                                        TM_LOAD(&prev_node->next);
                                if(node==NULL) node = 0 ;
                                //head->head = node ; 
                                //TM_STORE(prev_node , node ) ;         
                                TM_STORE(&head->head , node) ;
                                PR_DEBUG("prev_node : %p\n" , prev_node) ;
                                break;
                        }
                }
               if(key_cmp(next->key , key) == 1){ // if match
                        node = ( struct list_node *)TM_LOAD(&next->next) ;
                        TM_STORE(&prev_node->next , node ) ;
                        pos_clflush_cache_range( &prev_node->next, sizeof(struct list_node)) ;
                        goto ret;
                }
                prev_node = next ;
                next = (struct list_node *)TM_LOAD(&next->next) ;
        }

        ret:
        TM_COMMIT ;
        // after commit
/*      if( next != NULL ){ 
        r_lock() ;
        pos_free(name , next->value) ;
        pos_free(name , next) ;
        r_unlock() ;    
        }*/
        return 0;
} 
int t_t_pos_list_remove( char * name , void *_key){ 
	if( flags_num & NORMAL_ROUTINE ){ 
		struct list_head * head ; 	
		struct list_node * node , ** prev_node ; 	
		// stm prev
		struct list_node * sprev_node ; 	
		struct list_node * next ;
		unsigned long * key ; 	
		
		key = (unsigned long *)_key ; 	
		head = (struct list_head *)pos_get_prime_object(name) ; 	
		
		if( flags_num & LOCK_ROUTINE ){ // if lock flags settings. 
			llock() ; //lock 
			prev_node = &head->head ; 	
			node = head->head ; 	
			while(node){ 
				if( key_cmp( node->key , key ) == 1 ){ 
					*prev_node = node->next ; 	
					PR_DEBUG("%p\n" , node->next) ;
					/* 
					pos_free(name , node->value) ; 	
					pos_free(name , node) ; 	
					*/
					pos_clflush_cache_range( prev_node , sizeof(struct list_node)) ; 	

					lunlock() ; //unlock 
					return 0 ; 	
				}
				prev_node = &node->next ; 	
				node = node->next ; 	
			}
			lunlock() ; //unlock
			return -1;	
		}else if( flags_num & STM_ROUTINE ){ //if stm flags settings. 
			/*PR_DEBUG("DA\n") ;
			TM_START(2,RW) ; 
			struct list_node * p , * n ; 	
			p = (struct list_node *)TM_LOAD(&head->head) ; 		
			PR_DEBUG("A\n") ;
			n = (struct list_node *)TM_LOAD(&p->next) ; 	
			PR_DEBUG("D\n") ; 	
			PR_DEBUG("p = %p , n = %p\n" , p, n ) ; 
			while(1){ 
				if(key_cmp(n->key , key ) == 1){
					PR_DEBUG("%d fount\n" , *(int*)p->key) ;	
					break; 	
				}
				p = n ; 	
				n = (struct list_node *)TM_LOAD(&p->next);
			}
			PR_DEBUG("DD\n") ; 
			node = (struct list_node *)TM_LOAD(&n->next);	
			PR_DEBUG("DD\n") ; 
			TM_STORE(&p->next , node) ; 	
			PR_DEBUG("DD\n") ; 
			//TM_POS_FREE// 
			TM_COMMIT ; */ 
			TM_START(2,RW) ; 	
			#if (KEONWOO_DEBUG == 1 )
			PR_DEBUG("[TM_START]\n") ; 	
			#endif 
			sprev_node = (struct list_node *)TM_LOAD(&head->head); 	
			next = (struct list_node*)TM_LOAD(&sprev_node->next); 	
//			while( next || ((next==NULL)&&(sprev_node!=NULL))){ 
			while(sprev_node){ 
				if( (next==NULL) && (sprev_node!=NULL) ){
					
					PR_DEBUG("LastNode\n");
					if( key_cmp( sprev_node->key , key ) == 1){
						PR_DEBUG("[%d] [%d]\n" , *(int*)sprev_node->key,*(int*)key);
						PR_DEBUG("IN HERE\n") ;
						node = (struct list_node*)TM_LOAD(&sprev_node->next);
						if( node == NULL ) node = 0 ;
						PR_DEBUG("node ; %p\n" , node) ;
						//sprev_node = node ; 
						//head->head = node ; 	
						TM_STORE(&head->head,node);
						PR_DEBUG("head->head: %p\n" , head->head ) ;	
						//pos_clflush_cache_range(&sprev_node->next,sizeof(struct list_node)) ; 		
						break ;
					}
				}
				if( key_cmp( next->key , key ) == 1 ){ 
					node = (struct list_node *)TM_LOAD(&next->next); 	
					TM_STORE(&sprev_node->next ,node ); 	
					pos_clflush_cache_range(&sprev_node->next ,sizeof(struct list_node)) ; 	
					break; // out to while loop.
				}
				sprev_node = next ; 	
				next = (struct list_node *)TM_LOAD(&next->next);
			}
			 
			TM_COMMIT ; 	
			#if (KEONWOO_DEBUG == 1) 
			PR_DEBUG("[TM_COMMIT]\n") ;
			#endif 
		}
	}
}
static int list_count = 0 ; 	
 
int t_pos_list_insert( char * name , void *_key, void * _val , unsigned long val_size, int thread_num){//, stm_tx_attr_t a){ 
	struct list_head * head ;
        struct list_node * node ;
        unsigned long * key , val ;
        int i = 0 ;
        key = (unsigned long *)_key ;
        val = (unsigned long *)_val ;

        head = (struct list_head *)pos_get_prime_object(name) ; //not changed// 
        lock() ;
        node = (struct list_node *)pos_malloc(name ,sizeof(struct list_node)) ;  
        unlock() ; //alloc not affect to consistency about list. 
        for( i = 0 ; i < KEY_SIZE ; i++ ){
                node->key[i] = key[i] ;
        }
        pos_clflush_cache_range(node->key , KEY_SIZE * sizeof(unsigned long));//one clflush
        lock() ;
        node->value = (unsigned long *)pos_malloc(name , val_size) ;
        unlock() ;

        pos_clflush_cache_range(&node->value , sizeof(node->value)); //two clflush
        memcpy(node->value , val , val_size) ;
        pos_clflush_cache_range( node->value ,val_size) ;
      
	TM_START(1 , RW) ;
                node->next = TM_LOAD( &head->head ) ;
                pos_clflush_cache_range(&node->next , sizeof(node->next)) ;
                TM_STORE( &head->head , node) ;
                pos_clflush_cache_range((void*)&head->head , sizeof(unsigned long)) ;
        TM_COMMIT ;

	return 0 ; 
}
int t_t_pos_list_insert( char * name , void *_key, void * _val , unsigned long val_size, int thread_num){ 
	//normal: // not thread mechanism
	if( flags_num & NORMAL_ROUTINE ){ 
		#if (KEONWOO_DEBUG == 1)
		PR_DEBUG("[%s] [%d]:key [%d]:val\n", __func__, *(int*)_key , *(int*)_val ) ; 	 
		#endif 
		//Normal Mechanism start here.	
		struct list_head * head ; 	
		struct list_node * node ; 	
		unsigned long * key, * val ; 	
		int i ; 	
	
		key = (unsigned long *)_key ; 	
		val = (unsigned long *)_val ; 	
		head = (struct list_head *)pos_get_prime_object(name); 
		if( head == NULL ){ 
			PR_DEBUG("[head point] is NULL\n") ;	
			//Error exit return -1; 
			return -1; 	
		}	
		lock() ;
		node = (struct list_node *)pos_malloc(name, sizeof(struct list_node)) ; 	
		/* TM_POS_MALLOC(name , sizeof(struct list_node)); */ 
		unlock() ; 	
		if( node == NULL ){ 
			PR_DEBUG("[node address] is NULL\n") ; 	
			//Error exit return -1; 
			return -1; 	
		}
		for( i = 0 ; i < KEY_SIZE ; i++ ){ 
			node->key[i] = key[i] ; 	
		}
		pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));

        	lock() ;
        	node->value = (unsigned long *)pos_malloc(name, val_size);
		/* TM_POS_MALLOC(name , val_size) */ 
       		unlock() ;
		if( node->value == NULL ){ 
			PR_DEBUG("[node->valude address] is NULL\n");	
			// Error exit return -1;
			return -1; 	
		}
   		pos_clflush_cache_range(&node->value, sizeof(node->value));
	       	memcpy(node->value, val, val_size);
    	   	pos_clflush_cache_range(node->value, val_size);
	
		if( flags_num & LOCK_ROUTINE ){ 
			#if (KEONWOO_DEBUG == 1)
			PR_DEBUG("[LOCK()] called\n") ; 	
			#endif 
			llock() ; 
			node->next = head->head;  	
			pos_clflush_cache_range(&node->next , sizeof(node->next)) ; 
		 	head->head = node ; 	 
			pos_clflush_cache_range((void*)&head->head , sizeof(unsigned long)) ; 
			lunlock() ;
			return 0;   	
		}else if( flags_num & STM_ROUTINE ){ 
			TM_START(1,RW ) ; 	
			#if (KEONWOO_DEBUG == 1) 
			PR_DEBUG("[TM_START]\n") ; 
			#endif 
			node->next = head->head ; 	
			pos_clflush_cache_range(&node->next , sizeof(node->next)) ; 	
			PR_DEBUG("head->head : %p\n" , head->head) ; 	
			TM_STORE(&head->head , node) ; 	
			PR_DEBUG("a head->head : %p\n", head->head) ; 
			pos_clflush_cache_range((void*)&head->head, sizeof(unsigned long)) ; 		
			TM_COMMIT ; 
			return 0 ; 
		}else{ // flags_num & STM_NORMAL 
			#if (KEONWOO_DEBUG == 1)
			PR_DEBUG("[Normal]\n") ;
			#endif 
			node->next = head->head ; 
			pos_clflush_cache_range(&node->next , sizeof(node->next)) ; 	
			head->head = node ; 	
			pos_clflush_cache_range(&head->head , sizeof(unsigned long)) ; 	
			return  0;
		}
		return -1; 
	}else{ 
		PR_DEBUG("[flags_num] not set\n") ; 	
		return -1;
	}
}  
// Test Keonwoo Interface 
int pos_list_insert_crash( char * name , void *_key , void *_val , unsigned long val_size){ 
//	PR_DEBUG("[pos_list_insert_crash]\n") ; 	
//	PR_DEBUG(" key = %d, val = %d\n" , *(int *)_key , *(int *)_val) ; 	

	struct list_head * head;  	
	struct list_node * node; 	
	unsigned long * key, * val ; 	
	int i ; 	
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 
	pos_transaction_start( name , POS_TS_INSERT ) ;	
	#endif
#endif 
	key = ( unsigned long *)_key ; 	
	val = ( unsigned long *)_val ; 	
	head = (struct list_head *)pos_get_prime_object(name);  	
//	PR_DEBUG(" head = %lu\n " , head ) ; 
	//Crash Point 1) Garbage Created!!
	node = (struct list_node *)pos_malloc(name ,sizeof(struct list_node)); 
#if CONSISTENCY == 1 

#endif	
	

//	PR_DEBUG("node : %lu\n" , node) ; 	
	for( i = 0 ; i < KEY_SIZE ; i++ ){ 
		node->key[i] = *key ; 	
	}
#if CONSISTENCY == 1 
	pos_clflush_cache_range( &node->value , sizeof(node->value)) ; 	
#endif
	//node->value = (unsigned long *)malloc(val_size) ; 	
	// Crash Point 2) Grabage Created!!
	node->value = (unsigned long * )pos_malloc( name ,val_size ) ; 	
	memcpy( node->value , val , val_size ) ; 	
#if CONSISTENCY == 1
	pos_clflush_cache_range( node->value , val_size) ; 	
#endif 
	node->next = head->head ; 	
#if CONSISTENCY == 1
	pos_clflush_cache_range( &node->next , sizeof( node->next )) ; 	
#endif

	#if UNDO_CONSISTENCY == 1
	pos_write_value( name , (unsigned long *)&head->head , (unsigned long)node) ; 	
	
	#endif

	//This is Crash Point
	PR_DEBUG("crash occured\n") ; 
	exit(1) ; 	

} 



/* not allow to duplicate key value */
int lookup_pos_list_insert(char *name, void *_key, void *_val, unsigned long val_size)
{
	lock() ; 
	PR_DEBUG("[pos_list_insert]\n") ; 	

	struct list_head * head;
	struct list_node *node;
	unsigned long *key, *val;
	int i;
 
	key = (unsigned long *)_key;
	val = (unsigned long *)_val;
	while(pos_list_lookup(name,key)!=NULL){ 
		*key = *key+1; 	//tx_count++ ; 	
	}	
	PR_DEBUG("tx_count = [%d]\n" , *key) ; 	
	sleep(2);
	PR_DEBUG("key : %d , val : %p\n" , *key , val) ; 	
	head = (struct list_head *)pos_get_prime_object(name);
	if( head == NULL){ 
		PR_DEBUG("head pointer is null\n") ; 	
		return -1; 	
	}
	PR_DEBUG("head : %p\n" , head) ; 	
//	PR_DEBUG("helo\n") ; 
	lock();
 	node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));

	// if crash free overhead occured 
	unlock() ; 	

	if( node == NULL){ 
		return -1; 
	}


	PR_DEBUG( "node size : %d , node : %p , key :%lu\n" ,sizeof(struct list_node), node , *key ) ; 
	for (i=0; i<KEY_SIZE; i++) {
		node->key[i] = key[i]  ; 
			
	}
	
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));
#endif
	lock() ; 	
	node->value = (unsigned long *)pos_malloc(name, val_size);
	unlock() ; 
//	node->value = (unsigned long *)malloc(val_size) ; 
	//node->value = (unsigned long *)pos_malloc(name, 16) ;
//	PR_DEBUG("node->value : %lu\n" , node->value) ; 
	/*if( node->value == NULL){ 
		PR_DEBUG("NULL \n") ;
		return -1;
	}*/ 
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->value, sizeof(node->value));
#endif
//	memcpy(node->value, val, val_size);
	node->value = val ;
	PR_DEBUG("node->value : %p\n" , node->value) ; 
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->value, val_size);
#endif
	
	node->next = head->head;
//	PR_DEBUG("node->next : %lu\n" , node->next) ; 	
	
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->next, sizeof(node->next));
#endif

#if MODE == 1
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 

	pos_write_value(name, (unsigned long *)&head->head, (unsigned long)node);
	
	pos_transaction_end(name);
	#else 
	head->head = node ; 	
	// cacheline flush to save nvram.
	pos_clflush_cache_range((void *)&head->head , sizeof( unsigned long )) ; 	

	#endif
//	PR_DEBUG("head->head : %lu\n" , head->head ) ; 
#else
	head->head = node;
#endif
#elif MODE == 2
	head->head = node - OFFSET_BASE;
#endif
	PR_DEBUG("\n\n[%s] returned 0\n" , __func__) ; 	
	return 0;
}


int pos_list_insert(char *name, void *_key, void *_val, unsigned long val_size)
{
	PR_DEBUG("[pos_list_insert]\n") ; 	

	struct list_head * head;
	struct list_node *node;
	unsigned long *key, *val;
	int i;
 
	llock();
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
	pos_transaction_start(name, POS_TS_INSERT);	
	#endif
#endif
	
	key = (unsigned long *)_key;
	val = (unsigned long *)_val;
	PR_DEBUG("key : %d , val : %p\n" , *key , val) ; 	
	head = (struct list_head *)pos_get_prime_object(name);
	if( head == NULL){ 
		PR_DEBUG("head pointer is null\n") ; 	
		return -1; 	
	}
	PR_DEBUG("head : %p\n" , head) ; 	
//	PR_DEBUG("helo\n") ; 
	lock();
 	node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));
	// if crash free overhead occured 
	unlock() ; 	

	if( node == NULL){ 
		return -1; 
	}


	PR_DEBUG( "node size : %d , node : %p , key :%lu\n" ,sizeof(struct list_node), node , *key ) ; 
	for (i=0; i<KEY_SIZE; i++) {
		node->key[i] = key[i]  ; 
			
	}
	
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));
#endif
	lock() ; 	
	node->value = (unsigned long *)pos_malloc(name, val_size);
	unlock() ; 
   
//	node->value = (unsigned long *)malloc(val_size) ; 
	//node->value = (unsigned long *)pos_malloc(name, 16) ;
//	PR_DEBUG("node->value : %lu\n" , node->value) ; 
	/*if( node->value == NULL){ 
		PR_DEBUG("NULL \n") ;
		return -1;
	}*/ 
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->value, sizeof(node->value));
#endif
//	memcpy(node->value, val, val_size);
	node->value = val ;
	PR_DEBUG("node->value : %p[%d]\n" , node->value,*(int*)node->value) ; 
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->value, val_size);
#endif
	
	node->next = head->head;
//	PR_DEBUG("node->next : %lu\n" , node->next) ; 	
	
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->next, sizeof(node->next));
#endif

#if MODE == 1
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 

	pos_write_value(name, (unsigned long *)&head->head, (unsigned long)node);
	
	pos_transaction_end(name);
	#else 
	head->head = node ; 	
	// cacheline flush to save nvram.
	pos_clflush_cache_range((void *)&head->head , sizeof( unsigned long )) ; 	

	#endif
//	PR_DEBUG("head->head : %lu\n" , head->head ) ; 
#else
	head->head = node;
#endif
#elif MODE == 2
	head->head = node - OFFSET_BASE;
#endif
	//printf("[%s]new_node[%p]\n",__func__,node) ;

	PR_DEBUG("\n\n[%s] returned 0\n" , __func__) ; 	
	lunlock();
	return 0;
}
int key_val_cmp(unsigned long *key1, unsigned long *key2){ 
	int i; 
	//printf(" %ld %ld\n", *key1, *key2) ;
	
	if( *key1 == *key2 ){ 
		return 1; 
	}else{
		return 0;
	}
} 
int key_cmp(unsigned long *key1, unsigned long *key2)
{
	int i;
	if( *key1 == *key2 ){ 
		return 1 ;
	}else return 0 ;

	for (i=0; i<KEY_SIZE; i++) {
		if (key1[i] != key2[i]){
			return 0;
		}
	}
	
	return 1;
}

void *pos_list_lookup(char *name, void *_key)
{
	struct list_head * head;
	struct list_node *node;
	unsigned long *key;
	int i;

	key = (unsigned long *)_key;
	printf("[%s] key = %p\n",__func__ ,key) ; 	
	head = (struct list_head *)pos_get_prime_object(name);
	printf("[%s] head = %p\n", __func__, head) ;	
	node = head->head;
	printf("[%s] node = %p\n" , __func__, node) ; 


	while (node) {

#if MODE == 2
		node += OFFSET_BASE;
#endif
		//printf("DD\n") ; 	
		printf(" node->key : %d\n" , node->key) ;
		if (key_cmp(node->key, key) == 1)
			return node->value;

		node = node->next;
	}

	return NULL;
}
#define remove_debug 0  
int pos_list_remove_all( char *name , struct list_head *head){ 
	struct list_node *node ,**prev_node ; 	
	if( head == NULL ){ 
		head = pos_get_prime_object(name) ; 	
	}
	prev_node = &head->head; 	
	node = head->head ; 	
	//printf("[%s][%s][%p]\n", __func__, name , head) ;
	while(node!=NULL){ 
		printf("node[%p]\n", node) ;
		*prev_node = node->next ; 	
		pos_free(name , node->value) ; 	
		pos_free(name , node) ; 	
				
		prev_node = &node->next ; 	
		node = node->next ; 	
	}
	head->head = NULL ;
	node = head->head ; 
	printf("node : %p\n" , node) ;
	
} 
int pos_list_remove(char *name, void *_key)
{
	struct list_head * head;
	struct list_node *node, **prev_node;
	unsigned long *key;
	int i;
	llock() ; 	

//	#if remove_debug == 1 
	PR_DEBUG("[%s]\n" , __func__ ) ; 	
	PR_DEBUG("key = %d\n", *(int*)_key) ; 	
//	#endif	
	
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 	
	pos_transaction_start(name, POS_TS_REMOVE);	
	#endif
#endif

	key = (unsigned long *)_key;
	PR_DEBUG("key : %d\n" , *(unsigned long *)_key) ;
	head = (struct list_head *)pos_get_prime_object(name);

//	#if remove_debug == 1 	
	PR_DEBUG("head = %lu\n" , head) ; 	
//	#endif 

	prev_node = &head->head;
	node = head->head;

//	#if remove_debug == 1 	
	PR_DEBUG("prev_node = %lu\n", prev_node) ; 	
	PR_DEBUG("node = %lu\n" , node) ; 	
//	#endif 

	while (node) {

#if MODE == 2
		node += OFFSET_BASE;
#endif

		if (key_val_cmp(node->key, key) == 1) {
	//		#if remove_debug == 1 	
			PR_DEBUG("key find key=%d node->key=%d\n" , *key ,node->key) ; 	
	//		#endif
	//		PR_DEBUG("Find %d\n" , *key) ;
#if CONSISTENCY == 1
			pos_write_value(name, (unsigned long *)prev_node, (unsigned long)node->next);
#else
			*prev_node = node->next;
	
			// This code is change list , tm_store(pre_node ,node->next);
			#if remove_debug == 1 
			PR_DEBUG("*prev_node = %lu\n" , *prev_node) ; 	
			#endif 	
#endif
//			pos_free(name, node->value);
//			pos_free(name, node);

#if CONSISTENCY == 1
			pos_transaction_end(name);
#endif
			lunlock(); 
			return 0;
		}

		prev_node = &node->next;
		node = node->next;
		#if remove_debug == 1 	
		PR_DEBUG("w prev_node = %lu\n" , prev_node) ; 	
		PR_DEBUG("w node = %lu\n" , node) ; 	
		#endif 
	}

#if CONSISTENCY == 1
			pos_transaction_end(name);
#endif
	lunlock();
	return -1;
}

