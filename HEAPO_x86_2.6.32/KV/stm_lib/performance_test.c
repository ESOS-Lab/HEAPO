#include <stdio.h>
#include <stdlib.h>
#include <pos-lib.h>
#include <string.h>
#include <time.h>
#include "list/pos-list.h" 
#include "hashtable/pos-hashtable.h"
#include "hashtable/pos-hashtable_private.h" 
#include "btree/pos-btree.h" 
//#include "btree/@btree-type.h" 
//#include "btree/@btree-128.h" 

#include <pthread.h> 
#define RO	1
#define RW	0

#include "stm.h" 
#include "mod_ab.h" 
#define TM_START(tid , ro)      { stm_tx_attr_t a = {{.id = tid, .read_only = ro}}; sigjmp_buf * _e = stm_start(a); if(_e != NULL) sigsetjmp(*_e, 0)
#define TM_LOAD(addr)           stm_load((stm_word_t *)addr) 
#define TM_STORE(addr , value)  stm_store((stm_word_t *)addr , (stm_word_t)value) 

#define TM_COMMIT               stm_commit(); } 
#define TM_INIT			stm_init(); mod_mem_init(0); mod_ab_init(0,NULL);
#define TM_EXIT			stm_exit();

#define TM_INIT_THREAD          stm_init_thread() ;     
#define TM_EXIT_THREAD          stm_exit_thread() ;   

#define L1_CACHE_SHIFT (6)
#define L1_CACHE_BYTES (1 << L1_CACHE_SHIFT)
#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define NODESIZE MAX(L1_CACHE_BYTES , 128) 

int thread_num = 0 ;
// for hashtable
static const unsigned int primes[] = {
53, 97, 193, 389,
769, 1543, 3079, 6151,
12289, 24593, 49157, 98317,
196613, 393241, 786433, 1572869,
3145739, 6291469, 12582917, 25165843,
50331653, 100663319, 201326611, 402653189,
805306457, 1610612741
};
const unsigned int sprime_table_length = sizeof(primes)/sizeof(primes[0]);       // 26
const float smax_load_factor = 0.65;

//for BTREE
#define ENOENT 2
#define ENOMEM	12
static int static_key[3100000] = {0} ;
static int debug_int = 0 ;  
struct btree_geo{
	int keylen ;
	int no_pairs;
	int no_longs;
};

void print_time(struct timeval T1 , struct timeval T2){
       long sec,usec;
        double time;
        double rate;

        time_t t;

        if(T1.tv_usec > T2.tv_usec)
        {
                sec = T2.tv_sec - T1.tv_sec -1;
                usec = 1000000 + T2.tv_usec - T1.tv_usec;
        }
        else
        {
                sec = T2.tv_sec - T1.tv_sec;
                usec = T2.tv_usec - T1.tv_usec;
        }

        time = (double)sec + (double)usec/1000000;

        printf("[TIME] :%8ld sec %06ldus.\n",sec,usec);




        //printf("[Time]:%8ld sec %06ld us\n" , sec , usec) ; 

}

pthread_mutex_t t_mutex = PTHREAD_MUTEX_INITIALIZER;
void t_lock(){ pthread_mutex_lock(&t_mutex);}
void t_unlock(){ pthread_mutex_unlock(&t_mutex);}

pthread_mutex_t m_mutex = PTHREAD_MUTEX_INITIALIZER;
void m_lock(){ pthread_mutex_lock(&m_mutex);}
void m_unlock(){ pthread_mutex_unlock(&m_mutex);}

pthread_mutex_t h_mutex = PTHREAD_MUTEX_INITIALIZER;
void h_lock(){ pthread_mutex_lock(&h_mutex);}
void h_unlock(){ pthread_mutex_unlock(&h_mutex);}
static char * obj_store ; //object storage name - argv[1] 
//static struct intset_t * set ;
int spos_list_open(char *name)
{
        #if UNDO_CONSISTENCY == 0 
        //printf("not undo logging\n") ;
        #endif
        if (pos_map(name) == 1) {
                return 0;
        } else
                return -1;
}
void spos_list_close(char *name)
{
        pos_unmap(name);
}
int spos_list_init(char *name)
{
        struct list_head *head;
        if (pos_create(name) == 0){
		return -1; 
	}
        head = (struct list_head *)pos_malloc(name, sizeof(struct list_head));
	pos_set_prime_object(name, head);
        head->head = NULL;
	pos_unmap(name);
	return 0 ;
}
static int size = 0 ; 	
void spos_hashtable_count( char * name ){ 
	struct hashtable * h ; 
	h = pos_get_prime_object( name ) ; 	
	//printf(" found head %lu\n" , h ) ; 	
	int i = 0 ; 	
	//printf(" entry count : %d\n" , h->entrycount) ; 	
	int tablelength = h->tablelength ; 	
	for( i = 0 ; i < tablelength  ; i++){ 
		struct entry * e ; 	
		e = h->table[i] ; 	
		while( e!=NULL){
			size++ ;	
			e = e->next ; 
		}
	}	
	//printf(" size : %d\n" , size) ;
}
unsigned long sdefault_hashfunction(unsigned long *key)
{
	unsigned long hash;
	int i;
	
	hash = 0;
	for (i=0; i<KEY_SIZE; i++) {
		hash += (unsigned long)key[i];
		hash += (unsigned long)(key[i]>>sizeof(unsigned long));
	}
	return hash;
}

