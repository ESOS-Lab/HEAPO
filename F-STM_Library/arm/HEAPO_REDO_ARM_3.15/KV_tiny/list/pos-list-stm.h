/*
	Author : Keonwoo Lee (kunulee@hanyang.ac.kr)
*/ 
int stm_pos_list_init( char *name ) ;
int stm_pos_list_destroy( char *name ) ; 	
int stm_pos_list_open( char *name ) ; 
void stm_pos_list_close( char *name ) ; 	
int stm_pos_list_insert(char *name , void *key, void *val, unsigned long val_size);
int stm_pos_list_remove(char *name , void *key);

