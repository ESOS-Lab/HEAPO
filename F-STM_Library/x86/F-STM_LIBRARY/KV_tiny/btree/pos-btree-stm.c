/* 
	Author : Keonwoo Lee (kunulee@hanyang.ac.kr)
*/ 
#include "pos-btree.h" 
#include "pos-btree-stm.h"
#include "../stm_lib/pos_stm.h"
#include "../pos-lib.h"
#include<string.h>
#include<stdio.h>
#include<pthread.h> 
#define KEONWOO_DEBUG 		(0)

/* prototype of btree operations */ 
static void stm_merge(char * name , struct btree_head * head , struct btree_geo * geo ,
         int level ,unsigned long * left , int lfill ,
         unsigned long * right , int rfill ,
         unsigned long * parent , int lpos);
int stm_btree_remove_level( char * name , struct btree_head * head , struct btree_geo * geo , unsigned long *key , int level );
static void stm_btree_shrink( char * name , struct btree_head * head , struct btree_geo * geo);
static void stm_rebalance(char * name , struct  btree_head * head , struct btree_geo * geo , unsigned long * key , int level , unsigned long * child , int fill );


pthread_mutex_t btree_mutex = PTHREAD_MUTEX_INITIALIZER ; 	
void btree_lock(){ pthread_mutex_lock(&btree_mutex); } 
void btree_unlock(){ pthread_mutex_lock(&btree_mutex); } 

pthread_mutex_t st_mutex = PTHREAD_MUTEX_INITIALIZER;
void st_lock(){ pthread_mutex_lock(&st_mutex);}
void st_unlock(){ pthread_mutex_unlock(&st_mutex);}


static int n_c = 0 ; //to check null count 	
static int a_c = 0 ; //to check addr count
// open , close , insert , remove 
int 
stm_pos_btree_init( char *name ){ 
	int ret_val = 0 ; 	
	struct btree_head *head; 	
	if( name == NULL ){ 
		perror("[stm_pos_btree_init] name field null\n") ; 	
		exit(-1);
	}
	if(pos_create(name) == 0){ 
		PR_DEBUG("[%s] already created\n" , __func__ ) ; 	
		return -1;	
	}
	ret_val = stm_pos_create_object(name ,TOT_TM) ; 	
	if(ret_val == -1){ 
		PR_DEBUG("[%s] stm_pos_create_object err\n", __func__ ) ; 
		return -1; 	
	}
	head = (struct btree_head *)pos_malloc(name,sizeof(struct btree_head)) ; 	
	pos_set_prime_object(name , head) ; 	
	__btree_init(head) ; 	
	PR_DEBUG("[%s] log_unmap called\n" , __func__ ) ; 	
	stm_pos_log_unmap(name) ; 	
	PR_DEBUG("[%s] unmap called\n" , __func__ ) ; 	
	pos_unmap(name) ; 	
	return 0 ;
} 
int stm_pos_btree_open(char *name){ 
	/* TRANSACTION MEMORY INIT */
	TM_INIT;
 	if( name == NULL ){
		perror("[stm_pos_btree_open] name field null\n");
		exit(-1);
	}
	int ret_val = 0;
	PR_DEBUG("[%s] pos_map called\n",__func__); 
	ret_val = pos_map(name);
	PR_DEBUG("[%s] stm_pos_log_map called\n",__func__);		
	ret_val = stm_pos_log_map(name);
	PR_DEBUG("[%s]\n", __func__);
	ret_val = stm_pos_recovery(name);		
	if(ret_val != 0){
		perror("[stm_pos_list_open recovery failed]\n"); 
		exit(-1);
	}
	return 0 ; 
} 
int stm_pos_btree_close(char *name){ 
	pos_unmap(name) ; 
	/* TRANSACTION MEMORY EXIT */ 
	TM_EXIT ; 	
}
unsigned long* stm_bkey(struct btree_geo *geo, unsigned long *node, int n){ 
	unsigned long *s = (unsigned long *)TM_LOAD(&node) ; 
	return &s[n * geo->keylen] ; 
}
unsigned long* stm_longset( unsigned long *s, unsigned long c , size_t n ){
	size_t i ; 	
	unsigned long *_s = ( unsigned long *)TM_LOAD(&s) ; 	
	unsigned long _c  = ( unsigned long  )TM_LOAD(&c) ; 
	for( i = 0 ; i < n ; i++ ) TM_STORE( &_s[i] , _c ) ; 
//	pos_clflush_cache_range(_s, n*sizeof(unsigned long)) ; 	
	return _s; 
} 
int stm_longcmp(const unsigned long *l1, const unsigned long *l2, size_t n){ 
        size_t i ;
        unsigned long * _l1 = (unsigned long *)TM_LOAD(&l1) ;
        unsigned long * _l2 = (unsigned long *)TM_LOAD(&l2) ;
        for( i = 0 ; i < n ; i++ ){
                //consider tinystm.
                if(_l1[i] < _l2[i])return -1;
                if(_l1[i] > _l2[i])return  1;
        }
        return 0 ;
}
int stm_keycmp( struct btree_geo *geo, unsigned long *node , int pos, unsigned long *key){
	return stm_longcmp( stm_bkey(geo,node,pos),key,geo->keylen);
} 
unsigned long* stm_longcpy( unsigned long *dest, const unsigned long *src, size_t n){ 
	size_t i; 
	unsigned long *_src = (unsigned long *)TM_LOAD(&src) ; 	
	for( i = 0 ; i < n ; i++ ){ 
		TM_STORE(&dest[i] , _src[i]) ; 
	}
	//pos_clflush_cache_range( dest , n*sizeof(unsigned long)) ; 	
	return dest; 
} 