int sdefault_key_eq_fn(unsigned long *key1, unsigned long *key2)
{
	int i;
	for (i=0; i<KEY_SIZE; i++) {
		if (key1[i] != key2[i]){

			return 0;
		}
	}
	//printf("*********return 1*************\n") ;
	return 1;
}
static int sum = 0 ;	
int lock_temp_hashtable_remove( char * name , struct hashtable * h , unsigned long * k){ 
	// this function only remove not thinking expand hash table.
	struct entry * prev , *b; 	
	unsigned long hashvalue , index ; 	
	int result = 0 ; 	
	hashvalue = hash(h , k) ; 	
	index = indexFor( h->tablelength , hashvalue ) ; 
	
	prev = b = (struct entry *)h->table[index]  ; 	

	result = 0 ; 	
	while( b != NULL ){ 
		if((hashvalue == b->h) && sdefault_key_eq_fn( k,b->k)){
			result = 1 ;	
			goto ret; 
		}
		prev = b ; 
		b = (struct entry *)b->next ; 	
	}
	ret:
	if(result){
		if(prev == b){
			h->table[index] = b->next ; 
			pos_clflush_cache_range(&h->table[index],sizeof(struct entry*));
		}
		else{
			prev->next = b->next ; 	
			pos_clflush_cache_range(&prev->next , sizeof(struct entry*));
		}
	}	
	return result ; 
}  
int temp_hashtable_remove( char * name , struct hashtable * h , unsigned long *k){ 
	struct entry * prev , *b ; 	
	unsigned long hashvalue , index ; 	
	int result = 0 ; // whether find node or not find.

	TM_START(0 ,RW) ; // transaction start 

	hashvalue = hash( h , k ); 

	int tablelength = (int)TM_LOAD(&h->tablelength) ; 	

	index = indexFor( tablelength , hashvalue ) ; 	

	prev = b = (struct entry *)TM_LOAD(&h->table[index]) ;
	result = 0 ; 	
	while( b != NULL ){
		if(( hashvalue == b->h ) && sdefault_key_eq_fn( k , b->k )){ 
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
		}
		else{
			 TM_STORE(&prev->next , TM_LOAD(&b->next)) ; 	
			pos_clflush_cache_range(&prev->next , sizeof(struct entry*));
		}
		//pos_free part.
	}
	TM_COMMIT ; 
	return result ; 

}
int shashtable_remove( char * name , struct hashtable * h , unsigned long * k){ 
    struct entry *e;
    struct entry **pE;
//    lock();  	
    unsigned long hashvalue, index;

//        pos_transaction_start(name, POS_TS_REMOVE);
//    TM_START(3,RW) ; 	
    //printf("[%s]\n" , __func__ ) ; 	
    //printf(" k = %d and head : %lu\n" , *k , h) ; 	

    hashvalue = hash(h,k);
 
    TM_START(4 , RW) ; 	
    int tablelength = (int)TM_LOAD(&h->tablelength) ; 	
    index = indexFor(tablelength, hashvalue);

    //e = h->table[index] ; 	
    pE = &(h->table[index]) ; 		
    //printf(" pE : %lu\n", pE) ; 	

    pE = (struct entry **)TM_LOAD(&(h->table[index])) ; 	
    //printf("ApE : %lu\n", pE) ; 		
    e = *pE ; 
    // pE has hashtable address and e has first node in hashtable.
    while( e!= NULL ){ 
	if(( hashvalue == e->h) && sdefault_key_eq_fn( k , e->k )){ 
		*pE = e->next ; 	
		h->entrycount-- ; 	
		//pos_free(name , e->v) ; 	
		//pos_free(name , e) ; 	
		goto ret;
		//return 0 ; 	
	}
	pE = &(e->next) ; 	
	e = e->next ; 	
    }
    ret:
    TM_COMMIT ;  
    return -1; 
 
    
//    pE = &(h->table[index]);
//    e = *pE;
//    printf(" hashvalue : %d\n" , hashvalue) ;
//    printf(" e->h : %d\n" , e->h) ; 
//    printf(" hashvalue : %ld\ne->h : %ld\n" ,hashvalue , e->h ) ;
/*    sleep(1);
    while( e != NULL ){ 
	if( hashvalue == e->h && sdefault_key_eq_fn( k , e->k )){ 
		//matching point found!
		printf("match\n") ;
		 
	}
	e = e->next ; 
	printf("e = %lu\n") ; 	
    }*/ 
/*    while (NULL != e)
    {
	//if (( hashvalue == e->h) && sdefault_key_eq_fn( k , e->k)){
        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
        {
		printf("match\n") ;
		sleep(1);
            //pos_write_value(name, (unsigned long *)pE , (unsigned long)e->next);
            //pos_write_value(name, (unsigned long *)&h->entrycount, (unsigned long)(h->entrycount-1));
            *pE = e->next;
            h->entrycount--;
            //v = e->v;

            //freekey(e->k);
            //free(e);
            pos_free(name, e->v);
            pos_free(name, e);

  //              pos_transaction_end(name);

            //return v;
	   // unlock() ;
            return 0;
        }
        pE = &(e->next);
        e = e->next;
    }
	
        //pos_transaction_end(name);

    //return NULL;
 //   unlock() ; 	
    return -1;
	*/
}
int spos_lock_hashtable_remove( char * name , void *_k){ 
	struct hashtable * h ; 	
	unsigned long * k ; 	
	if( name == NULL || _k == NULL){ 
		return -1; 	
	}
	k = (unsigned long *)_k ; 	
	h = (struct hashtable *)pos_get_prime_object(name) ; 	
	return lock_temp_hashtable_remove(name , h , k) ; 	
}  
int spos_hashtable_remove( char * name , void * _k ){ 
	struct hashtable * h ; 	
	unsigned long * k ; 	
	if( name == NULL || _k == NULL){
	//	printf(" name or k null\n") ;
		 return -1;
	}
	k = (unsigned long *)_k ; 	
	h = (struct hashtable *)pos_get_prime_object(name);
	//printf(" head : %lu\n" , h) ; 	

	//return shashtable_remove(name, h , k); 
	return temp_hashtable_remove(name ,h , k) ;
} 


// Later we modified to execute stm rules.
// We think this function is rare to conflict.
int
shashtable_expand( char * name , struct hashtable * h){
     /* Double the size of the table to accomodate more entries */
    struct entry **newtable;
    struct entry *e;
    struct entry **pE;
    unsigned int newsize, i, index;

    /* Check we're not hitting max capacity */
    if (h->primeindex == (sprime_table_length - 1)) return 0;
    newsize = primes[++(h->primeindex)];

    //newtable = (struct entry **)malloc(sizeof(struct entry*) * newsize);
 //   h_lock() ; 	
    newtable = (struct entry **)pos_malloc(name, sizeof(struct entry*) * newsize);
//    h_unlock() ;
    if (NULL != newtable)
    {
        memset(newtable, 0, newsize * sizeof(struct entry *));
        pos_clflush_cache_range(newtable, newsize * sizeof(struct entry *));
        /* This algorithm is not 'stable'. ie. it reverses the list
         * when it transfers entries between the tables */
        for (i = 0; i < h->tablelength; i++) {
            while (NULL != (e = h->table[i])) {
               //pos_write_value(name, (unsigned long *)&h->table[i], (unsigned long)e->next);
                h->table[i] = e->next ;
		pos_clflush_cache_range(&h->table[i] , sizeof(unsigned long)) ; 	
                index = indexFor(newsize,e->h);
               // pos_write_value(name, (unsigned long *)&e->next, (unsigned long)newtable[index]);
                e->next = newtable[index];
		pos_clflush_cache_range(&e->next , sizeof(unsigned long)) ; 	
                newtable[index] = e;
            }
        }
        //free(h->table);
        //pos_free(name, h->table);////////////////////////////////// 
        h->table = newtable;
    }
          //pos_write_value(name, (unsigned long *)&h->tablelength, (unsigned long)newsize);
          //pos_write_value(name, (unsigned long *)&h->loadlimit, (unsigned long)newtable[index]);
    // Delayed flush...
          h->tablelength = newsize ;
	  pos_clflush_cache_range(&h->tablelength , sizeof(unsigned long)) ; 	
          h->loadlimit = (unsigned int)ceil(newsize * smax_load_factor);
	  pos_clflush_cache_range(&h->loadlimit , sizeof(unsigned long)) ; 
    return -1;
}
static int shc = 0 ; 
int
shashtable_stm_insert( char * name , struct hashtable * h , unsigned long * k ,unsigned long * v ,
			unsigned long v_size){ 
	unsigned int index ; 	
	struct entry * e;
	h_lock() ; 	
	e = (struct entry *)pos_malloc( name , sizeof(struct entry)) ; 	
	if( e == NULL) printf("enull\n") ; 	
	e->v = (unsigned long *)pos_malloc( name , v_size) ; 	
	if( e->v == NULL)printf("e->v null\n") ;
	h_unlock() ; 	
	e->h = hash(h , k) ; 	
	memcpy(e->k , k , sizeof(unsigned long)*KEY_SIZE) ; 	
	memcpy(e->v , v, v_size) ; 	
	
	TM_START(1 , RW) ; 
		int entrycount = (int)TM_LOAD(&h->entrycount) ; 	
		int loadlimit = (int)TM_LOAD(&h->loadlimit) ; 	
		TM_STORE(&h->entrycount , entrycount+1) ; 	
		if( entrycount+1 > loadlimit ){ 
//			h_lock();
//			shashtable_expand(name ,h) ;   
//			h_unlock() ; 	
		}
		e->h = hash( h , k ) ; 	
		index = indexFor((int)TM_LOAD(&h->tablelength) , e->h);
		e->next = (struct entry *)TM_LOAD(&h->table[index]); 
		pos_clflush_cache_range(e , sizeof(struct entry)); 
		pos_clflush_cache_range(e->v , v_size) ; 	
		TM_STORE(&h->table[index] , e) ; 
		pos_clflush_cache_range(&h->table[index] , sizeof(unsigned long)) ; 	
	TM_COMMIT ; 	
	return ; 	
} 	
int
shashtable_insert(char *name, struct hashtable *h, unsigned long *k, unsigned long *v,
                unsigned long v_size)
{
    /* This method allows duplicate keys - but they shouldn't be used */
    unsigned int index;
    struct entry *e;
   // printf("[%s] \n" , __func__ ) ;
//   lock() ;
//transaction start 
    if (++(h->entrycount) > h->loadlimit)
    {
        /* Ignore the return value. If expand fails, we should
         * still try cramming just this value into the existing table
         * -- we may not have memory for a larger table, but one more
         * element may be ok. Next time we insert, we'll try expanding again.*/
        //hashtable_expand(h);
	//printf("expand\n") ; 	
        shashtable_expand(name, h);
    }
    t_lock(); 
    e = (struct entry *)pos_malloc(name, sizeof(struct entry));
    t_unlock() ; 	
    if (NULL == e) { --(h->entrycount); return -1; } /*oom*/
   // printf(" entry : %lu\n" ,e ) ; 	

    e->h = hash(h,k);
    
    index = indexFor(h->tablelength,e->h);
   // printf(" index : %d\n" , index) ; 	

    memcpy(e->k, k, sizeof(unsigned long)*KEY_SIZE);

    e->v = (unsigned long *)pos_malloc(name, v_size);
    memcpy(e->v, v, v_size);
    pos_clflush_cache_range(e->v, v_size);
    
    e->next = h->table[index];
    
    pos_clflush_cache_range(e, sizeof(struct entry)); // Delayed flush

    //pos_write_value(name, (unsigned long *)&h->table[index], (unsigned long)e);
    h->table[index] = e;


//transaction end
//unlock() ; 
	
    return 0;

}


