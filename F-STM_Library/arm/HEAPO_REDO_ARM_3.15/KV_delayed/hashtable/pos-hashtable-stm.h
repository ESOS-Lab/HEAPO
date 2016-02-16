/* 
	Author : Keonwoo Lee (kunulee@hanyang.ac.kr) 
*/ 
int stm_hashtable_insert( char *name, struct hashtable *h, unsigned long *k, unsigned long *v, unsigned long v_size) ; 	
int stm_pos_hashtable_insert(char *name, unsigned long *_k, unsigned long *_v, unsigned long v_size);
int stm_pos_hashtable_open( char *name );
int
stm_pos_hashtable_close( char *name);
int
stm_hashtable_remove( char *name , struct hashtable *h, unsigned long *k);
int
stm_pos_hashtable_remove( char *name, void *_k);