void stm_clearpair(struct btree_geo *geo, unsigned long *node, int n){ 
        stm_longset( stm_bkey( geo , node , n) , 0, geo->keylen);
        TM_STORE(&node[geo->no_longs+n] , 0) ;
        //pos_clflush_cache_range(&node[geo->no_longs+n],sizeof(unsigned long));
}  
void stm_setkey(struct btree_geo *geo, unsigned long *node, int n, unsigned long *key){

//	PR_DEBUG(" node[%p],n[%d],key[%d]\n", node , n , *key) ; 	

	stm_longcpy( stm_bkey(geo,node,n),key,geo->keylen);
} 
void stm_setval(struct btree_geo *geo, unsigned long *node, int n, void *val){ 
	
//	PR_DEBUG(" node[%p],n[%d],val[%d]\n", node , n , *(int*)val) ; 
	TM_STORE(&node[geo->no_longs+n] , (unsigned long)val) ; 	
	//pos_clflush_cache_range(&node[geo->no_longs+n],sizeof(unsigned long)) ; 	
} 
void* stm_bval(struct btree_geo *geo, unsigned long *node, int n){ 
	void *ret = TM_LOAD((void*)&node[geo->no_longs+n]);
	return ret; 	
} 

unsigned long* stm_btree_node_alloc( char *name ){ 
        unsigned long * node ;
        int i ;
        node = (unsigned long *)pos_malloc(name , NODESIZE) ;
        if(node){
                memset(node , 0 , NODESIZE) ;
        }
        pos_clflush_cache_range( &node , NODESIZE ) ;
        return node ;
} 
void* stm_bval2( struct btree_geo *geo, unsigned long *node , int n ){ 
        void * a = TM_LOAD((void *)&node[geo->no_longs + n] ) ;
        return a ;
}  
int stm_getfill( struct btree_geo *geo, unsigned long *node, int start){ 
        int i;
        for (i = start; i < geo->no_pairs; i++){
                if (!stm_bval2(geo, node, i))
                        break;
        }
        return i;

}
unsigned long* stm_find_level(char *name, struct btree_head *head, struct btree_geo *geo, unsigned long *key, int level){ 
	unsigned long *node = (unsigned long *)TM_LOAD(&head->node); 	
	int i , height ; 	
        int _height = (int)TM_LOAD(&head->height) ;
        for( height = _height ; height > level ; height-- ){
                for( i = 0 ; i < geo->no_pairs ; i++)
                        if(stm_keycmp(geo,node,i,key) <= 0) break;
                if(( i == geo->no_pairs) || !stm_bval2(geo,node,i)){
                        //PR_DEBUG("This is necessary?\n") ;
                        i-- ;
                        stm_setkey( geo , node , i , key) ;
                }
		
                node = (unsigned long *)stm_bval(geo,node,i);
        }
        return node ;

}
int stm_getpos( struct btree_geo *geo , unsigned long *node, unsigned long *key){ 
	int i ;  
	for( i=0 ; i<geo->no_pairs ; i++){ 
		if(stm_keycmp( geo, node, i, key) <= 0){ 	
			break ; 	
		}
	}	
	return i ;
}   
int stm_btree_insert_level( char *name, struct btree_head *head, struct btree_geo *geo, unsigned long *key, void *val, unsigned long val_size, int level){ 
	PR_DEBUG("[%s] start\n" , __func__) ; 	
	unsigned long *node ; 	
	int i,pos,fill,err  ; 
        int head_height ;
        head_height = (int)TM_LOAD(&head->height) ;
	PR_DEBUG("[%s] head_height[%d]\n", __func__ ,head_height) ; 	
	if( head_height < level ){ 

		unsigned long * tmp_node ; 	
//		unsigned long *head_node ; 
		unsigned long * head_node = (unsigned long *)TM_LOAD(&head->node); 
		PR_DEBUG( "[%s]head_node[%p]\n",__func__, head_node ) ; 	

		int tmp_fill ; 
		//btree_lock() ; 	
		st_lock(); 
		tmp_node = stm_btree_node_alloc( name ) ; 	
		PR_DEBUG( "[%s]tmp_node[%p]\n",__func__,tmp_node) ;	
		//btree_unlock() ; 
		st_unlock() ;
		if(head_node){ 
			tmp_fill = stm_getfill( geo , head_node , 0 ) ; 	
			stm_setkey( geo, tmp_node, 0, stm_bkey(geo, head_node, tmp_fill-1));
			stm_setval( geo, tmp_node, 0, head_node) ; 			
		}
		TM_STORE(&head->node , tmp_node) ;
		TM_STORE(&head->height, head->height+1) ;
		PR_DEBUG("[%s] if-end\n" ,__func__) ; 	
		//pos_clflush_cache_range(head,sizeof(struct btree_head)) ; 
	}
retry: 
	node = stm_find_level(name , head , geo , key , level) ; 
	PR_DEBUG("[%s] node[%p]\n",__func__,node) ; 	
	pos = stm_getpos(geo, node , key) ; 	
	PR_DEBUG("[%s] pos[%d]\n" ,__func__ , pos) ; 	
	fill = stm_getfill(geo, node , pos) ; 
	PR_DEBUG("[%s] fille[%d]\n", __func__ , fill) ; 
	if( fill == geo->no_pairs ){ 
		unsigned long *new; 	
		st_lock() ; 	
		//btree_lock() ; 	
		new = stm_btree_node_alloc(name); 
		st_unlock() ;
		//btree_unlock() ; 
		if(!new){ 
			PR_DEBUG("[btree_node_alloc] return NULL\n") ; 	
			return -1;	
		}
		err = stm_btree_insert_level( name , head , geo , stm_bkey(geo,node,fill/2-1),new,0,level+1);
		if(err){ 
			PR_DEBUG("[stm_btree_insert_level] recursive error\n") ; 	
			return err;  	
		}
		for( i = 0 ; i < fill/2 ; i++ ){ 
	                stm_setkey(geo, new, i, stm_bkey(geo, node, i));
                        stm_setval(geo, new, i, stm_bval(geo, node, i));
                        stm_setkey(geo, node, i, stm_bkey(geo, node, i + fill / 2));
                        stm_setval(geo, node, i, stm_bval(geo, node, i + fill / 2));
                        stm_clearpair(geo, node, i + fill / 2);
		}
		if( fill & 1 ){ 
                        stm_setkey(geo, node, i, stm_bkey(geo, node, fill - 1));
                        stm_setval(geo, node, i, stm_bval(geo, node, fill - 1));
                        stm_clearpair(geo, node, fill - 1);
       		}
		//pos_clflush_cache_range(node , NODESIZE); 
		goto retry ;
	}
	for( i = fill ; i > pos ; i-- ){ 
                stm_setkey(geo, node, i, stm_bkey(geo, node, i - 1));
                stm_setval(geo, node, i, stm_bval(geo, node, i - 1));
	}
	stm_setkey( geo , node , pos , key ) ; 	
	if(!val_size){
		stm_setval(geo ,node , pos , val) ; 	
	}else{
		void *new_val ;  
		//btree_lock() ; 
		st_lock() ; 
		new_val = pos_malloc( name , val_size ) ; 	
		st_unlock();
		//btree_unlock() ; 	
		
		memcpy( new_val , val , val_size ) ; 	
		pos_clflush_cache_range( new_val , val_size) ; 	
		stm_setval(geo , node , pos , new_val) ; 	
	}
	//pos_clflush_cache_range(node , NODESIZE) ; 	
	
	PR_DEBUG("[%s] end\n" , __func__) ; 	
	return 0 ;	
} 
int stm_pos_btree_insert(char *name, void *_key, void *_val, unsigned long val_size){ 
	struct btree_head *head ; 	
	unsigned long *key, *val ; 
	int rval ; 	
	if(name == NULL || _key == NULL || _val == NULL || val_size < 0){ 
		return -1 ; 
	}
	
        key = (unsigned long*)_key ;
        val = (unsigned long*)_val ;
        head = (struct btree_head *)pos_get_prime_object(name);//get head;
	
	TM_START(1,RW); 	
	rval = stm_btree_insert_level(name, head, &btree_geo128, _key, _val, val_size, 1); 
	TM_COMMIT; 

	return rval ; 	
} 