int
spos_hashtable_insert(char * name, void *_k , void *_v , unsigned long v_size ){ 
	struct hashtable *h;
        unsigned long *k, *v;
        if (name==NULL || _k==NULL || _v==NULL)
                return -1;

        k = (unsigned long *)_k;
        v = (unsigned long *)_v;
	//printf("spos_hashtable_insert : k%d v%d\n" , *k , *v) ; 	
        h = (struct hashtable *)pos_get_prime_object(name);
	//printf(" head : %lu\n" , h) ; 	
//	return shashtable_insert(name , h , k , v , v_size ) ;
        return shashtable_stm_insert(name, h, k, v, v_size);
} 
int 
spos_hashtable_close(char * name){ 
	pos_unmap(name) ;
} 
int 
spos_hashtable_open( char * name ){ 
	
	      if (pos_map(name) == 1) {
                // If transaction was ended abnormally.
                // Recovery is executed.
                return 0;
        	} else
                return -1;
} 
int
spos_create_hashtable(char *name, unsigned int minsize,
                 unsigned long (*hashfunction) (unsigned long*),
                 int (*key_eq_fn) (unsigned long*,unsigned long*))
{
        int rval;

        if (pos_create(name) == 0)
                return -1;

        if (hashfunction == NULL && key_eq_fn == NULL) {
	//	printf("DD\n");
                rval = create_hashtable(name, minsize, sdefault_hashfunction, sdefault_key_eq_fn);
        } else {
                rval = create_hashtable(name, minsize, hashfunction, key_eq_fn);
        }
        pos_unmap(name);
        return rval;
}



int list_count(){ 
        printf("\n\n\n\n===== LIST COUNT =======\n") ;
        int ret_val = t_pos_list_open(obj_store) ;
        printf("ret_val = %d\n" , ret_val ) ;
        struct list_head * head ;
        struct list_node * node ;
        pos_count( obj_store ) ;
        return 0 ;

}
int npos_list_remove( char * name , void *_key){ 
       struct list_head * head;
        struct list_node *node, **prev_node;
        unsigned long *key;
        int i;

      #if remove_debug == 1 
        printf("[%s]\n" , __func__ ) ;
        printf("key = %d\n", *(int*)_key) ;
      #endif  

        key = (unsigned long *)_key;
        head = (struct list_head *)pos_get_prime_object(name);

      #if remove_debug == 1   
        printf("head = %lu\n" , head) ;
      #endif 

        prev_node = &head->head;
        node = head->head;
      #if remove_debug == 1   
        printf("prev_node = %lu\n", prev_node) ;
        printf("node = %lu\n" , node) ;
      #endif 

        while (node) {

                if (key_cmp(node->key, key) == 1) {
        //              printf("Find %d\n" , *key) ;
                        *prev_node = node->next;
			pos_clflush_cache_range( prev_node , sizeof( struct list_node* )) ; 	
                        // This code is change list , tm_store(pre_node ,node->next);
                        pos_free(name, node->value);
                        pos_free(name, node);

                        return 0;
                }

                prev_node = &node->next;
	        node = node->next;
                #if remove_debug == 1   
                printf("w prev_node = %lu\n" , prev_node) ;
                printf("w node = %lu\n" , node) ;
                sleep(1);
                #endif
        }
        return -1;
	
} 
int npos_list_insert(char *name, void *_key, void *_val, unsigned long val_size){
        struct list_head * head;
        struct list_node *node;
        unsigned long *key, *val;
        int i;
	
	key = (unsigned long *)_key;
        val = (unsigned long *)_val;
//      printf("key : %lu , val : %lu\n" , *key , *val) ;       
        head = (struct list_head *)pos_get_prime_object(name);
        if( head == NULL){
//              printf("head pointer is null\n") ;      
                return -1;
        }
//      printf("head : %lu \n" , head) ;        
//      printf("helo\n") ; 
     //   lock();
        node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));
     //   unlock() ;

        if( node == NULL){
//              printf("node is NULL\n") ;
                return -1;
        }
//      printf( "node size : %d , node : %lu , key :%lu\n" ,sizeof(struct list_node), node , *key ) ; 
        for (i=0; i<KEY_SIZE; i++) {
//              node->key[i] = key[i];
//              printf("node->key[%d] = %d\n" , i , key[i]) ;
                node->key[i] = key[i]  ;
        }
        pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));
        node->value = (unsigned long *)pos_malloc(name, val_size);
//      node->value = (unsigned long *)malloc(val_size) ; 
        //node->value = (unsigned long *)pos_malloc(name, 16) ;
//      printf("node->value : %lu\n" , node->value) ; 
        /*if( node->value == NULL){ 
                printf("NULL \n") ;
                return -1;
        }*/
        pos_clflush_cache_range(&node->value, sizeof(node->value));
        memcpy(node->value, val, val_size);
        pos_clflush_cache_range(node->value, val_size);
        node->next = head->head;
//      printf("node->next : %lu\n" , node->next) ;     

        pos_clflush_cache_range(&node->next, sizeof(node->next));
        head->head = node ;
        // cacheline flush to save nvram.
        pos_clflush_cache_range((void *)&head->head , sizeof( unsigned long )) ; 

        return 0;
	
}
int spos_list_insert(char *name, void *_key, void *_val, unsigned long val_size)
{
      printf("[pos_list_insert]\n") ;         
//      printf(" key = %d, val=%d\n" , *(int *)_key , *(int *)_val) ;   
        struct list_head * head;
        struct list_node *node;
        unsigned long *key, *val;
        int i;
//      printf("[%s]\n" , __func__) ; 

        key = (unsigned long *)_key;
        val = (unsigned long *)_val;
//      printf("key : %lu , val : %lu\n" , *key , *val) ;       
        head = (struct list_head *)pos_get_prime_object(name);
        if( head == NULL){
//              printf("head pointer is null\n") ;      
                return -1;
        }
//      printf("head : %lu \n" , head) ;        
//      printf("helo\n") ; 
        lock();
        node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));
        unlock() ;

        if( node == NULL){
//              printf("node is NULL\n") ;
                return -1;
        }
