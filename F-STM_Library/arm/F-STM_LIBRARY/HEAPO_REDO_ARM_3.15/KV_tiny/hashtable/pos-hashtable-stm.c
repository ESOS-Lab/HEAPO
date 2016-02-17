
#include "pos-hashtable.h" 
#include "pos-hashtable_private.h" 
#include "pos-hashtable-stm.h" 
#include <stdlib.h>
#include <stdio.h>
#include <string.h> 
#include <math.h> 
#include "../pos-lib.h" 
#include "../stm_lib/pos_stm.h" 

#include <pthread.h>

#define CONSISTENCY 		0
#define UNDO_CONSISTENCY 	0 
#define KEONWOO_DEBUG 		0 


static pthread_mutex_t hash_mutex = PTHREAD_MUTEX_INITIALIZER ; 	
static void hash_lock(){ pthread_mutex_lock(&hash_mutex); } 
static void hash_unlock(){ pthread_mutex_unlock(&hash_mutex); } 

static int n_c = 0 ; 	
static int a_c = 0 ; 

void stm_pos_hashtable_count(char *name , int *key){ 
	int i = 0 ; 	
	/* First get the entry count */ 
	struct hashtable *h = (struct hashtable *)pos_get_prime_object(name);
		
	int entrycount = h->entrycount;
	entrycount = 300000 ; 
	/* Fix Things 
	When remove operation executed entrycount not changed(i.e 60,000)*/
	
	PR_DEBUG("======[%s]=====\n",__func__ ) ; 	
	/* In this case, this program will trigger error */ 	
	for( i = 0 ; i < entrycount; i++ ){ 
		void *addr = pos_hashtable_search( name, &key[i]) ; 	
		if( addr == NULL ){ n_c++ ; }
		else{ a_c++ ;}  	
		/* find all node mechanism is here */ 
	}	
	printf("[entrycount] : %d\n" , h->entrycount) ; 
	printf("[null] count : %d\n" , n_c ) ; 	
	printf("[addr] count : %d\n" , a_c ) ; 
	return ; 
} 
int 
stm_pos_create_hashtable( char *name, unsigned int minsize, 
		unsigned long (*hashfunction) (unsigned long *),
		int (*key_eq_fn)(unsigned long*,unsigned long*)){
	int rval ; 	
	int ret_val = 0 ; 	

	if(pos_create(name) == 0){ 
		return -1;
	}
	/* create for hashtable rollback-journal */
	ret_val = stm_pos_create_object(name , TOT_TM) ; 	
	if( ret_val == -1){ 
		PR_DEBUG("[%s] stm_pos_create_object error\n" ,__func__ );			return -1; 
	}	
        if (hashfunction == NULL && key_eq_fn == NULL) {
                //PR_DEBUG("key_rq_fn : %lu\n" , default_key_eq_fn );
                rval = create_hashtable(name, minsize, default_hashfunction, default_key_eq_fn);
        } else {
                rval = create_hashtable(name, minsize, hashfunction, key_eq_fn);
        }

	PR_DEBUG("[%s] log_unmap called\n", __func__ ) ; 	
	stm_pos_log_unmap(name) ; 	
	PR_DEBUG("[%s] unmap called\n" , __func__ ) ; 	
	pos_unmap(name) ; 	
	return 0 ;
} 	