/* normal function to using lookup */ 
int llongcmp(const unsigned long *l1,const unsigned long *l2, size_t n){
        size_t i ;

        for( i = 0 ; i < n ; i++ ){
                if(l1[i] < l2[i] ) return -1;
                if(l1[i] > l2[i] ) return 1;
        }
        return 0 ;
}
unsigned long * lbkey( struct btree_geo * geo , unsigned long * node , int n){
        return &node[n * geo->keylen] ;
}
int lkeycmp(struct btree_geo * geo , unsigned long *node ,int pos ,
                unsigned long * key){
        return llongcmp(lbkey(geo,node,pos),key,geo->keylen);
}
void* lbval( struct btree_geo * geo , unsigned long * node , int n ){
//      PR_DEBUG("[%s] %p\n" , __func__ , (void*)node[geo->no_longs+n]) ; 

        return (void *)node[geo->no_longs + n] ;
}


void* stm_btree_lookup( char *name, unsigned long *key ){ 

 	struct btree_head *head = pos_get_prime_object(name) ; 	
	struct btree_geo *geo = &btree_geo128 ; 
	int i , height = head->height ; 	
	unsigned long *node = head->node ; 	
	if(height == 0)return NULL ; 	
	for( ; height > 1 ; height--){
		for( i = 0 ; i < geo->no_pairs ; i++ )
			if(lkeycmp(geo,node,i,key) <= 0) 
				break ;	 
		 	
		if( i == geo->no_pairs ) return NULL ;
		node = lbval(geo,node,i) ; 
		if( !node ) return NULL ; 
	}
	if( !node ) return NULL ; 	
	for( i = 0 ; i < geo->no_pairs ; i++){
		if(lkeycmp( geo,node,i,key )==0){ 
			return lbval(geo,node,i); 
		}
	} 
	return NULL ;  
} 
void stm_pos_btree_count(char *name , int *key){ 
	int i = 0;
	/* 3000000 will be change */ 	
	for( i = 0 ; i < 100000  ; i++ ){
		void *addr = stm_btree_lookup( name , &key[i] ) ;
		if( addr == NULL ) n_c++ ; 	
		else a_c++ ; 	
	}
	PR_DEBUG("[null] count : %d\n" , n_c) ; 	
	PR_DEBUG("[addr] count : %d\n" , a_c) ; 
	return ;
}
static void stm_merge(char *name, struct btree_head *head, struct btree_geo *geo, int level, unsigned long *left, int lfill, unsigned long *right , int rfill, unsigned long *parent, int lpos){ 
        int i;
        for (i = 0; i < rfill; i++) {
                stm_setkey(geo, left, lfill + i, stm_bkey(geo, right, i));
                stm_setval(geo, left, lfill + i, stm_bval(geo, right, i));
        }

        //pos_clflush_cache_range(left, NODESIZE); // Delayed flush in unit of NODESIZE
        stm_setval(geo, parent, lpos, right);
        stm_setval(geo, parent, lpos + 1, left);
       // pos_clflush_cache_range(parent, NODESIZE); // Delayed flush in unit of NODESIZE
        stm_btree_remove_level(name, head, geo, stm_bkey(geo, parent, lpos), level + 1);

} 
static void stm_rebalance( char *name, struct btree_head *head, struct btree_geo *geo, unsigned long *key, int level, unsigned long *child, int fill){ 
     	unsigned long * parent , * left = NULL , *right = NULL ;
     	int i, no_left, no_right;

        if (fill == 0) {
                /* Because we don't steal entries from a neighbour, this case
                 * can happen.  Parent node contains a single child, this
                 * node, so merging with a sibling never happens.
                 */
                //btree_remove_level(head, geo, key, level + 1);
                stm_btree_remove_level(name, head, geo, key, level + 1);
                //mempool_free(child, head->mempool);
                return;
        }
	parent = stm_find_level(name , head , geo, key , level+1) ; 	
	i = stm_getpos(geo,parent,key) ; 	
	      if (i > 0) {
                left = stm_bval(geo, parent, i - 1);
                no_left = stm_getfill(geo, left, 0);
                if (fill + no_left <= geo->no_pairs) {
                        //merge(head, geo, level,
                        stm_merge(name, head, geo, level,
                                        left, no_left,
                                        child, fill,
                                        parent, i - 1);
                        return;
                }
        }
        if (i + 1 < stm_getfill(geo, parent, i)) {
                right = stm_bval(geo, parent, i + 1);
                no_right = stm_getfill(geo, right, 0);
                if (fill + no_right <= geo->no_pairs) {
                        //merge(head, geo, level,
                        stm_merge(name, head, geo, level,
                                        child, fill,
                                        right, no_right,
                                        parent, i);
                        return;
                }
        }
} 
static void stm_btree_shrink( char *name, struct btree_head *head, struct btree_geo *geo){ 
	unsigned long *node ; 	
	int fill ; 	
	if( head->height <= 1 ){ 
		return ; 	
	}
	node = head->node ; 	
	fill = stm_getfill(geo , node , 0) ; 	
	head->node = stm_bval(geo,node,0);	
	head->height-- ; 	
	//pos_clflush_cache_range(head,sizeof(struct btree_head)) ; 	
} 
int stm_btree_remove_level( char *name, struct btree_head *head, struct btree_geo *geo, unsigned long *key, int level){ 
	unsigned long *node ; 	
        int i , pos , fill ;
        int ret ;
        int head_height = (int)TM_LOAD(&head->height) ;
        if( level > head_height ){
        	TM_STORE(&head->height , 0) ;
      	  	TM_STORE(&head->node , NULL) ;
	        //pos_clflush_cache_range( head , sizeof(struct btree_head)) ;

                return -1;
        }
        node = stm_find_level(name, head, geo, key, level);
        pos = stm_getpos(geo, node, key);
        fill = stm_getfill(geo, node, pos);
        if ((level == 1) && (stm_keycmp(geo, node, pos, key) != 0)){
                //return NULL;
//              PR_DEBUG("return -1") ;
                return -1;
        }
        ret = stm_bval(geo, node, pos);
        for (i = pos; i < fill - 1; i++) {
                stm_setkey(geo, node, i, stm_bkey(geo, node, i + 1));
                stm_setval(geo, node, i, stm_bval(geo, node, i + 1));
        }
        stm_clearpair(geo, node, fill - 1);
        //pos_clflush_cache_range(node, NODESIZE); // Delayed flush in unit of NODESIZE

        if (fill - 1 < geo->no_pairs / 2) {
                if( level < head_height ){
                        stm_rebalance(name, head, geo, key, level, node, fill - 1);
                }
                else if (fill - 1 == 1){
                        stm_btree_shrink(name, head, geo);
                }
        }
        return 0;
} 
int stm_pos_btree_remove( char *name, void *_key){ 
	struct btree_head *head ; 	
	unsigned long *key ; 	
	int rval ; 	
	if( name == NULL || _key == NULL ){ 
		PR_DEBUG("[%s] please check name or key value\n",__func__ ) ; 	
		return -1; 	
	}
	TM_START(2,RW); 	
	key = (unsigned long *)_key ; 	
	head = (struct btree_head *)pos_get_prime_object(name) ; 	
	if(head->height == 0){ 
		PR_DEBUG("[%s] head_height value is zero\n",__func__); 	
		return -1; 	
	}	
	rval = stm_btree_remove_level(name, head, &btree_geo128, key, 1) ; 	
	TM_COMMIT; 
	return rval ; 
} 