//      printf( "node size : %d , node : %lu , key :%lu\n" ,sizeof(struct list_node), node , *key ) ; 
        for (i=0; i<KEY_SIZE; i++) {
//              node->key[i] = key[i];
//              printf("node->key[%d] = %d\n" , i , key[i]) ;
                node->key[i] = key[i]  ;
        }
        pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));
        lock() ;
        node->value = (unsigned long *)pos_malloc(name, val_size);
        unlock() ;
//      node->value = (unsigned long *)malloc(val_size) ; 
        //node->value = (unsigned long *)pos_malloc(name, 16) ;
//      printf("node->value : %lu\n" , node->value) ; 
        /*if( node->value == NULL){ 
                printf("NULL \n") ;
                return -1;
        }*/
        pos_clflush_cache_range(&node->value, sizeof(node->value));
        memcpy(node->value, val, val_size);
        pos_clflush_cache_range(node->value, val_size);

        node->next = head->head;
//      printf("node->next : %lu\n" , node->next) ;     

        pos_clflush_cache_range(&node->next, sizeof(node->next));

        head->head = node;
	pos_clflush_cache_range((void*)&head->head , sizeof(unsigned long)) ;
 	sleep(11);
        return 0;
}
struct list_node* pos_alloc_node( char * name ,void *_key, void *_val,unsigned long val_size, struct list_node * next){ 
        struct list_node * node ;       
        unsigned long * key , * val ;   
        key = (unsigned long *)_key ;   
        val = (unsigned long *)_val ;   
        // 1 STEP - Alloc Node 
        lock();
        node = (struct list_node *)pos_malloc(name,sizeof(struct list_node)) ;        
        unlock() ;    
        //node = (struct list_node *)malloc(sizeof(struct list_node)) ;   
        if( node == NULL ){ 
                perror("pos_malloc") ;  
                exit(1); 
        }
//      printf("node alloc : %lu\n" , node) ; 
//      printf(" key : %d val :%d\n" , *key , *val) ;   

        // 2 STEP - SET value and key.
        int i = 0 ;     
        for(i = 0 ; i < KEY_SIZE ; i++) node->key[i] = key[i];  
        pos_clflush_cache_range( node->key , KEY_SIZE * sizeof(unsigned long));
        
        lock();       
        node->value = (unsigned long *)pos_malloc(name ,val_size) ; 
        unlock(); 
        //node->value = (unsigned long *)malloc(val_size);
        pos_clflush_cache_range(&node->value , sizeof(node->value)) ;   
        memcpy(node->value , val , val_size) ;  
        pos_clflush_cache_range(node->value , val_size) ;       
        node->next = next; 
        return node ;   

}
int skey_cmp(unsigned long * key1, unsigned long * key2){ 
	int i = 0 ; 	
	for( i = 0 ; i < 2 ; i++ ){ 
		if( key1[i] != key2[2] ){
		return 0 ;	
		}
	}
	return 1; 	
} 
/*int spos_list_stm_insert( char * name , void *_key , void *_val , unsigned long val_size){ 
        struct list_node * node ;       
        struct list_head * head ;       
	printf("[%s]\n" ,__func__) ; 	
        head = ( struct list_head *)pos_get_prime_object(name) ;        
//        lock();
        
        TM_START( 1, RW ) ;     
        node = (struct list_node *)TM_LOAD(&head->head) ;       
  //      printf("head->head : %lu\n" , head->head) ;     
        TM_STORE( &head->head , pos_alloc_node(name ,  _val , _key ,val_size, node )) ;         
        TM_COMMIT ;     
	sleep(10) ;
//        printf("after : %lu\n" , head->head) ; 
//        unlock();
}*/ 
int temp_list_stm_insert( char * name , void *_key , void *_val , unsigned long val_size){ 
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
//	node->next = head->head ; 	

	
	TM_START(1 , RW) ; 	
		node->next = TM_LOAD( &head->head ) ; 	
		pos_clflush_cache_range(&node->next , sizeof(node->next)) ; 	
		TM_STORE( &head->head , node) ; 	
		pos_clflush_cache_range((void*)&head->head , sizeof(unsigned long)) ; 
	TM_COMMIT ; 	
} 
pthread_mutex_t r_mutex = PTHREAD_MUTEX_INITIALIZER;
void r_lock(){ pthread_mutex_lock(&r_mutex);}
void r_unlock(){ pthread_mutex_unlock(&r_mutex);}
int spos_list_remove(char *name, void *_key)
{
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
			printf("Last Node\n") ; 	
			#endif  	
			if( key_cmp(prev_node->key , key)==1){ 
				node = (struct list_node *)
					TM_LOAD(&prev_node->next);
				if(node==NULL) node = 0 ;
				//head->head = node ; 
				//TM_STORE(prev_node , node ) ; 	
				TM_STORE(&head->head , node) ; 
				printf("prev_node : %p\n" , prev_node) ; 
				break;
			} 
		} 
	//while( next ){ 
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
/*	if( next != NULL ){ 
	r_lock() ;
	pos_free(name , next->value) ;
	pos_free(name , next) ;
	r_unlock() ; 	
	}*/ 
	return 0;
}
/////////////////////////////////////////////////////////////////
/////////// 			////////////////////////////////
//////////   BTREE STM		///////////////////////////////
/////////			//////////////////////////////
/////////////////////////////////////////////////////////////


// import stm interface //











static int lock_sum = 0 ; 	
void* normal_list_insert( void * data){ 
	int i = 0 ;
	for( i = 0 ; i < 30000 ; i++){ 
		npos_list_insert( obj_store , &i, &i, 8) ; 	
	}
//	for( i = 0 ; i < 1000000 ; i++){ 
//		pos_list_insert(obj_store , &i , &i, 8) ;
//	}
	return NULL ; 
} 
void* lock_list_insert(void * data){ 
	int i = 0 ;
//	t_lock() ; 	 
	for( i = 0 ; i < 30000 ; i++){ 
		t_lock() ; 
		npos_list_insert( obj_store , &i, &i, 8) ; 		
		t_unlock() ;
	}
//	t_unlock() ; 	
	return NULL ; 
} 
void* normal_list_remove( void * data){ 
	int i = 0 ; // normal list remove must execute on one thread.
	for( i = 0 ; i < 30000 ; i++){ 
		npos_list_remove( obj_store , &i ) ; 	
	}
	return NULL ; 	
} 
void* lock_list_remove( void * data){ 
	int i = 0 ; 	
//	t_lock() ; 
	for( i = 0 ; i < 30000 ; i++){ 
		t_lock() ; 	
		npos_list_remove( obj_store , &i ) ; 		
		t_unlock() ;
	}
//	t_unlock() ; 	
	return NULL ; 
} 
void* stm_list_remove(void * data){ 
	//printf("[%s] \n" , __func__) ; 	
	int i = 0 ; 	
	TM_INIT_THREAD ; 	
	for(i = 0 ; i < 30000 ; i++){ 
		spos_list_remove( obj_store, &i ) ;
	}
	TM_EXIT_THREAD ; 
	return NULL;
}  
void* selective_list_remove( void * data ){ 
	int ret_val = 0 ; 	
	int i = 0 ; 	
	t_pos_tm_init() ; //if stm mode set, TM_INIT called.
	for( i = 0 ; i < 3000 ; i++){ 
		printf("[%s]\n" , __func__ ) ;
		ret_val = t_pos_list_remove(obj_store, &i , &i, 8,thread_num);
		if(ret_val == -1){
			printf("[t_pos_list_remove] return error\n") ; 	
			return NULL ; 	
		}
	}
	t_pos_tm_exit() ; 	
	return NULL;
}
void* selective_list_insert( void * data ){ 
	int ret_val = 0 ; 	
	int i = 0 ; 	
	t_pos_tm_init() ; 	
//	TM_INIT_THREAD ; 	
	for( i = 0 ; i < 30000 ; i++){ 
//		TM_START(1 , RW) ; 	
		stm_tx_attr_t a = {{.id = 1, .read_only = RW}}; 
//		sigjmp_buf * _e = stm_start(a); 
//		if(_e != NULL) sigsetjmp(*_e, 0);

		ret_val = t_pos_list_insert(obj_store , &i , &i , 8 , thread_num, a ) ; 
		if( ret_val == -1 ){ //t_pos_list_insert return error 
			printf("[t_pos_list_insert] return error\n") ; 	
			return NULL ; 	
		}
//		TM_COMMIT ; 
//		stm_commit() ; 
	} 
//	TM_EXIT_THREAD;		
	t_pos_tm_exit() ; 	
	return NULL ; 
} 

