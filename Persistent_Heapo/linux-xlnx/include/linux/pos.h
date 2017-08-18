/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/

#ifndef _LINUX_POS_H
#define _LINUX_POS_H


#include <linux/mm_types.h>
#include <linux/list.h>
#include <linux/rbtree.h>
#include <linux/types.h>
#include <asm/processor.h>
#include <asm/pgtable.h>
#include <asm/page.h>
#include <linux/mm.h>
#include <linux/mmzone.h>
#include <linux/spinlock.h>

#include <linux/pos_namespace.h>


extern unsigned long min_gap(void);
extern void pos_init(void);
extern int do_pos_area_fault(struct mm_struct *mm, struct vm_area_struct *vma, 
		unsigned long address, pmd_t *pmd, pte_t* page_table, unsigned int flags);
extern int do_pos_section_fault(struct mm_struct *mm, struct vm_area_struct *vma, 
		unsigned long address, pmd_t *pmd, pte_t orig_pte);
extern void pos_find_and_remove_pval_desc(struct inode *inode);
extern void *pos_kmalloc(unsigned long size);
extern void pos_kfree(void *addr);
extern void *pos_kmem_cache_alloc(struct kmem_cache *cachep, gfp_t flags);
extern void pos_kmem_cache_free(struct kmem_cache *cachep, void *objp);
extern struct page* pos_buffered_rmqueue(struct zone *zone, int order);
extern struct page* pos_alloc_page(int kind);	
extern struct pos_superblock* pos_get_sb(void);
extern void pos_process_exit (void);

extern void pos_meta_cache_create(struct list_head *list, int type);
extern void *pos_meta_cache_alloc(struct list_head *list, int type);
extern void pos_meta_cache_free(struct list_head *list, void *objp, int type);
extern void *idx_to_address(void *base_addr, int idx, int type);
extern int address_to_idx(void *objp, void *base_addr, int type);
extern int size_of_meta(int type);

extern void nvramdisk_reserve_pages(unsigned long addr, unsigned int order);
extern void __nvramdisk_reserve_pages(struct page *page, unsigned int order);
extern void __nvramdisk_reserve_pages_ok(struct page *page, unsigned int order);
extern void nvramdisk_reserve_one_page(struct zone *zone, struct page *page, int order, int migratetype);
extern void __nvramdisk_reserve_one_page(struct page *page, struct zone *zone, unsigned int order, int migratetype);

#define POS_MAGIC				0x19830732

//#define POS_NAME_TABLE		25
#define POS_NAME_LENGTH		128
#define POS_MAP_NR				128

#define POS_AREA_SIZE			0x40000000				// 1GB
//#define POS_AREA_START			(TASK_SIZE-min_gap()-POS_AREA_SIZE)	// 0x5FFEF8000000
#define POS_AREA_START			(TASK_SIZE-0x04000000-POS_AREA_SIZE)	// 0x5FFEF8000000
#define POS_AREA_END 			(POS_AREA_START+POS_AREA_SIZE)			// 0x7FFEF8000000

#define POS_DESCRIPTOR			1
#define POS_VM_AREA				2
#define POS_MAP_ARRAY			3
#define POS_TASK_PID			4
#define POS_PVAL_DEVICE			5
#define POS_PVAL_DESCRIPTOR		6
#define POS_NS_RECORD			7
#define POS_NS_CONTAINER		8
#define POS_NS_TRIE_NODE		9

// sslee
#define POS_META_CACHE			10
#define POS_NS_STRING_1			11	//32byte
#define POS_NS_STRING_2			12	//64byte
#define POS_NS_STRING_3			13	//128byte
// sslee
#define POS_BITMAP_ARR_LENGTH	8
#define POS_NS_STRING_LEVEL		3
#define POS_MAX_META_PAGE		512

#define POS_USER_AREA			1
#define POS_KERNEL_AREA		2

#define POS_EMPTY				0

#define POS_MEM_DESC_BITMAP	4

#define POS_ERROR				0
#define POS_NORMAL				1
#define POS_ACCESS_ERROR		2
#define POS_PVAL_TABLE			16

