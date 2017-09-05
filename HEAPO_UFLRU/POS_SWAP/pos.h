/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University

   16.04.18 - nyg: first commit
   16.04.18 - Jinsoo Yoo: Add swap_bitmap to pos_map_array for supporting swap In/Out
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
#include <linux/uidgid.h>
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

// POS SWAP
#define POS_SWAP

#define POS_MAGIC				0x19830732

//#define POS_NAME_TABLE		25
#define POS_NAME_LENGTH		128
#define POS_MAP_NR				128

#define POS_AREA_SIZE			0x40000000				// 1GB
//#define POS_AREA_START			(TASK_SIZE-min_gap()-POS_AREA_SIZE)	// 0x5FFEF8000000
#define POS_AREA_START			(TASK_SIZE-0x04000000-POS_AREA_SIZE)	// 0x5FFEF8000000
#define POS_AREA_END 			(POS_AREA_START+POS_AREA_SIZE)			// 0x7FFEF8000000

#define POS_DESCRIPTOR			1
#define POS_VM_AREA			2
#define POS_MAP_ARRAY			3
#define POS_TASK_PID			4
#define POS_PVAL_DEVICE		5
#define POS_PVAL_DESCRIPTOR	6
#define POS_NS_RECORD			7
#define POS_NS_CONTAINER		8
#define POS_NS_TRIE_NODE		9

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

#ifdef POS_SWAP
	#define BITS_PER_BYTE		8
	#define BYTES_PER_UL		4
	#define SWAP_BITMAP_SIZE	(POS_MAP_NR/(BITS_PER_BYTE*BYTES_PER_UL))
	#define SWAP_BITMAP_BITS	(POS_MAP_NR)	
#endif

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
	unsigned long pfns[POS_MAP_NR];	// last level�� �ƴ� ��쿣 �����ͷ� ��ȯ��
#ifdef POS_SWAP
	/*
	 * 0: The page is in NVRAM
	 * 1: The page is in SWAP Disk
	 */
	unsigned long swap_bitmap[SWAP_BITMAP_SIZE];
#endif
};


struct pos_vm_area
{
	unsigned long vm_start;
	unsigned long vm_end;
	unsigned long nr_pages;
	struct pos_map_array *map_array;
	struct pos_ns_record *ns_record;
	struct rb_node vm_rb;			//��ü vma�� ���� rb-tree
	struct pos_vm_area *vm_next;		//��ü vma�� ���� list
	struct list_head vm_next2;		//�ϳ��� object storage�� ���Ե� vma�� ���� list
};


struct pos_descriptor
{
	struct list_head d_vm_list;
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
	unsigned long total_vm;	// page ����
	int vm_count;

	struct pos_pval_device *pval_table[POS_PVAL_TABLE];

	struct kmem_cache *pos_desc_struct_cachep;
	struct kmem_cache *pos_vma_struct_cachep;
	struct kmem_cache *pos_map_array_struct_cachep;
	struct kmem_cache *pos_pval_dev_struct_cachep;
	struct kmem_cache *pos_pval_desc_struct_cachep;

	struct kmem_cache *pos_ns_rec_struct_cachep;
	struct kmem_cache *pos_ns_cont_struct_cachep;
	struct kmem_cache *pos_ns_node_struct_cachep;

	//struct kmem_cache *pos_task_pid_struct_cachep;
};

extern struct kmem_cache *pos_task_pid_struct_cachep;

#ifdef POS_SWAP
extern unsigned long pos_update_map_array_with_pfn(struct pos_vm_area *vma, unsigned long addr, unsigned long pfn);
extern unsigned long pos_find_pfn(struct pos_vm_area *vma, unsigned long addr);
extern struct pos_vm_area *pos_find_vma(struct pos_superblock *sb, unsigned long addr);
extern unsigned long pos_get_swap_entry(unsigned long vaddr);
extern int pos_set_swap_entry(unsigned long vaddr, unsigned long swap_addr);
extern int pos_reset_swap_entry(unsigned long vaddr, unsigned long pfn);
extern struct page* pos_alloc_page_slowpath(struct zone *zone, unsigned int order, int migratetype);
#endif

#endif /* _LINUX_POS_H */