void* stm_list_insert(void * data){ 
	//printf("[%s] \n" , __func__) ; 	
	int i = 0 ;
	int id = pthread_self() ; 	
//	TM_INIT_THREAD;
	t_pos_tm_init() ;
	for( i = 0 ; i < 30000 ; i++ ){
//	printf("%d\n" , i) ; 
		//pos_list_stm_insert( obj_store , &i  , &i , 8 ) ; 	



//		spos_list_stm_insert( obj_store , &i , &i, 8) ;
		temp_list_stm_insert( obj_store , &i , &i , 8) ;





//		spos_list_insert(obj_store , &i , &i , 8) ;
//		set_add(set , &i) ; 	
	}
	t_pos_tm_exit() ; 	
//	TM_EXIT_THREAD; 
	return NULL;
}
static int hash_sum = 0 ; 
void hash_count(){ 
	int i = 0 ; 
	printf("[%s]\n",__func__) ;
	for( i = 0 ; i < 3000000 ; i++){ 
		void * addr = pos_hashtable_search( obj_store , &static_key[i]);
		printf("[%d] %p\n" , hash_sum++ , addr) ; 	
		if(addr== NULL) return NULL   ; 	
	}
} 
void* normal_hash_insert(void * data){ 
	int i = 0 ; 
	int dat = *(int *)data ; 	
	int ret_dat = dat * 30000; 	

	for( i = 0+ret_dat ; i < 30000+ret_dat ; i++){ 
		pos_hashtable_insert(obj_store , &static_key[i] , &static_key[i] , 8) ;
	}
//	for( i = 0 ; i < 1000000; i++){ 
//		pos_hashtable_insert(obj_store , &i , &i , 8) ;
//	}
} 
void* lock_hash_insert(void * data ){ 
	int i = 0 ; 	
	int dat = *(int *)data ; 	
	int ret_dat = dat *30000 ; 	
//	t_lock() ; 	
	for( i = 0+ret_dat; i < 30000+ret_dat ; i++){ 
		t_lock() ; 	
		pos_hashtable_insert(obj_store , &static_key[i], &static_key[i], 8) ; 	
		t_unlock();
	}
//	t_unlock() ; 	
} 
void* stm_hash_insert( void * data ){ 
	//printf("[%s] \n" , __func__ ) ; 	
	int i = 0 ; 
	int dat = *(int *)data ; 	
	int ret_dat = dat * 30000 ; 		
	TM_INIT_THREAD ; 	
	for( i = 0+ret_dat ; i < 30000+ret_dat ; i++ ){ 
		spos_hashtable_insert( obj_store , &static_key[i] , &static_key[i], 8 ) ; 	

	}
	TM_EXIT_THREAD ; 	
} 
static int btree_sum = 0 ; 	 

void btree_count(){ 
	int i = 0 ; 	
	for( i=0; i < 3000000 ; i++){ 
		void * addr = btree_lookup( obj_store , &static_key[i]) ; 	
		if(addr == NULL) sleep(2) ; 	
		printf("[%d] found addr : [%p]\n" , i , addr) ; 	
	}
} 
void* stm_btree_insert(void * data){ 
	int i = 0 ; 	
	int dat = *(int *)data ; // get thread number to send key.
	int ret_dat = dat * 30000 ; 	
	TM_INIT_THREAD ; 	
	for( i = 0+ret_dat ; i<30000+ret_dat ; i++){
//		spos_btree_insert(obj_store, &static_key[i], &static_key[i],0);
	}
	TM_EXIT_THREAD ; 
}
void* lock_btree_insert(void * data){ 
	int i = 0 ; 	
	int dat = *(int*)data ; 	
	int ret_dat = dat*30000 ; 	
	t_lock() ; 	
	for( i = 0+ret_dat ; i < 30000+ret_dat ; i++){
		pos_btree_insert(obj_store , &static_key[i], &static_key[i],0);
	}
	t_unlock() ; 
} 
void* normal_btree_insert(void * data){ 
	int i = 0 ; 	
	int dat = *(int*)data ; 	
	int ret_dat = dat*30000 ; 	
	for( i = 0+ret_dat ; i < 3000+ret_dat ; i++){
		pos_btree_insert(obj_store , &static_key[i], &static_key[i],0);
	}
//	for( i = 0 ; i < 1000000 ; i++){ 
//		pos_btree_insert(obj_store, &static_key[i] , &static_key[i],0);
//	}
} 

