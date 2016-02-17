/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/

#ifndef _LINUX_POS_LIB_H
#define _LINUX_POS_LIB_H

#ifdef __cplusplus
extern "C" {
#endif

#define POS_NAME_LENGTH	128
struct pos_name_entry {
	char name[POS_NAME_LENGTH];
	void *mstate;	// Start address of prime region (prime segment)
	void *log_addr;	// Start address of object storage for log
	struct seg_info *seg_head; // Head of Prime Segment info
	struct pos_name_entry *next;
};
#define POS_NAME_TABLE 25
struct pos_name_entry *name_table[POS_NAME_TABLE] ; 	
struct seg_info {
	unsigned long addr;
	unsigned long size;
};

struct node_info {
	unsigned long size;
	unsigned long ptr_offset[50];
};

extern int register_node_info(char *name, void *node, void *ptr_addr, unsigned long size);

extern void *pos_lookup_mstate(char* name);
extern struct pos_name_entry *pos_lookup_name_entry(char *name);

extern int pos_create(char *name);
extern int pos_delete(char *name);
extern int pos_map(char* name);
extern int pos_unmap(char *name);
extern void *pos_seg_alloc(char *name, unsigned long len);
extern void pos_seg_free(char *name, void *addr, unsigned long len);

extern int pos_is_mapped(char *name);

extern void *pos_malloc(char* name, unsigned long bytes);
extern void pos_free(char* name, void * mem);
extern void *pos_realloc(char *name, void *oldmem, unsigned long bytes);
extern void pos_set_prime_object(char *name, void *obj);
extern void *pos_get_prime_object(char *name);

extern void pos_print_free_chunks(char * name);

extern void pos_check_unsafe_pointer(char *name);

#define POS_TS_START	0x76934751
#define POS_TS_END	0xA1450D30

#define POS_TS_INSERT	0x12345678
#define POS_TS_REMOVE	0x87654321


extern int pos_log_create(char *name);
extern int pos_log_delete(char *name);
extern int pos_log_map(char *name);
extern int pos_log_unmap(char *name);
extern int pos_transaction_start(char *name, unsigned long type);
extern int pos_transaction_end(char *name);
extern int pos_log_insert_malloc_free(char *name, unsigned long addr, unsigned long value);
extern int pos_write_value_kv(char *name, unsigned long *addr, unsigned long value);
extern int pos_write_value_kv_noflush(char *name, unsigned long *addr, unsigned long value);
extern int pos_write_value_malloc(char *name, unsigned long *addr, unsigned long value);
extern int pos_recovery(char *name);
extern void pos_clflush_cache_range(void *vaddr, unsigned int size);

extern void print_log_cnt(void);
extern void clear_log_cnt(void);

#ifdef __cplusplus
}
#endif

#endif /* _LINUX_POS_LIB_H */