int
stm_hashtable_insert(char *name, struct hashtable *h, unsigned long *k, unsigned long *v,unsigned long v_size){ 
	unsigned int index ; 	
        struct entry * e;
        hash_lock() ;
        e = (struct entry *)pos_malloc( name , sizeof(struct entry)) ;
        if( e == NULL) PR_DEBUG("enull\n") ;
        e->v = (unsigned long *)pos_malloc( name , v_size) ;

//	TM_START(1, RW) ; 	
        if( e->v == NULL)PR_DEBUG("e->v null\n") ;
        hash_unlock() ;
	
	TM_START(1, RW) ; 		

//        e->h = hash(h , k) ;
//        memcpy(e->k , k , sizeof(unsigned long)*KEY_SIZE) ;
//        memcpy(e->v , v, v_size) ;
	TM_STORE(&e->h , hash(h,k)) ; 	
	TM_STORE(&e->k , k ) ; 	
	TM_STORE(&e->v , v ) ;
//        TM_START(1 , RW) ;
                int entrycount = (int)TM_LOAD(&h->entrycount) ;
                int loadlimit = (int)TM_LOAD(&h->loadlimit) ;
                TM_STORE(&h->entrycount , entrycount+1) ;
                if( entrycount+1 > loadlimit ){
//                      h_lock();
//                      shashtable_expand(name ,h) ;   
//                      h_unlock() ;    
                }
//                e->h = hash( h , k ) ;
                index = indexFor((int)TM_LOAD(&h->tablelength) , 
				 (int)TM_LOAD(&e->h));
		TM_STORE(&e->next,(struct entry*)TM_LOAD(&h->table[index]));
//                e->next = (struct entry *)TM_LOAD(&h->table[index]);
//                pos_clflush_cache_range(e , sizeof(struct entry));
//                pos_clflush_cache_range(e->v , v_size) ;
                TM_STORE(&h->table[index] , e) ;
//                pos_clflush_cache_range(&h->table[index] , sizeof(unsigned long)) ;
        TM_COMMIT ;
        return ;

} 
int 
stm_pos_hashtable_insert(char *name, unsigned long *_k, unsigned long *_v, 
			unsigned long v_size){ 
	struct hashtable *h; 
	unsigned long *k, *v; 	
	if(name == NULL || _k == NULL | _v == NULL){
		return -1; 	
	}
	k = (unsigned long *)_k;
	v = (unsigned long *)_v; 
	h = (struct hashtable *)pos_get_prime_object(name) ;	
	return stm_hashtable_insert( name , h , k , v , v_size ) ; 	
}
int 
stm_pos_hashtable_open( char *name ){ 
	/* TRANSACTION MEMORY INIT */
	TM_INIT ; 
	int ret_val = 0 ; 	
	PR_DEBUG("[%s] pos_map called\n" , __func__ ) ; 	
	ret_val = pos_map(name) ; 	
	PR_DEBUG("[%s] stm_pos_log_map called\n" , __func__ ) ; 	
	ret_val = stm_pos_log_map(name) ; 	
	PR_DEBUG("[%s]\n" , __func__ ) ; 	
	SLEEP_DEBUG(2) ; 	

	ret_val = stm_pos_recovery(name) ; 	
	if(ret_val != 0){
		perror("[stm_pos_hashtable_open] recovery failed\n") ; 
		exit(-1) ; 	
	}		
	return 0 ;
} 
int
stm_pos_hashtable_close( char *name){ 
	pos_unmap(name) ; 	
	/* TRANSACTION MEMORY EXIT */ 
	TM_EXIT ; 
} 
int 
stm_hashtable_remove( char *name , struct hashtable *h, unsigned long *k){ 
	struct entry *prev, *b ; 
	unsigned long hashvalue , index ; 	
        int result = 0 ; // whether find node or not find.

        TM_START(0 ,RW) ; // transaction start 
        hashvalue = hash( h , k );
        int tablelength = (int)TM_LOAD(&h->tablelength) ;
        index = indexFor( tablelength , hashvalue ) ;
        prev = b = (struct entry *)TM_LOAD(&h->table[index]) ;
        result = 0 ;
        while( b != NULL ){
                if(( hashvalue == b->h ) && default_key_eq_fn( k , b->k )){
                        result = 1 ;
                        goto ret;
                }
                prev = b ;
                b = (struct entry *)TM_LOAD(&b->next) ;
        }
        ret:
        if(result){ // matching entry so end normaly.
                if( prev == b ){
                        TM_STORE( &h->table[index] , TM_LOAD(&b->next)) ;
                        pos_clflush_cache_range(&h->table[index] , sizeof(struct entry*)) ;
			TM_STORE( &h->entrycount , (unsigned long)(h->entrycount-1)) ;
			pos_clflush_cache_range(&h->entrycount , sizeof(unsigned long)) ; 	
                }
                else{
                         TM_STORE(&prev->next , TM_LOAD(&b->next)) ;
                        pos_clflush_cache_range(&prev->next , sizeof(struct entry*));
			TM_STORE( &h->entrycount , (unsigned long)(h->entrycount-1)) ;
			pos_clflush_cache_range(&h->entrycount , sizeof(unsigned long)) ; 	
                }
                //pos_free part.
        }
        TM_COMMIT ;
        return result ;
} 
int 
stm_pos_hashtable_remove( char *name, void *_k){ 
	struct hashtable *h ; 	
	unsigned long *k ; 	
	if(name == NULL || _k == NULL){ 
		return -1;	
	}
	k = (unsigned long *)_k ; 	
	h = (struct hashtable *)pos_get_prime_object(name) ; 	
	return stm_hashtable_remove( name , h , k ) ; 
}  