void* lock_btree_remove(void * data){ 
	int i = 0 ; 	
	int dat = *(int *)data ; 	
	int ret_dat = dat * 30000 ; 	
	t_lock() ; 	
	for( i = 0+ret_dat ; i<30000+ret_dat;i++ ){ 
		pos_btree_remove(obj_store , &static_key[i]) ; 
	}
	t_unlock() ; 	
} 
void* normal_btree_remove(void * data){ 
	int i = 0 ; 
	int dat = *(int *)data ; 	
	int ret_dat = dat * 30000 ; 	
	for( i = 0+ret_dat ; i < 30000+ret_dat; i++){ 
		pos_btree_remove(obj_store , &static_key[i]) ; 	
	}	
} 
void* stm_btree_remove(void * data){ 
	//printf("[%s]\n" , __func__ ) ;
	int i = 0 ; 	
	int dat = *(int *)data ; 	
	int ret_dat = dat*30000 ; 	


	TM_INIT_THREAD ; 	
	for( i = 0+ret_dat ; i < 30000+ret_dat ; i++){ 
		//printf("[%d]'s remove\n" , i) ;
		//spos_btree_remove( obj_store , &static_key[i]) ; 		
	}	
	TM_EXIT_THREAD ; 
}
void* lock_hash_remove(void * data){ 
	int i = 0 ;	
	int dat = *(int *)data ; 	
	int ret_dat = dat * 30000 ; 	

//	t_lock() ;
	for(i = 0+ret_dat ; i < 30000+ret_dat ; i++){ 
		//pos_hashtable_remove(obj_store , &static_key[i]) ; 
		t_lock() ; 	
		spos_lock_hashtable_remove(obj_store , &static_key[i]) ; 	
		t_unlock() ; 	
		//pos_hashtable_remove( obj_store , &i) ;
	}
//	t_unlock();
} 
void* normal_hash_remove(void*data){
	int i = 0 ; 	
	int dat = *(int*)data ; 	
	int ret_dat = dat * 30000 ; 	

	for(i = 0+ret_dat ; i < 30000+ret_dat ; i++){ 
		pos_hashtable_remove(obj_store , &static_key[i]) ; 
	}
}
void* stm_hash_remove( void * data ){ 
	//printf("[%s] \n" , __func__ ) ; 	
	int i = 0 ; 	
	int dat = *(int*)data ; 	
	int ret_dat = dat * 30000 ; 	

	TM_INIT_THREAD ; 	
	for(i = 0+ret_dat ; i < 30000+ret_dat ; i++){ 
		spos_hashtable_remove(obj_store , &static_key[i])  ; 
		//pos_hashtable_remove( obj_store , &i) ;
	}
	TM_EXIT_THREAD ; 
} 
void help(){ 
	printf(" Usage : ./performance_test [object_store] [thread_num] [mode]\n\n") ; 	
	printf(" [mode specification] \n") ; 	
	printf(" =======  LIST  ======  \n") ; 	
	printf(" [1]  stm    insert mode \n") ; 	
	printf(" [2]  lock   insert mode \n") ; 	
	printf(" [3]  normal insert mode \n") ; 	
	printf(" [4]  stm    remove mode \n") ; 	
	printf(" [5]  lock   remove mode \n") ; 	
	printf(" [6]  normal remove mode \n") ; 	
	
	printf("\n") ; 	
	printf(" ====== HASH TABLE ===== \n") ;
	printf(" [7]  stm    insert mode \n") ; 	
	printf(" [8]  lock   insert mode \n") ; 	
	printf(" [9]  normal insert mode \n") ; 	
	printf(" [10] stm    remove mode \n") ; 	
	printf(" [11] lock   remove mode \n") ; 	
	printf(" [12] normal remove mode \n") ; 	

	printf("\n") ; 
	printf(" =======   BTREE   ======\n") ;
	printf(" [13]  stm    insert mode \n") ; 	
	printf(" [14]  lock   insert mode \n") ; 	
	printf(" [15]  normal insert mode \n") ; 	
	printf(" [16] stm    remove mode \n") ; 	
	printf(" [17] lock   remove mode \n") ; 	
	printf(" [18] normal remove mode \n") ; 	

	printf("\n\n") ; 	
	printf("======= COUNT =======\n") ; 	
	printf("[20] hash count\n") ; 	
	printf("[21] list count\n") ; 
	printf("[22] btree count\n") ; 	
} 
int main(int argc , char ** argv){ 
	struct timeval T1,T2 ;
	pthread_t * threads; 
	// input obj , thread_num ;
	if( argc != 4){ 
		help() ; 	
		return ; 
	}
	// get argument value 
	obj_store = argv[1] ; 	
	thread_num = atoi( argv[2] ) ; 	
	int mode = atoi( argv[3] ) ; 	
	// To send thread to their value
	int a[50] = {0} ; 	
	int q = 0 ;
	int i = 0 ; 
	int j = 0 ;
 		
	for( q = 0 ; q < 50; q++){ 
		a[q] = q; 	
	}

	if(( threads = (pthread_t *)malloc(thread_num * sizeof(pthread_t)))==NULL){
		perror("malloc");
		exit(1); 
	}
	int ret = 0 ; // to error checking 
	if( mode >= 1 && mode <= 6 || mode == 21){//if mode is list
		if((mode == 3 || mode == 6 )&& thread_num > 1 ){ 
			printf("[normal must not have more than one thread]\n");
			return ; // normal thread check 
		}
//		spos_list_init( obj_store ) ; 	
//		spos_list_open( obj_store ) ; 
		ret = spos_list_init( obj_store ) ; 	
		ret = spos_list_open( obj_store ) ; 	
	}else if( mode >= 7 && mode <= 12 || mode == 20 ){//if mode is hashtable.
		if( (mode == 9 || mode == 12) && thread_num > 1 ){ 
			printf("[normal must not have more than one thread]\n");
			return ; //normal thread check
		}
		int rec_num = 8 ; 	
		ret = pos_create_hashtable(obj_store , rec_num , NULL, NULL);
		ret = pos_hashtable_open( obj_store ) ; 	
		
	}else if( mode >= 13 && mode <= 18 || mode == 22 ){ 
		if((mode==15 || mode==18)&&thread_num > 1){ 
			printf("[normal must not have more than one thread]\n");
			return ; 	
		}
		ret = pos_btree_init(obj_store) ; 	
		ret = pos_btree_open(obj_store) ; 	
	}else if( mode == 99 || mode == 100 ) { //selective test 
		spos_list_init( obj_store ) ; 	
		spos_list_open( obj_store ) ; 	

//		ret = t_pos_list_init( obj_store , thread_num ) ; 	
//		ret = t_pos_list_open( obj_store , thread_num ) ;	
	}

/*	if( num == 1 || num == 2 || num == 10 || num == 11 ){ // list 
		spos_list_init( obj_store ) ; 	
		int ret = spos_list_open(obj_store) ; 	
	}else if( num == 3 || num == 4 ){ // hash 
		int rec_num = 8; //min_size of hashtable ;
	//	int ret = spos_create_hashtable( obj_store , rec_num , NULL , NULL ) ; 
	//	ret = spos_hashtable_open(obj_store); // hashtable open.			
		pos_create_hashtable(obj_store , rec_num , NULL , NULL ) ; 	
		pos_hashtable_open( obj_store ) ; 	

		//printf("RET =%d\n" , ret) ; 
	}else if( num == 5 || num == 6 || num == 7){ 
		int ret = pos_btree_init(obj_store) ; 	
		ret = pos_btree_open( obj_store ) ; 	
		// global key initialization
		int j = 0 ; 	
		for( j = 0 ; j < 31000 ; j++ ){
			static_key[j] = j ; 	
		}

	} 
*/	
	// To lookup btree node, 
	for( j = 0 ; j < 3100000 ; j++ ){ 
		static_key[j] = j ; 	
	}

	TM_INIT; //this is coded in pos_list_init(?) or pos_list_close(?)
	// LIST PART
	if( mode == 100 ){ 
		printf("[selective remove mode]\n") ; 	
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i] , NULL , selective_list_remove , NULL)!=0)
			{ 	
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 	
			}
		} 
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_join(threads[i] , NULL)!=0){ 
				fprintf( stderr,"Error wating for thread\n");
				exit(1) ; 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
		spos_list_close(obj_store) ; 	
	
	}else if( mode == 99){ 
		printf("[selective insert  mode]\n") ;

		gettimeofday(&T1,NULL) ; 
		for( i = 0 ; i < thread_num ; i++){ 	
                  if(pthread_create(&threads[i] , NULL , selective_list_insert , NULL)!=0){
                        fprintf(stderr, "Error creating threads\n") ;
                        exit(1);
                  }
                }
                for( i = 0 ; i < thread_num ; i++){ 
                  if( pthread_join(threads[i] , NULL) != 0){
                        fprintf(stderr, "Error waiting for therad completion\n") ;
                        exit(1) ;
                  }
                }
                gettimeofday(&T2,NULL) ;
                print_time( T1,T2) ;

                //get_clflush_count() ;         

                spos_list_close(obj_store) ;

	}
	else if(mode == 1){ // mode is stm insert mode
		
		system("clear") ;      
		printf("\n\n\n\t*********************************************\n") ; 
		printf("\t\t Data structure     : [LIST]\n") ;      
		printf("\t\t Based operation  : [STM]\n") ;
		printf("\t\t Insert/Remove    : [INSERT]\n") ; 	
		printf("\t\t Insert per thread : [30,000 ops]\n") ;
		printf("\t********************************************\n") ;      
		sleep(2) ; 
	
		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
		  if(pthread_create(&threads[i] , NULL , stm_list_insert , NULL)!=0){
			fprintf(stderr, "Error creating threads\n") ; 	
			exit(1); 
		  }
		}
		for( i = 0 ; i < thread_num ; i++){ 
		  if( pthread_join(threads[i] , NULL) != 0){
		  	fprintf(stderr, "Error waiting for therad completion\n") ; 	
			exit(1) ; 	
		  }
		}
		gettimeofday(&T2,NULL) ; 	
		print_time( T1,T2) ;
	
		//get_clflush_count() ; 	

		spos_list_close(obj_store) ; 
		//pos_list_destroy( obj_store) ; 

	}else if(mode == 2){ // lock list insert

               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;
                printf("\t\t Data structure     : [LIST]\n") ;
                printf("\t\t Based operation  : [LOCK]\n") ;
		printf("\t\t Insert/Remove    : [INSERT]\n") ; 	
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;     

		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){
		  if(pthread_create(&threads[i] , NULL , lock_list_insert , NULL)!=0){
			fprintf(stderr, "Error creating threads\n") ; 	
			exit(1); 
		  }
		}
		for( i = 0 ; i < thread_num ; i++){ 
		  if( pthread_join(threads[i] , NULL) != 0){
		  	fprintf(stderr, "Error waiting for therad completion\n") ; 	
			exit(1) ; 	
		  }
		}
		gettimeofday(&T2,NULL) ; 	
		print_time( T1,T2) ;
		
		//get_clflush_count(); 

		spos_list_close(obj_store) ; 
	}else if( mode == 3){ // normal list insert

               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;
                printf("\t\t Data structure     : [LIST]\n") ;
                printf("\t\t Based operation  : [NORMAL]\n") ;
		printf("\t\t Insert/Remove    : [INSERT]\n") ; 	
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;     


		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < 1 ; i++ ){
		  if(pthread_create(&threads[i] , NULL , normal_list_insert , NULL)!=0){
			fprintf(stderr, "Error creating threads\n") ; 	
			exit(1); 
		  }
		}
		for( i = 0 ; i < 1 ; i++){ 
		  if( pthread_join(threads[i] , NULL) != 0){
		  	fprintf(stderr, "Error waiting for therad completion\n") ; 	
			exit(1) ; 	
		  }
		}
		gettimeofday(&T2,NULL) ; 	
		print_time( T1,T2) ;

	//	get_clflush_count() ; 	
		
		spos_list_close(obj_store) ; 
	}else if( mode == 4 ){ // stm list remove
                system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;
                printf("\t\t Data structure   : [LIST]\n") ;
                printf("\t\t Based operation  : [STM]\n") ;
		printf("\t\t Insert/Remove    : [REMOVE]\n") ; 	
                printf("\t\t Insert per thread: [30,000 ops]\n") ;
                printf("\t********************************************\n") ;     

		

		gettimeofday(&T1, NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,stm_list_remove,NULL)!=0){
				fprintf(stderr, "Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1);  	
			}
		}
		gettimeofday(&T2, NULL) ; 	
		print_time( T1 , T2 ) ; 

		//get_clflush_count() ; 	
	
		spos_list_close( obj_store ) ; 	
	}else if( mode == 5 ){ // lock list remove
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;
                printf("\t\t Data structure     : [LIST]\n") ;
                printf("\t\t Based operation  : [LOCK]\n") ;
                printf("\t\t Insert/Remove    : [REMOVE]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;     


		gettimeofday(&T1, NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,lock_list_remove,NULL)!=0){
				fprintf(stderr, "Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1);  	
			}
		}
		gettimeofday(&T2, NULL) ; 	
		print_time( T1 , T2 ) ; 

		//get_clflush_count() ; 
	
		spos_list_close( obj_store ) ; 	
	}else if( mode == 6 ){ // normal list remove
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;
                printf("\t\t Data structure     : [LIST]\n") ;
                printf("\t\t Based operation  : [NORMAL]\n") ;
                printf("\t\t Insert/Remove    : [REMOVE]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;     
	

		gettimeofday(&T1, NULL) ; 	
		for( i = 0 ; i < 1 ; i++ ){ 
			if(pthread_create(&threads[i],NULL,normal_list_remove,NULL)!=0){
				fprintf(stderr, "Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < 1  ; i++ ){ 
			if(pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1);  	
			}
		}
		gettimeofday(&T2, NULL) ; 	
		print_time( T1 , T2 ) ;

		//get_clflush_count() ; 
 	
		spos_list_close( obj_store ) ; 	
	}
	// HASH TABLE PART
	else if( mode == 7 ){ // stm hash insert
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;
                printf("\t\t Data structure     : [HASH]\n") ;
                printf("\t\t Based operation  : [STM]\n") ;
                printf("\t\t Insert/Remove    : [INSERT]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;     


		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,stm_hash_insert,(void*)&a[i])!=0){
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if( pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 

		//get_clflush_count(); 
	
		spos_hashtable_close(obj_store) ; 	

	}else if( mode == 8){ // lock hash insert 
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;             
                printf("\t\t Data structure     : [HASH]\n") ;
                printf("\t\t Based operation  : [LOCK]\n") ;
                printf("\t\t Insert/Remove    : [INSERT]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;                            



		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,lock_hash_insert,(void*)&a[i])!=0){
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if( pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 
	
		//get_clflush_count() ; 
			
		spos_hashtable_close(obj_store) ; 	
	}else if( mode == 9){ //normal hash insert 
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;             
                printf("\t\t Data structure     : [HASH]\n") ;
                printf("\t\t Based operation  : [NORMAL]\n") ;
                printf("\t\t Insert/Remove    : [INSERT]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;                            



		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < 1 ; i++ ){ 
			if(pthread_create(&threads[i],NULL,normal_hash_insert,(void*)&a[i])!=0){
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < 1 ; i++ ){ 
			if( pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 

		//get_clflush_count() ; 	
	
		spos_hashtable_close(obj_store) ; 	 
	}else if( mode == 10){ // stm hash remove 
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;             
                printf("\t\t Data structure     : [HASH]\n") ;
                printf("\t\t Based operation  : [STM]\n") ;
                printf("\t\t Insert/Remove    : [REMOVE]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;                            



		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,stm_hash_remove,(void*)&a[i])!=0){
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if( pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
	
		//get_clflush_count() ; 	

		spos_hashtable_close(obj_store) ; 	 
	}else if( mode == 11){ //lock hash remove
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;             
                printf("\t\t Data structure     : [HASH]\n") ;
                printf("\t\t Based operation  : [LOCK]\n") ;
                printf("\t\t Insert/Remove    : [REMOVE]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;                            

		

		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,lock_hash_remove,(void*)&a[i])!=0){
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if( pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	

		//get_clflush_count() ; 	
	
		spos_hashtable_close(obj_store) ; 	 
	}else if(mode == 12){ // normal hash remove
               system("clear") ;
                printf("\n\n\n\t*********************************************\n") ;             
                printf("\t\t Data structure     : [HASH]\n") ;
                printf("\t\t Based operation  : [NORMAL]\n") ;
                printf("\t\t Insert/Remove    : [REMOVE]\n") ;
                printf("\t\t Insert per thread : [30,000 ops]\n") ;
                printf("\t********************************************\n") ;                            



		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i],NULL,normal_hash_remove,(void*)&a[i])!=0){
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if( pthread_join( threads[i] , NULL ) != 0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
		
		//get_clflush_count(); 

		spos_hashtable_close(obj_store) ; 	 
	}
	// BTREE PART 

	else if( mode == 13){// btree stm insert  
		gettimeofday(&T1 , NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i],NULL,stm_btree_insert,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 	
			}
		}
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_join( threads[i] , NULL)!=0){ 
				fprintf(stderr,"Error waiting for thread completion\n") ; 	
				exit(1); 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 

	
		pos_btree_close(obj_store) ; 	

	}else if( mode == 14){// btree lock insert 
		gettimeofday(&T1 , NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i],NULL,lock_btree_insert,(void *)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 	
			}
		}
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_join( threads[i] , NULL)!=0){ 
				fprintf(stderr,"Error waiting for thread completion\n") ; 	
				exit(1); 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
		pos_btree_close(obj_store) ; 	

	}else if( mode == 15){// btree normal insert 
		gettimeofday(&T1 , NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i],NULL,normal_btree_insert,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 	
			}
		}
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_join( threads[i] , NULL)!=0){ 
				fprintf(stderr,"Error waiting for thread completion\n") ; 	
				exit(1); 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
		pos_btree_close(obj_store) ; 	

	}else if( mode == 16){// btree stm remove 
		gettimeofday(&T1 , NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i],NULL,stm_btree_remove,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 	
			}
		}
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_join( threads[i] , NULL)!=0){ 
				fprintf(stderr,"Error waiting for thread completion\n") ; 	
				exit(1); 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
		pos_btree_close(obj_store) ; 	

	}else if( mode == 17){// btree lock remove 

		gettimeofday(&T1 , NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i],NULL,lock_btree_remove,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 	
			}
		}
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_join( threads[i] , NULL)!=0){ 
				fprintf(stderr,"Error waiting for thread completion\n") ; 	
				exit(1); 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
		pos_btree_close(obj_store) ; 	

	}else if( mode == 18){// btree normal remove 
		gettimeofday(&T1 , NULL) ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i],NULL,normal_btree_remove,(void*)&a[i])!=0){ 
				fprintf(stderr,"Error creating threads\n") ; 	
				exit(1); 	
			}
		}
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_join( threads[i] , NULL)!=0){ 
				fprintf(stderr,"Error waiting for thread completion\n") ; 	
				exit(1); 	
			}
		}
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 	
		pos_btree_close(obj_store) ; 	

	}else if(mode == 20){ //hash count 
		hash_count() ; 	
	}else if(mode == 21){ 
		list_count() ; 
	}else if(mode == 22){ 
		btree_count() ; 
	}


	/*else if( mode == 13 ){ 

		gettimeofday(&T1,NULL) ; 	
		for( i = 0 ; i < 1 ; i++ ){
		  if(pthread_create(&threads[i] , NULL , normal_list_insert , NULL)!=0){
			fprintf(stderr, "Error creating threads\n") ; 	
			exit(1); 
		  }
		}
		for( i = 0 ; i < 1 ; i++){ 
		  if( pthread_join(threads[i] , NULL) != 0){
		  	fprintf(stderr, "Error waiting for therad completion\n") ; 	
			exit(1) ; 	
		  }
		}
		gettimeofday(&T2,NULL) ; 	
		print_time( T1,T2) ;
		
	}*/ 