#define POS_DEFAULT_MODE		0x660
#define POS_MODE_MASK			0xF
#define POS_USR_SHIFT			8
#define POS_GRP_SHIFT			4
#define POS_OTH_SHIFT			0
#define POS_USR_MODE(m)		((((m) >> POS_USR_SHIFT) & POS_MODE_MASK))
#define POS_GRP_MODE(m)		((((m) >> POS_GRP_SHIFT) & POS_MODE_MASK)) 
#define POS_OTH_MODE(m)		((((m) >> POS_OTH_SHIFT) & POS_MODE_MASK))

#define POS_MAYWRITE			2
#define POS_MAYREAD			4	

#define NVRAM_PAGE_START 262144


#define INIT_POS_META(m)					\
		m->kaddr = NULL;						\
		m->hint = 0;							\
		m->reserved = 0;						\
		INIT_LIST_HEAD(&(m->cache_list));		\
		bitmap_zero(m->bitmap, 256);				\


#define SSLEE_DEBUG	1

/* 
 * pos_meta_cache:
 * @type:
 * @kaddr:
 * @bitmap_lock:
 * @cache_list:
 * @hint:
 * @reserved:
 * @bitmap:
 */
struct pos_meta_cache{
	int type; //4
	void *kaddr; //4
	spinlock_t bitmap_lock; //4
	struct list_head cache_list; //8
	unsigned int hint; //4
	unsigned long reserved; //4
	unsigned long bitmap[POS_BITMAP_ARR_LENGTH]; //32
};

struct pos_pval_descriptor
{
	unsigned long seg_start;
	unsigned long seg_end;
	unsigned long ino;		// key
	struct rb_node desc_rb;
	struct pos_map_array *map_array;
};


struct pos_pval_device
{
	dev_t dev;
	struct pos_pval_descriptor *find_cache;
	struct rb_root dev_rb;
	struct pos_pval_device *next;
};


struct pos_task_pid
{
	pid_t pid_nr;
	struct pos_task_pid *task_next;
	fmode_t mode;
};


struct pos_map_array
{
	int level;
	unsigned long pn;		// first page number
	unsigned long pfns[POS_MAP_NR];	// last level이 아닌 경우엔 포인터로 변환됨
};


struct pos_vm_area
{
	unsigned long vm_start;
	unsigned long vm_end;
	unsigned long nr_pages;
	struct pos_map_array *map_array;
	struct pos_ns_record *ns_record;
	struct rb_node vm_rb;			//전체 vma에 대한 rb-tree
	struct pos_vm_area *vm_next;		//전체 vma에 대한 list
	struct list_head vm_next2;		//하나의 object storage에 포함된 vma에 대한 list
};


struct pos_descriptor
{
	struct  list_head d_vm_list;
	unsigned long prime_seg;
	kuid_t	d_uid;
	kgid_t	d_gid;
	fmode_t d_mode;
};


struct pos_superblock
{
	unsigned long long magic;

	struct pos_ns_trie_node *trie_root;
	int ns_count;
	
	struct rb_root sb_rb;
	struct pos_vm_area *vm_next;
	
	struct pos_vm_area *find_cache;
	unsigned long cached_hole_size;
	unsigned long free_area_cache;
	unsigned long total_vm;	// page 단위
	int vm_count;

	struct pos_pval_device *pval_table[POS_PVAL_TABLE];

	/* sslee */
	struct list_head pos_meta_cachep;
	struct list_head pos_desc_cachep;
	struct list_head pos_vma_cachep;
	struct list_head pos_map_array_cachep;
	struct list_head pos_pval_dev_cachep;
	struct list_head pos_pval_desc_cachep;
	struct list_head pos_ns_rec_cachep;
	struct list_head pos_ns_cont_cachep;
	struct list_head pos_ns_node_cachep;
	struct list_head pos_ns_string_1_cachep;
	struct list_head pos_ns_string_2_cachep;
	struct list_head pos_ns_string_3_cachep;
	int nr_mt_pages;

	unsigned long meta_pages[POS_MAX_META_PAGE];

};

extern struct kmem_cache *pos_task_pid_struct_cachep;


#endif /* _LINUX_POS_H */
