#define L1_CACHE_SHIFT (6)
#define L1_CACHE_BYTES (1 << L1_CACHE_SHIFT)
#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define NODESIZE MAX(L1_CACHE_BYTES , 128) 
int stm_pos_btree_init(char *name) ;
int stm_pos_btree_open(char *name) ; 
int stm_pos_btree_close( char *name) ; 
int stm_pos_btree_insert(char *name, void *_key , void *_val,unsigned long val_size) ; 	
int stm_pos_btree_remove(char *name , void *_key);
struct btree_geo{
        int keylen ;
        int no_pairs;
        int no_longs;
};