/*	}else if( num == 2 ){ 
	        int i = 0 ;     
		gettimeofday(&T1 , NULL) ; 	
     	  	 for( i = 0 ; i < thread_num ; i++ ){ 
    	      if(pthread_create(&threads[i] , NULL , stm_list_remove , NULL)!=0){
  	              fprintf(stderr, "Error creating threads\n") ;
     	           exit(1);
     	      }
     	  }
      	  //Waiting for thread completion
     	   for( i = 0 ; i < thread_num ; i++){ 
      	    if( pthread_join(threads[i] , NULL) != 0){
     	           fprintf(stderr, "Error waiting for therad completion\n") ;
      	          exit(1) ;
      	    }
      	  }
	  gettimeofday(&T2 , NULL) ; 	
	  print_time(T1 ,T2) ; 
    	  int size ;
   	  // Get Node count to call function set_size 
      	  //pos_count( obj_store ) ;
          spos_list_close(obj_store) ;
		
	  //end list remove

	}else if( num == 3 ){ 
		gettimeofday(&T1, NULL) ; 	
	        int i = 0 ;     
     	  	 for( i = 0 ; i < thread_num ; i++ ){ 
    	      if(pthread_create(&threads[i] , NULL , stm_hash_insert , NULL)!=0){
  	              fprintf(stderr, "Error creating threads\n") ;
     	           exit(1);
     	      }
     	  }
      	  //Waiting for thread completion
     	   for( i = 0 ; i < thread_num ; i++){ 
      	    if( pthread_join(threads[i] , NULL) != 0){
     	           fprintf(stderr, "Error waiting for therad completion\n") ;
      	          exit(1) ;
      	    }
      	  }
		gettimeofday(&T2, NULL) ; 	
		print_time(T1 ,T2) ; 	
    	  //int size ;
   	  // Get Node count to call function set_size 
      	  //pos_count( obj_store ) ;
          //spos_list_close(obj_store) ;

//	    spos_hashtable_count( obj_store ) ; 	
	    pos_hashtable_close(obj_store) ; 
//	    spos_hashtable_count( obj_store) ; 	 
//	    spos_hashtable_close( obj_store) ; 	
	}else if( num == 4 ){
		int i = 0 ; 	
		gettimeofday(&T1, NULL) ; 	
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_create(&threads[i] , NULL , stm_hash_remove , NULL)!=0){ 
				fprintf(stderr, "Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < thread_num ; i++ ){ 
			if(pthread_join(threads[i] , NULL) != 0 ){
				fprintf(stderr , "Error waiting for thread completion\n") ; 	
				exit(1); 
			}
		}
		gettimeofday(&T2,  NULL) ; 	
		print_time(T1,T2) ;
		//spos_hashtable_count( obj_store ) ; 	
		//spos_hashtable_close( obj_store ) ; 	
		pos_hashtable_close( obj_store ) ; 
	}else if( num == 5 ){

		gettimeofday(&T1,NULL) ; 	
 
		// btree 30,000 insert
 		int i = 0 ; 	
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_create(&threads[i] , NULL , stm_btree_insert , (void *)&a[i])!=0){ 
				fprintf(stderr, "Error creating threads\n") ; 	
				exit(1);
			}
		}
		for( i = 0 ; i < thread_num ; i++){ 
			if(pthread_join(threads[i] , NULL)!=0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		} 
		
		gettimeofday(&T2,NULL) ; 	
		print_time(T1,T2) ; 
		//spos_btree_count( obj_store ) ; 	
		pos_btree_close( obj_store) ; 	
	}else if( num == 6 ){ 
		// btree 30,000 remove
 		int i = 0 ; 	
		for( i = 0 ; i < 10 ; i++){ 
			if(pthread_create(&threads[i] , NULL , stm_btree_remove , (void *)&a[i])!=0){ 
				fprintf(stderr, "Error creating threads\n") ; 	
				exit(1);
			}
		}
		for( i = 0 ; i < 10 ; i++){ 
			if(pthread_join(threads[i] , NULL)!=0){ 
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1) ; 	
			}
		} 
		//spos_btree_count( obj_store ) ; 	
		pos_btree_close( obj_store) ; 	
	}else if( num == 7 ){ 
		//btree 30,000 lookup
		int i = 0 ; 	
		for( i = 0 ; i < 1; i++){ 
			if(pthread_create(&threads[i] , NULL , stm_btree_lookup, (void *)&a[i])!=0){
				fprintf(stderr, "Error creating threads\n") ; 	
				exit(1) ; 	
			}
		}
		for( i = 0 ; i < 1 ;i++){ 
			if(pthread_join(threads[i] , NULL)!=0){
				fprintf(stderr, "Error waiting for thread completion\n") ; 	
				exit(1); 	
			}
		}
		pos_btree_close(obj_store) ; 	
	}
	*/

	TM_EXIT; //this is coded in pos_list_delete(?) or pos_list_close(?) 
} 
