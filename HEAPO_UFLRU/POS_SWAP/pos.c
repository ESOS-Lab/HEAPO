/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
   
   16.04.18 - nyg: first commit
   16.04.18 - Jinsoo Yoo: Add swap_bitmap to pos_map_array for supporting swap In/Out
*/

#include <linux/mm.h>
#include <linux/memory.h>
#include <linux/types.h>
#include <linux/vmalloc.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/pid.h>
#include <linux/bitops.h>
#include <linux/err.h>
#include <linux/gfp.h>
#include <linux/pagemap.h>	// find_get_page
#include <linux/highmem.h>	// copy_user_highpage
#include <linux/stat.h>		// S_IXUGO
#include <linux/cred.h>		// current_uid()
#include <linux/sched/sysctl.h>
#include <linux/rmap.h>
#include <linux/unistd.h>

//#include <asm/pgtable_32_types.h>
//#include <asm/pgtable_types.h>
#include <asm/current.h>
#include <asm/pgtable.h>
#include <asm/cacheflush.h>
#include <asm/string.h>
#include <asm/uaccess.h>
//#include <asm/page_types.h>	// PAGE_MASK

#include <linux/pos.h>
#include <linux/pos_namespace.h>

#include <linux/kernel.h>	//printk

#ifdef POS_SWAP
#include <linux/swap.h>
#endif

// POS Jinsoo Yoo
#include <linux/mm_inline.h>	// del_from_page_lru_list

struct pos_superblock* pos_sb;

struct kmem_cache *pos_task_pid_struct_cachep;


///////////////////////////////////////////////////////////////////////////////


struct pos_superblock* pos_get_sb(void)
{
	return pos_sb;
}


struct pos_superblock *pos_map_superblock(void)
{
	return (struct pos_superblock *)vmalloc(PAGE_SIZE);
}


////////////////////////////////////////////////////////////////////////////////


void *pos_kmalloc(unsigned long size)
{
	return kmalloc(size, GFP_KERNEL);
}


void pos_kfree(void *addr)
{
	kfree(addr);
}


void *pos_vmalloc(unsigned long size)
{
	return vmalloc(size);
}


void pos_vfree(void *addr)
{
	vfree(addr);
}

// POS (Cheolhee Lee)
struct page *pos_alloc_page(int kind)
{
	struct page *page;
	int nid;
	pg_data_t *pgdat;
	struct zone *zone;

	if(kind == POS_USER_AREA)
	{		
		for_each_online_node(nid) {
			pgdat = NODE_DATA(nid);
			zone = &pgdat -> node_zones[ZONE_NVRAM];
		}
#ifdef POS_SWAP
//TEMP
//		page = pos_buffered_rmqueue(zone, 0);
//		if(page == NULL)
//			return pos_alloc_page_slowpath(zone,0, 2); // movable 
//		return page;
#else
//		return pos_buffered_rmqueue(zone, 0);
#endif
	}
	else if (POS_KERNEL_AREA)
		return alloc_page(GFP_KERNEL | __GFP_ZERO);
}


void pos_free_page(unsigned long pfn)
{
	// POS nyg
	struct page *page = pfn_to_page(pfn);

	free_page_and_swap_cache(page);
/*
	struct lruvec *lruvec;
	struct zone *pagezone = page_zone(page);

	if(PageLRU(page)){
		lruvec = mem_cgroup_page_lruvec(page, pagezone);
		VM_BUG_ON_PAGE(!PageLRU(page), page);
		__ClearPageLRU(page);

		del_page_from_lru_list(page, lruvec, page_off_lru(page));
	}

	if(PageActive(page)){
		ClearPageActive(page);	
	}

	if(page_mapped(page)){
		atomic_long_dec(&current->mm->nr_ptes);
		atomic_dec(&page->_mapcount);
	}

	// POS Jinsoo Yoo
	__mod_zone_page_state(pagezone, NR_ANON_PAGES, -1);
//	__mod_zone_page_state(pagezone, NR_FREE_PAGES, 1);

//TEMP
	printk("[POS DEBUG] NR_FREE_PAGES: %d\n", zone_page_state(pagezone, NR_FREE_PAGES));
*/
//	__free_page(page);
}


struct kmem_cache *
pos_kmem_cache_create (const char *name, size_t size, size_t align,
	unsigned long flags, void (*ctor)(void *))
{
	return kmem_cache_create(name, size, align, flags, ctor);
}


void pos_kmem_cache_destroy(struct kmem_cache *cachep)
{
	kmem_cache_destroy(cachep);
}


void *pos_kmem_cache_alloc(struct kmem_cache *cachep, gfp_t flags)
{
	return kmem_cache_alloc(cachep, flags);
}


void pos_kmem_cache_free(struct kmem_cache *cachep, void *objp)
{
	kmem_cache_free(cachep, objp);
}


////////////////////////////////////////////////////////////////////////////////


//addr를 포함하는 vma를 rb-tree를 탐색하여 리턴
//없을 경우 addr < vm_end를 만족하는 가장 가까운 vma가 리턴됨
struct pos_vm_area *pos_find_vma(struct pos_superblock *sb, unsigned long addr)
{
	struct pos_vm_area *vma = NULL;


	if (sb) {
		/* Check the cache first. */
		/* (Cache hit rate is typically around 35%.) */
		vma = sb->find_cache;
		if (!(vma && vma->vm_end > addr && vma->vm_start <= addr)) {
			struct rb_node * rb_node;

			rb_node = sb->sb_rb.rb_node;
			vma = NULL;

			while (rb_node) {
				struct pos_vm_area *vma_tmp;

				vma_tmp = rb_entry(rb_node, struct pos_vm_area, vm_rb);

				if (vma_tmp->vm_end > addr) {
					vma = vma_tmp;
					if (vma_tmp->vm_start <= addr)
						break;
					rb_node = rb_node->rb_left;
				} else
					rb_node = rb_node->rb_right;
			}
			if (vma)
				sb->find_cache = vma;
		}
	}
	return vma;
}


/* Same as pos_find_vma, but also return a pointer to the previous VMA in *pprev. */
struct pos_vm_area *
pos_find_vma_prev(struct pos_superblock *sb, unsigned long addr,
			struct pos_vm_area **pprev)
{
	struct pos_vm_area *vma = NULL, *prev = NULL;
	struct rb_node *rb_node;
	if (!sb)
		goto out;

	/* Guard against addr being lower than the first VMA */
	vma = sb->vm_next;

	/* Go through the RB tree quickly. */
	rb_node = sb->sb_rb.rb_node;

	while (rb_node) {
		struct pos_vm_area *vma_tmp;
		vma_tmp = rb_entry(rb_node, struct pos_vm_area, vm_rb);

		if (addr < vma_tmp->vm_end) {
			rb_node = rb_node->rb_left;
		} else {
			prev = vma_tmp;
			if (!prev->vm_next || (addr < prev->vm_next->vm_end))
				break;
			rb_node = rb_node->rb_right;
		}
	}

out:
	*pprev = prev;
	return prev ? prev->vm_next : vma;
}


//리턴되는 vma는 삽입되는 vma의 다음에 위치한 vma이다.
//pprev는 삽입되는 vma의 이전에 위치한 vma이다.
//rb_parent는 삽입되는 노드를 가리키게 될 부모노드이다.
//rb_link는 rb_parent의 left, right 중 연결될 위치를 알려준다.
static struct pos_vm_area *
pos_find_vma_prepare(struct pos_superblock *sb, unsigned long addr,
		struct pos_vm_area **pprev, struct rb_node ***rb_link,
		struct rb_node ** rb_parent)
{
	struct pos_vm_area * vma;
	struct rb_node ** __rb_link, * __rb_parent, * rb_prev;

	__rb_link = &sb->sb_rb.rb_node;
	rb_prev = __rb_parent = NULL;
	vma = NULL;

	while (*__rb_link) {
		struct pos_vm_area *vma_tmp;

		__rb_parent = *__rb_link;
		vma_tmp = rb_entry(__rb_parent, struct pos_vm_area, vm_rb);

		if (vma_tmp->vm_end > addr) {
			vma = vma_tmp;
			if (vma_tmp->vm_start <= addr)
				break;
			__rb_link = &__rb_parent->rb_left;
		} else {
			rb_prev = __rb_parent;
			__rb_link = &__rb_parent->rb_right;
		}
	}

	*pprev = NULL;
	if (rb_prev)
		*pprev = rb_entry(rb_prev, struct pos_vm_area, vm_rb);
	*rb_link = __rb_link;
	*rb_parent = __rb_parent;
	return vma;
}


//전체 vma들로 구성된 list에 삽입
void pos_vma_link_list(struct pos_superblock *sb, struct pos_vm_area *vma,
		struct pos_vm_area *prev, struct rb_node *rb_parent)
{
	if (prev) {
		vma->vm_next = prev->vm_next;
		prev->vm_next = vma;
	} else {
		sb->vm_next = vma;
		if (rb_parent)
			vma->vm_next = rb_entry(rb_parent,
					struct pos_vm_area, vm_rb);
		else
			vma->vm_next = NULL;
	}
}


//전체 vma들로 구성된 rb-tree에 삽입
void pos_vma_link_rb(struct pos_superblock *sb, struct pos_vm_area *vma,
		struct rb_node **rb_link, struct rb_node *rb_parent)
{
	rb_link_node(&vma->vm_rb, rb_parent, rb_link);
	rb_insert_color(&vma->vm_rb, &sb->sb_rb);
}


//전체 vma들로 구성된 rb-tree, list에 삽입
int pos_insert_vm_area(struct pos_superblock *sb, struct pos_vm_area *vma)
{
	struct pos_vm_area * __vma, * prev;
	struct rb_node ** rb_link, * rb_parent;


	__vma = pos_find_vma_prepare(sb, vma->vm_start, &prev, &rb_link, &rb_parent);
	
	if (__vma && __vma->vm_start < vma->vm_end)
		return POS_ERROR;

	pos_vma_link_list(sb, vma, prev, rb_parent);
	pos_vma_link_rb(sb, vma, rb_link, rb_parent);

	sb->total_vm += vma->nr_pages;
	sb->vm_count++;
	
	return POS_NORMAL;
}


//특정 object storage를 구성하는 vma들로 구성된 list에 삽입
void pos_vma_link_list2(struct pos_descriptor *desc, struct pos_vm_area *vma)
{
	struct pos_vm_area *prev, *next;


	// Last
	prev = list_entry(desc->d_vm_list.prev, struct pos_vm_area, vm_next2);
	if (prev->vm_end <= vma->vm_start){
		list_add_tail(&vma->vm_next2, &desc->d_vm_list);
		return;
	}

	// First
	prev = list_entry(desc->d_vm_list.next, struct pos_vm_area, vm_next2);
	if (vma->vm_end <= prev->vm_start){
		list_add(&vma->vm_next2, &desc->d_vm_list);
		return;
	}

	// Middle
	list_for_each_entry(next, &prev->vm_next2, vm_next2) {

		if (prev->vm_end <=vma->vm_start && vma->vm_end<=next->vm_start) {
			list_add(&vma->vm_next2, &prev->vm_next2);
			return;
		} else {
			prev = next;
		}
	}
	
}


//len 크기만큼을 할당해줄 수 있는 빈 공간의 시작 주소를 리턴
//첫 번째 기준점이 되는 vma를 찾는 것만 rb-tree 탐색
//첫 번째 기준점 이후 부터는 list 탐색 (first fit)
unsigned long pos_get_unmapped_area(unsigned long len, struct pos_vm_area **prev_vma)
{
	struct pos_superblock *sb;
	struct pos_vm_area *vma;
	unsigned long start_addr;
	unsigned long begin, end;
	unsigned long addr;

	sb = pos_get_sb();

	begin = POS_AREA_START;
	end = POS_AREA_END;

	if (len > end)
		return POS_ERROR;

	if (len <= sb->cached_hole_size) {
		sb->cached_hole_size = 0;
		sb->free_area_cache = begin;
	}
	addr = sb->free_area_cache;
	if (addr < begin)
		addr = begin;
	start_addr = addr;

full_search:
	for (vma = pos_find_vma(sb, addr); ; vma = vma->vm_next) {

		/* At this point:  (!vma || addr < vma->vm_end). */
		if (end - len < addr) {
			/*
			 * Start a new search - just in case we missed
			 * some holes.
			 */
			if (start_addr != begin) {
				start_addr = addr = begin;
				sb->cached_hole_size = 0;
				goto full_search;
			}
			return POS_ERROR;
		}
		if (!vma || addr + len <= vma->vm_start) {
			/*
			 * Remember the place where we stopped the search:
			 */
			sb->free_area_cache = addr + len;
			break;
		}
		if (addr + sb->cached_hole_size < vma->vm_start)
			sb->cached_hole_size = vma->vm_start - addr;

		addr = vma->vm_end;
		if (prev_vma)
			*prev_vma = vma;
	}

	//if (IS_ERR_VALUE(addr))
		return addr;
	
	/*if (addr > TASK_SIZE - len)
		return -1;
	if (addr & ~PAGE_MASK)
		return -1;*/
}


void pos_unmap_area(struct pos_superblock *sb, unsigned long addr)
{
	/*
	 * Is this a new hole at the lowest possible address?
	 */
	if (addr >= POS_AREA_START && addr < sb->free_area_cache) {
		sb->free_area_cache = addr;
		sb->cached_hole_size = ~0UL;
	}
}


void pos_remove_vm_area(struct pos_superblock *sb, struct pos_vm_area *vma,
	struct pos_vm_area *prev)
{
	unsigned long addr;


	rb_erase(&vma->vm_rb, &sb->sb_rb);

	if (prev == NULL) {
		sb->vm_next = vma->vm_next;
	} else {
		prev->vm_next = vma->vm_next;
	}
	vma->vm_next = NULL;

	addr = prev ? prev->vm_end : POS_AREA_START;
	pos_unmap_area(sb, addr);

	sb->find_cache = NULL;

	sb->total_vm -= vma->nr_pages;
	sb->vm_count--;
}


////////////////////////////////////////////////////////////////////////////////


void pos_free_map_array(struct pos_map_array *map_array)
{
	struct pos_superblock *sb;
	sb = pos_get_sb();
	// Free pos_map_array
	pos_kmem_cache_free(sb->pos_map_array_struct_cachep, map_array);
}


//해당 level의 map_array가 가리킬 수 있는 page의 갯수를 반환
unsigned long pos_level_to_pages(int level)
{
	unsigned long level_pages;
	int i;


	level_pages = 1;
	for (i=0; i<level; i++) {
		level_pages *= POS_MAP_NR;
	}

	return level_pages;
}


//주어진 page 갯수를 가리키기 위해 필요한 level을 리턴
int pos_pages_to_level(unsigned long nr_pages)
{
	unsigned long level_pages;
	int level;
	

	level = 1;
	level_pages = POS_MAP_NR;
	
	while (level_pages < nr_pages) {
		level++;
		level_pages *= POS_MAP_NR;
	}
	
	return level;
}

// POS SWAP
unsigned long pos_find_pfn(struct pos_vm_area *vma, unsigned long addr)
{
	struct pos_map_array *map_array;
	unsigned long pages;
	unsigned long sublevel_pages;
	int level;
	int index;
	struct pos_superblock *sb;

	sb = pos_get_sb();

	pages = (addr - vma->vm_start) >> PAGE_SHIFT;
	map_array = vma->map_array;
	level = map_array->level;
	
	while (level > 1) {
		
		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;
		
		if (map_array->pfns[index] == POS_EMPTY) {
			return POS_EMPTY;	
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
	}

	// Level 1
	index = pages;

	if (map_array->pfns[index] == 0) {
		return POS_EMPTY;
	} else {
		return map_array->pfns[index];
	}
}

// POS SWAP
unsigned long pos_update_map_array_with_pfn(struct pos_vm_area *vma, unsigned long addr, unsigned long pfn)
{
	struct pos_map_array *map_array;
	unsigned long pages;
	unsigned long sublevel_pages;
	int level;
	int index;
	struct pos_superblock *sb;

	sb = pos_get_sb();

	pages = (addr - vma->vm_start) >> PAGE_SHIFT;
	map_array = vma->map_array;
	level = map_array->level;
	
	while (level > 1) {
		
		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;
		
		if (map_array->pfns[index] == POS_EMPTY) {
			
			struct pos_map_array *tmp_array;
			int i;

			tmp_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
			
			tmp_array->level = level-1;
			tmp_array->pn = map_array->pn + i*sublevel_pages;
			for (i=0; i<POS_MAP_NR; i++) {
				tmp_array->pfns[i] = POS_EMPTY;
			}
		
#ifdef POS_SWAP
			// Initialize the swap bitmap
			bitmap_zero(tmp_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
			map_array->pfns[index] = (unsigned long)tmp_array;
			
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
	}

	// Level 1
	index = pages;

	if (map_array->pfns[index] == 0) {
		map_array->pfns[index] = pfn;
		return pfn;
	}
	else
		return POS_EMPTY;
}

//addr를 포함한 page와 맵핑된 page frame의 number를 반환함
//multi-level의 map_array를 탐색하여 pfn을 구함
unsigned long pos_find_and_alloc_pfn(struct pos_vm_area *vma, unsigned long addr)
{
	struct pos_map_array *map_array;
	unsigned long pages;
	unsigned long sublevel_pages;
	int level;
	int index;
	struct pos_superblock *sb;


	sb = pos_get_sb();

	pages = (addr - vma->vm_start) >> PAGE_SHIFT;
	map_array = vma->map_array;
	level = map_array->level;
	
	while (level > 1) {
		
		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;
		
		if (map_array->pfns[index] == POS_EMPTY) {
			
			struct pos_map_array *tmp_array;
			int i;

			tmp_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
			
			tmp_array->level = level-1;
			tmp_array->pn = map_array->pn + i*sublevel_pages;
			for (i=0; i<POS_MAP_NR; i++) {
				tmp_array->pfns[i] = POS_EMPTY;
			}
		
#ifdef POS_SWAP
			// Initialize the swap bitmap
			bitmap_zero(tmp_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
			map_array->pfns[index] = (unsigned long)tmp_array;
			
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
	}

	// Level 1
	index = pages;

	if (map_array->pfns[index] == 0) {
		struct page *page;
		unsigned long pfn;
		
		page = pos_alloc_page(POS_USER_AREA);
		
		pfn =  page_to_pfn(page);
		map_array->pfns[index] = pfn;

		return pfn;
	} else {
		return map_array->pfns[index];
	}
}


#ifdef POS_SWAP
unsigned long pos_get_swap_entry(unsigned long vaddr)			
{
	struct pos_superblock *sb;
	struct pos_vm_area *pos_vma;
	struct pos_map_array *map_array;
	unsigned long *swap_bitmap;
	unsigned long pages;
	unsigned long sublevel_pages;
	int level;
	int index;

	// Get pos_superblock
	sb = pos_get_sb();

	// Get pos_vm_area including the vaddr	
	pos_vma = pos_find_vma(sb, vaddr);
	if(pos_vma == NULL){
		return POS_EMPTY;
	}
	
	// Get map_array index of the vaddr
	pages = (vaddr - pos_vma->vm_start) >> PAGE_SHIFT;

	// Get map_array
	map_array = pos_vma->map_array;
	level = map_array->level;

	// Lookup map_array to find the last level map array	
	while (level > 1) {
		
		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;

		// The pfn has no address	
		if (map_array->pfns[index] == POS_EMPTY) {
			return POS_EMPTY;
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
	}

	// Get the index of the map_array
	index = pages;

	// Get the swap_bitmap to update
	swap_bitmap = map_array->swap_bitmap;

	if (map_array->pfns[index] == 0) {
		return POS_EMPTY;
	} else {
		// Check if the entry is swap_entry
		if(test_bit(index, swap_bitmap))   // swap_bit=1, swap entry
			return map_array->pfns[index];
		else
			return POS_EMPTY;	  // normal pfn case
	}
}
#endif

#ifdef POS_SWAP
int pos_set_swap_entry(unsigned long vaddr, unsigned long swap_entry)
{
	struct pos_superblock *sb;
	struct pos_vm_area *pos_vma;
	struct pos_map_array *map_array;
	unsigned long *swap_bitmap;
	unsigned long pages;
	unsigned long sublevel_pages;
	int level;
	int index;

	// Get pos_superblock
	sb = pos_get_sb();

	// Get pos_vm_area including the vaddr	
	pos_vma = pos_find_vma(sb, vaddr);

	// Get map_array index	
	pages = (vaddr - pos_vma->vm_start) >> PAGE_SHIFT;

	// Get the map_array
	map_array = pos_vma->map_array;

	// Lookup map_array to find the last level map array	
	level = map_array->level;
	while (level > 1) {
		
		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;
	
		// The pfn has no address	
		if (map_array->pfns[index] == POS_EMPTY) {
			return POS_ERROR;
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
	}

	// Get the index of the map_array
	index = pages;

	// Get the swap_bitmap
	swap_bitmap = map_array->swap_bitmap;
	if(test_bit(index, swap_bitmap)){   // swap_bit=1, swap entry
		return POS_ERROR;
	}

	// Update the map_array and the swap_bitmap
	map_array->pfns[index] = swap_entry;
	set_bit(index, swap_bitmap);

	return POS_NORMAL;
}
#endif

#ifdef POS_SWAP
int pos_reset_swap_entry(unsigned long vaddr, unsigned long pfn)
{
	struct pos_superblock *sb;
	struct pos_vm_area *pos_vma;
	struct pos_map_array *map_array;
	unsigned long *swap_bitmap;
	unsigned long pages;
	unsigned long sublevel_pages;
	int level;
	int index;

	// Get pos_superblock
	sb = pos_get_sb();

	// Get pos_vm_area including the vaddr	
	pos_vma = pos_find_vma(sb, vaddr);

	// Get map_array index	
	pages = (vaddr - pos_vma->vm_start) >> PAGE_SHIFT;

	// Get the map_array
	map_array = pos_vma->map_array;

	// Lookup map_array to find the last level map array	
	level = map_array->level;
	while (level > 1) {
		
		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;
	
		// The pfn has no address	
		if (map_array->pfns[index] == POS_EMPTY) {
			return POS_ERROR;
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
	}

	// Get the index of the map_array
	index = pages;

	// Get the swap_bitmap
	swap_bitmap = map_array->swap_bitmap;
	if(!test_bit(index, swap_bitmap)){   // swap_bit=1, swap entry
		return POS_ERROR;
	}

	// Update the map_array and the swap_bitmap
	map_array->pfns[index] = pfn;
	clear_bit(index, swap_bitmap);

	return POS_NORMAL;
}
#endif

int do_pos_area_fault(struct mm_struct *mm, struct vm_area_struct *vma, 
		unsigned long address, pmd_t *pmd, pte_t *page_table, unsigned int flags)
{
	spinlock_t *ptl;
	pte_t entry;
	struct page *page;
	unsigned long pfn;
	struct pos_vm_area *pos_vma;
	struct pos_superblock *sb;

	pte_unmap(page_table);
	sb = pos_get_sb();
	pos_vma = pos_find_vma(sb, address);
/*
	if(!(flags & FAULT_FLAG_WRITE)){
		entry = pte_mkspecial(pfn_pte(my_zero_pfn(address), vma -> vm_page_prot));

		page_table = pte_offset_map_lock(mm, pmd, address, &ptl);
		if(pte_none(*page_table))
			goto unlock;
		goto setpte;
	}
*/
	if (unlikely(anon_vma_prepare(vma)))
		goto oom;

	pfn = pos_find_and_alloc_pfn(pos_vma, address);
	page = pfn_to_page(pfn);

	if (!page)
		goto oom;

	__SetPageUptodate(page);

	// POS Jinsoo Yoo
	if(mem_cgroup_charge_anon(page, mm, GFP_KERNEL))
		goto release;

	entry = mk_pte(page, vma -> vm_page_prot);
	if(vma -> vm_flags & VM_WRITE)
		entry = pte_mkwrite(pte_mkdirty(entry));
	
	page_table = pte_offset_map_lock(mm, pmd, address, &ptl);
	if(!pte_none(*page_table))
		goto release;

//TEMP
//	inc_mm_counter(mm, MM_ANONPAGES);

	page_add_new_anon_rmap(page,vma,address);

setpte:
	set_pte_at(mm, address, page_table, entry);
	update_mmu_cache(vma, address, page_table);
unlock: 
	pte_unmap_unlock(page_table, ptl);
	return 0;
release:
	mem_cgroup_uncharge_page(page);
	page_cache_release(page);
	goto unlock;
oom:
	return VM_FAULT_OOM;
}
EXPORT_SYMBOL(do_pos_area_fault);


////////////////////////////////////////////////////////////////////////////////


struct pos_pval_descriptor *
pos_find_pval_desc(struct pos_pval_device *pval_dev, unsigned long ino)
{
	struct pos_pval_descriptor *pval_desc = NULL;

	pval_desc = pval_dev->find_cache;
	if (!(pval_desc && pval_desc->ino == ino)) {
		struct rb_node *rb_node;

		rb_node = pval_dev->dev_rb.rb_node;
		pval_desc = NULL;

		while (rb_node) {
			struct pos_pval_descriptor *pval_desc_tmp;

			pval_desc_tmp = rb_entry(rb_node, struct pos_pval_descriptor, desc_rb);

			if (pval_desc_tmp->ino == ino) {
				pval_desc = pval_desc_tmp;
				break;	
			} else if (pval_desc_tmp->ino > ino) {
				rb_node = rb_node->rb_left;
			} else {
				rb_node = rb_node->rb_right;
			}
		}
		if (pval_desc)
			pval_dev->find_cache = pval_desc;
	}

	return pval_desc;
}



static int 
pos_find_pval_desc_prepare(struct pos_pval_device *pval_dev, unsigned long ino,
		struct rb_node ***rb_link, struct rb_node **rb_parent)
{
	struct rb_node ** __rb_link, *__rb_parent;


	__rb_link = &pval_dev->dev_rb.rb_node;
	__rb_parent = NULL;

	while (*__rb_link) {
		struct pos_pval_descriptor *pval_desc_tmp;

		__rb_parent = *__rb_link;
		pval_desc_tmp = rb_entry(__rb_parent, struct pos_pval_descriptor, desc_rb);

		if (unlikely(pval_desc_tmp->ino == ino)) {
			return POS_ERROR;
		} else if (pval_desc_tmp->ino > ino) {
			__rb_link = &__rb_parent->rb_left;
		} else {
			__rb_link = &__rb_parent->rb_right;
		}
	}	

	*rb_link = __rb_link;
	*rb_parent = __rb_parent;

	return POS_NORMAL;
}



void pos_pval_desc_link_rb(struct pos_pval_device *pval_dev, struct pos_pval_descriptor *pval_desc,
		struct rb_node **rb_link, struct rb_node *rb_parent)
{
	rb_link_node(&pval_desc->desc_rb, rb_parent, rb_link);
	rb_insert_color(&pval_desc->desc_rb, &pval_dev->dev_rb);
}



int pos_insert_pval_desc(struct pos_pval_device *pval_dev, struct pos_pval_descriptor *pval_desc)
{
	struct rb_node ** rb_link, * rb_parent;


	if (pos_find_pval_desc_prepare(pval_dev, pval_desc->ino, &rb_link, &rb_parent) == POS_ERROR)
		return POS_ERROR;

	pos_pval_desc_link_rb(pval_dev, pval_desc, rb_link, rb_parent);

	return POS_NORMAL;
}



void pos_remove_pval_desc(struct pos_pval_device *pval_dev, struct pos_pval_descriptor *pval_desc)
{
	rb_erase(&pval_desc->desc_rb, &pval_dev->dev_rb);
}



int pos_pval_table_index(dev_t device)
{
	unsigned long num;

	num = (unsigned long)device;

	return (int)(num % POS_PVAL_TABLE);
}



unsigned long pos_find_and_alloc_pfn_pval(struct pos_pval_descriptor *pval_desc, unsigned long addr, struct vm_area_struct *vma)
{
	struct pos_map_array *map_array;
	unsigned long pages;
	unsigned long sublevel_pages;
	int level;
	int index;
	struct pos_superblock *sb;


	sb = pos_get_sb();

	pages = (addr - pval_desc->seg_start) >> PAGE_SHIFT;
	map_array = pval_desc->map_array;
	level = map_array->level;

	while (level > 1) {

		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;
		
		if (map_array->pfns[index] == POS_EMPTY) {
			
			struct pos_map_array *tmp_array;
			int i;

			tmp_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
			
			tmp_array->level = level-1;
			tmp_array->pn = map_array->pn + i*sublevel_pages;
			for (i=0; i<POS_MAP_NR; i++) {
				tmp_array->pfns[i] = POS_EMPTY;
			}
			
#ifdef POS_SWAP
			// Initialize swap bitmap
			bitmap_zero(tmp_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
			map_array->pfns[index] = (unsigned long)tmp_array;
			
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
	}

	// Level 1
	index = pages;

	if (map_array->pfns[index] == 0) {
		struct file *file = vma->vm_file;
		struct address_space *mapping = file->f_mapping;
		struct page *page, *page_from;
		pgoff_t offset;
		unsigned long pfn;
		
		page = pos_alloc_page(POS_USER_AREA);
		
		pfn =  page_to_pfn(page);
		map_array->pfns[index] = pfn;

		// init
		offset = (((addr & PAGE_MASK) - vma->vm_start) >> PAGE_SHIFT) + vma->vm_pgoff;
		page_from = find_get_page(mapping, offset);
		copy_user_highpage(page, page_from, addr, vma);

		return pfn;
	} else {
		return map_array->pfns[index];
	}
}



void pos_find_and_remove_pval_desc(struct inode *inode)
{
	struct pos_superblock *sb;
	struct pos_pval_device *pval_dev;
	struct pos_pval_descriptor *pval_desc;

	struct super_block *fs_sb = inode->i_sb;
	unsigned long inode_num = inode->i_ino;
	dev_t device = fs_sb->s_dev;
	int index;


	sb = pos_get_sb();

	// check whether file is executable or not
	if ((inode->i_mode & S_IXUGO) == 0) {
		return ;
	}

//find_device:
	index = pos_pval_table_index(device);
	pval_dev = sb->pval_table[index];
	while (1) {
		
		if (pval_dev == NULL) {
			return ;
		}

		if (pval_dev->dev == device) {
			//goto find_descriptor;
			break;
		}

		pval_dev = pval_dev->next;
	}

//find_descriptor:
	pval_desc = pos_find_pval_desc(pval_dev, inode_num);
	if (pval_desc == NULL) {
		return ;
	}

//remove_descriptor:
	pval_desc->seg_start = 0;
	pval_desc->seg_end = 0;
	pval_desc->ino = 0;

	pos_remove_pval_desc(pval_dev, pval_desc);
	
	pos_free_map_array(pval_desc->map_array);

	pos_kmem_cache_free(sb->pos_pval_desc_struct_cachep, pval_desc);
}
EXPORT_SYMBOL(pos_find_and_remove_pval_desc);



unsigned long pos_find_and_alloc_pval_desc(unsigned long address, struct vm_area_struct *vma)
{
	struct pos_superblock *sb;
	struct pos_pval_device *pval_dev, **prev_pval_dev;
	struct pos_pval_descriptor *pval_desc;

	struct file *file = vma->vm_file;
	struct address_space *mapping = file->f_mapping;
	struct inode *inode = mapping->host;
	struct super_block *fs_sb = inode->i_sb;
	unsigned long inode_num = inode->i_ino;
	dev_t device = fs_sb->s_dev;
	unsigned long nr_pages;
	unsigned long pfn;
	int index;
	int i;

	
	sb = pos_get_sb();

//find_device:
	index = pos_pval_table_index(device);
	prev_pval_dev = &sb->pval_table[index];
	pval_dev = sb->pval_table[index];
	while (1) {

		if (pval_dev == NULL) {
			goto alloc_device;
		}
	
		if (pval_dev->dev == device) {
			goto find_descriptor;
		}
	
		prev_pval_dev = &pval_dev->next;
		pval_dev = pval_dev->next;
	}
	
find_descriptor:
	pval_desc = pos_find_pval_desc(pval_dev, inode_num);
	if (pval_desc == NULL) {
		goto alloc_descriptor;
	} else {
		pfn = pos_find_and_alloc_pfn_pval(pval_desc, address, vma);
		return pfn;
	}

alloc_device:
	pval_dev = pos_kmem_cache_alloc(sb->pos_pval_dev_struct_cachep, GFP_KERNEL);
	*prev_pval_dev = pval_dev;

	pval_dev->dev = device;
	pval_dev->find_cache = NULL;
	pval_dev->dev_rb = RB_ROOT;
	pval_dev->next = NULL;

alloc_descriptor:
	pval_desc = pos_kmem_cache_alloc(sb->pos_pval_desc_struct_cachep, GFP_KERNEL);
	
	pval_desc->ino = inode_num;

	if (pos_insert_pval_desc(pval_dev, pval_desc) == POS_ERROR)
		return POS_ERROR;

	pval_desc->map_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
	
	pval_desc->seg_start = vma->vm_start;
	pval_desc->seg_end = vma->vm_end;
	nr_pages = (pval_desc->seg_start - pval_desc->seg_end) >> PAGE_SHIFT;
	pval_desc->map_array->level = pos_pages_to_level(nr_pages);
	pval_desc->map_array->pn = pval_desc->seg_start >> PAGE_SHIFT;
	for (i=0; i<POS_MAP_NR; i++) {
		pval_desc->map_array->pfns[i] = POS_EMPTY;
	}

#ifdef POS_SWAP
	// Initialize swap bitmap
	bitmap_zero(pval_desc->map_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif

	pfn = pos_find_and_alloc_pfn_pval(pval_desc, address, vma);

	return pfn;
}



int do_pos_section_fault(struct mm_struct *mm, struct vm_area_struct *vma, 
		unsigned long address, pmd_t *pmd, pte_t orig_pte)
{
	pte_t *page_table;
	spinlock_t *ptl;
	pte_t entry;
	struct page *page;
	unsigned long pfn;


	pfn = pos_find_and_alloc_pval_desc(address, vma);
	page = pfn_to_page(pfn);

	//atomic_inc_and_test(&page->_mapcount);

	page_table = pte_offset_map_lock(mm, pmd, address, &ptl);

	if (likely(pte_same(*page_table, orig_pte))) {
		
		flush_icache_page(vma, page);
		entry = mk_pte(page, vma->vm_page_prot);
		
		//if (flags & FAULT_FLAG_WRITE)
		//	entry = maybe_mkwrite(pte_mkdirty(entry), vma);
		if (likely(vma->vm_flags & VM_WRITE))
			pte_mkwrite(pte_mkdirty(entry));
		
		set_pte_at(mm, address, page_table, entry);
//		update_mmu_cache(vma, address, entry);
		
	}

	pte_unmap_unlock(page_table, ptl);

	//return POS_NORMAL;
	return VM_FAULT_POS;
}
EXPORT_SYMBOL(do_pos_section_fault);


////////////////////////////////////////////////////////////////////////////////

#ifdef POS_SWAP
int pos_insert_pfn_to_map_array(struct pos_vm_area *vma, 
		unsigned long pages, unsigned long pfn, int is_swap_entry)
#else
int pos_insert_pfn_to_map_array(struct pos_vm_area *vma, 
		unsigned long pages, unsigned long pfn)
#endif
{
	struct pos_map_array *map_array;
	unsigned long pages_copy, sublevel_pages;
	int level;
	int index;
	struct pos_superblock *sb;


	sb = pos_get_sb();
	
	pages_copy = pages;
	map_array = vma->map_array;
	level = map_array->level;
	
	while (level > 1) {
		
		sublevel_pages = pos_level_to_pages(level-1);

		index = pages/sublevel_pages;
		
		if (map_array->pfns[index] == POS_EMPTY) {
			
			struct pos_map_array *tmp_array;
			int i;
			
			tmp_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
			
			tmp_array->level = level-1;
			tmp_array->pn = map_array->pn + i * sublevel_pages;
			for (i=0; i<POS_MAP_NR; i++) {
				tmp_array->pfns[i] = POS_EMPTY;
			}
#ifdef POS_SWAP
			// Initialize swap bitmap of tmp_array
			bitmap_zero(tmp_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
			map_array->pfns[index] = (unsigned long)tmp_array;
			
		}

		level--;
		pages = pages - (index*sublevel_pages);
		map_array = (struct pos_map_array *)map_array->pfns[index];
		
	}

	// Level 1
	index = pages;
	
	if (map_array->pfns[index] == 0) {
		map_array->pfns[index] = pfn;
#ifdef POS_SWAP
		if(is_swap_entry){
			set_bit(index, map_array->swap_bitmap);
		}
#endif
		return POS_NORMAL;
	}
	else{
		return POS_ERROR;
	}
}



int pos_copy_and_free_map_array(struct pos_vm_area *dst_vma, struct pos_map_array *src_map)
{
	struct pos_superblock *sb;
	struct pos_map_array *dst_map;
	int i;


	sb = pos_get_sb();

	dst_map = dst_vma->map_array;
	
	// 1-level
	if (src_map->level == 1) {
		
		for (i=0; i<POS_MAP_NR; i++) {
			if (src_map->pfns[i] != POS_EMPTY) {
				unsigned long pages;
				
				// Calculate # of pages from dst->pn to src->pn + i
				pages = src_map->pn + i -(dst_vma->vm_start>>PAGE_SHIFT);
				if (pages < 0)
					return POS_ERROR;
				
#ifdef POS_SWAP
				if (pos_insert_pfn_to_map_array(dst_vma, pages, src_map->pfns[i], test_bit(i, src_map->swap_bitmap)) == POS_ERROR)
#else
				if (pos_insert_pfn_to_map_array(dst_vma, pages, src_map->pfns[i]) == POS_ERROR)
#endif
					return POS_ERROR;

				src_map->pfns[i] = POS_EMPTY;
			}
		}

	}
	else {

		// Not 1-level
		for (i=0; i<POS_MAP_NR; i++) {
			if (src_map->pfns[i] != POS_EMPTY) {
				
				struct pos_map_array *next_map_array;
				
				next_map_array = (struct pos_map_array *)src_map->pfns[i];
				if (pos_copy_and_free_map_array(dst_vma, next_map_array) == POS_ERROR)
					return POS_ERROR;

				src_map->pfns[i] = POS_EMPTY;
			}
		}
	
	}

	// Free pos_map_array
	pos_kmem_cache_free(sb->pos_map_array_struct_cachep, src_map);
	
	return POS_NORMAL;
}



int pos_merge_map_array(struct pos_vm_area *dst_vma, struct pos_vm_area *src_vma)
{
	int level;
	struct pos_superblock *sb;


	sb = pos_get_sb();

	//dst의 map_array 레벨 결정
	level = pos_pages_to_level(dst_vma->nr_pages);

	if (level > dst_vma->map_array->level) {
		
		struct pos_map_array *tmp_array;
		int level_gap;
		int i, j;

		level_gap = level - dst_vma->map_array->level;

		//dst의 map_array level 확장
		for (i=0 ; i<level_gap; i++) {

			tmp_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
				
			tmp_array->level = level-1;
			tmp_array->pn = dst_vma->map_array->pn;
			for (j=0; j<POS_MAP_NR; j++) {
				tmp_array->pfns[i] = POS_EMPTY;
			}			
#ifdef POS_SWAP
			// Initialize swap bitmap of tmp_array
			bitmap_zero(tmp_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif

			tmp_array->pfns[0] = (unsigned long)dst_vma->map_array;
			dst_vma->map_array = tmp_array;
		}

	}

	if (src_vma == NULL)
		return POS_NORMAL;

	return pos_copy_and_free_map_array(dst_vma, src_vma->map_array);
}



int pos_create_or_merge_vma(struct pos_superblock *sb,
	struct pos_ns_record *record, struct pos_descriptor *desc,
	struct pos_vm_area *prev_vma, struct pos_vm_area *next_vma,
	unsigned long vm_start, unsigned long vm_end)
{
	int i;

	
	if (prev_vma && prev_vma->vm_end == vm_start &&
			prev_vma->ns_record == record) {
			
		if (next_vma && vm_end == next_vma->vm_start &&
				next_vma->ns_record == record) {
		//case 1. prev_vma, next_vma와 merge

			//prev_vma로 합침
			prev_vma->vm_end = next_vma->vm_end;
			prev_vma->nr_pages = (prev_vma->vm_end-prev_vma->vm_start)>>PAGE_SHIFT;

			//rb-tree에서 next_vma 제거
			rb_erase(&next_vma->vm_rb, &sb->sb_rb);

			//list에서 next_vma 제거
			prev_vma->vm_next = next_vma->vm_next;
			next_vma->vm_next = NULL;
			
			list_del(&next_vma->vm_next2);
			
			sb->vm_count--;

			//next의 map_array 엔트리를 prev의 map_array에 삽입
			pos_merge_map_array(prev_vma, next_vma);

			// Free pos_vm_area
			pos_kmem_cache_free(sb->pos_vma_struct_cachep, next_vma);
			
		}
		else {
		//case 2. prev_vma와 merge

			//prev_vma로 합침
			prev_vma->vm_end = vm_end;
			prev_vma->nr_pages = (prev_vma->vm_end-prev_vma->vm_start)>>PAGE_SHIFT;

			//map_array의 level 재설정
			pos_merge_map_array(prev_vma, NULL);

		}

	} 
	else if (next_vma && vm_end == next_vma->vm_start &&
			next_vma->ns_record == record) {
	//case 3. next_vma와 merge

		struct pos_vm_area *tmp_vma;
		unsigned long origin_nr_pages;


		//next_vma로 합침
		next_vma->vm_start = vm_start;
		origin_nr_pages = next_vma->nr_pages;
		next_vma->nr_pages = (next_vma->vm_end-next_vma->vm_start)>>PAGE_SHIFT;

		//기존의 next_vma의 map_array를 재구성하기 위해 tmp_vma와 교환
		tmp_vma = pos_kmem_cache_alloc(sb->pos_vma_struct_cachep, GFP_KERNEL);
		tmp_vma->map_array = next_vma->map_array;

#ifdef POS_SWAP
		// Copy the swap bitmap of next_vma to tmp_vma
		bitmap_copy(tmp_vma->map_array->swap_bitmap,
				next_vma->map_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif

		// Alloc pos_map_array
		next_vma->map_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
		
		next_vma->map_array->level = pos_pages_to_level(origin_nr_pages);
		next_vma->map_array->pn = next_vma->vm_start >> PAGE_SHIFT;
		for (i=0; i<POS_MAP_NR; i++) {
			next_vma->map_array->pfns[i] = POS_EMPTY;
		}
#ifdef POS_SWAP
		// Initialize swap bitmap of next_vma
		bitmap_zero(next_vma->map_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
		pos_merge_map_array(next_vma, tmp_vma);

		pos_kmem_cache_free(sb->pos_vma_struct_cachep, tmp_vma);
	}
	else {
	//case 4. merge 하지 않음

		struct pos_vm_area *pos_vma;

		// Alloc pos_vm_area
		pos_vma = pos_kmem_cache_alloc(sb->pos_vma_struct_cachep, GFP_KERNEL);

		pos_vma->vm_start = vm_start;
		pos_vma->vm_end = vm_end;
		pos_vma->nr_pages = (vm_end-vm_start) >>PAGE_SHIFT;

		// Alloc pos_map_array
		pos_vma->map_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);;
		
		pos_vma->map_array->level = pos_pages_to_level(pos_vma->nr_pages);
		pos_vma->map_array->pn = pos_vma->vm_start >> PAGE_SHIFT;
		for (i=0; i<POS_MAP_NR; i++) {
			pos_vma->map_array->pfns[i] = POS_EMPTY;
		}
#ifdef POS_SWAP
		// Initialize swap bitmap of pos_vma
		bitmap_zero(pos_vma->map_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
		pos_vma->ns_record = record;

		// Insert pos_vm_area
		pos_insert_vm_area(sb, pos_vma);
		pos_vma_link_list2(desc, pos_vma);
		
	}

	return POS_NORMAL;
}



int pos_reduce_map_array_level(struct pos_vm_area *vma)
{
	struct pos_superblock *sb;
	struct pos_map_array *map_array;
	int level;


	sb = pos_get_sb();

	map_array = vma->map_array;
	level = pos_pages_to_level(vma->nr_pages);

	if (map_array->level < level)
		return POS_ERROR;

	while (map_array->level>level) {

		vma->map_array = (struct pos_map_array *)map_array->pfns[0];

		pos_kmem_cache_free(sb->pos_map_array_struct_cachep, map_array);
		
		map_array = vma->map_array;
	}

	return POS_NORMAL;
}



void pos_reduce_map_array(struct pos_map_array *map_array,
		unsigned long first_pn, unsigned long last_pn)
{
	struct pos_superblock *sb;
	int i;
	swp_entry_t swp_entry;

	sb = pos_get_sb();

	// 1-level
	if (map_array->level == 1) {
		for (i=0; i<POS_MAP_NR; i++) {

			if (map_array->pfns[i] != POS_EMPTY &&
				first_pn<=map_array->pn+i && map_array->pn+i<=last_pn) {
#ifdef POS_SWAP
				if(test_bit(i, map_array->swap_bitmap)){
					// Remove the page from swap cache and swap partition
					swp_entry.val = (unsigned long)(map_array->pfns[i]);
					free_swap_and_cache(swp_entry);
					clear_bit(i, map_array->swap_bitmap);
				}
				else{
					// Release NVRAM page
					pos_free_page(map_array->pfns[i]);
				}
#else

				pos_free_page(map_array->pfns[i]); // uncommented by jinsoo
#endif	
				map_array->pfns[i] = POS_EMPTY;
			}
		}

	}
	else {

		unsigned long sublevel_pages;
		
		sublevel_pages = pos_level_to_pages(map_array->level-1);
		
		// Not 1-level
		for (i=0; i<POS_MAP_NR; i++) {

			if (map_array->pfns[i] != POS_EMPTY
				&& ((map_array->pn+sublevel_pages*(i)<=first_pn&&first_pn<=map_array->pn+sublevel_pages*(i+1))
				|| (map_array->pn+sublevel_pages*(i)<=last_pn&&last_pn<=map_array->pn+sublevel_pages*(i+1)))) {
				
				struct pos_map_array *next_map_array;
				
				next_map_array = (struct pos_map_array *)map_array->pfns[i];
				pos_reduce_map_array(next_map_array, first_pn, last_pn);
				map_array->pfns[i] = POS_EMPTY;

				pos_kmem_cache_free(sb->pos_map_array_struct_cachep, next_map_array);
			}
		}
	
	}

}



int pos_copy_partial_map_array(struct pos_vm_area *dst_vma, struct pos_map_array *src_map,
		unsigned long first_pn, unsigned long last_pn)
{
	struct pos_map_array *dst_map;
	int i;


	dst_map = dst_vma->map_array;
	
	// 1-level
	if (src_map->level == 1) {
		
		for (i=0; i<POS_MAP_NR; i++) {
			if (src_map->pfns[i] != POS_EMPTY &&
				first_pn<=src_map->pn+i && src_map->pn+i<=last_pn) {
			 	
				unsigned long pages;
				
				pages = src_map->pn + i -(dst_vma->vm_start>>PAGE_SHIFT);
				if (pages < 0)
					return POS_ERROR;
				
#ifdef POS_SWAP
				if (pos_insert_pfn_to_map_array(dst_vma, pages, src_map->pfns[i], test_bit(i, src_map->swap_bitmap)) == POS_ERROR)
#else
				if (pos_insert_pfn_to_map_array(dst_vma, pages, src_map->pfns[i]) == POS_ERROR)
#endif
					return POS_ERROR;

				//src_map->pfns[i] = POS_EMPTY;
			}
		}

	}
	else {

		unsigned long sublevel_pages;
		
		sublevel_pages = pos_level_to_pages(src_map->level-1);
		
		// Not 1-level
		for (i=0; i<POS_MAP_NR; i++) {
			if (src_map->pfns[i] != POS_EMPTY
				&& ((src_map->pn+sublevel_pages*(i)<=first_pn&&first_pn<=src_map->pn+sublevel_pages*(i+1))
				|| (src_map->pn+sublevel_pages*(i)<=last_pn&&last_pn<=src_map->pn+sublevel_pages*(i+1)))) {
				
				struct pos_map_array *next_map_array;
				
				next_map_array = (struct pos_map_array *)src_map->pfns[i];
				if (pos_copy_partial_map_array(dst_vma, next_map_array, first_pn, last_pn) == POS_ERROR)
					return POS_ERROR;

				//src_map->pfns[i] = POS_EMPTY;
			}
		}
		
	}
	
	return POS_NORMAL;
}



int pos_delete_or_split_vma(struct pos_superblock *sb,
	struct pos_ns_record *record, struct pos_descriptor *desc,
	struct pos_vm_area *vma, struct pos_vm_area *prev_vma,
	unsigned long addr, unsigned long len)
{
	unsigned long first_pn, last_pn;
	int i;


	if (addr<vma->vm_start || vma->vm_end<addr)
		return POS_ERROR;

	if (vma->vm_start == addr) {
		
		if (vma->vm_end - vma->vm_start == len) {
		//case 1. 세그먼트 전부 해제

			// Remove pos_vm_area
			pos_remove_vm_area(sb, vma, prev_vma);
			list_del(&vma->vm_next2);
			
			// Free pos_map_array
			pos_free_map_array(vma->map_array);

			// Free pos_vm_area
			pos_kmem_cache_free(sb->pos_vma_struct_cachep, vma);

		}
//		else if (vma->vm_end-vma->vm_start < len) {	// ??
		else if (vma->vm_end-vma->vm_start > len) {	// ??
		//case 2. 세그먼트 앞부분 해제

			struct pos_map_array *tmp_map_array;

			vma->vm_start = addr + len;
			vma->nr_pages = (vma->vm_end-vma->vm_start)>>PAGE_SHIFT;

			tmp_map_array = vma->map_array;

			vma->map_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
			
			vma->map_array->level = pos_pages_to_level(vma->nr_pages);
			vma->map_array->pn = vma->vm_start >> PAGE_SHIFT;
			for (i=0; i<POS_MAP_NR; i++) {
				vma->map_array->pfns[i] = POS_EMPTY;
			}

#ifdef POS_SWAP
			// Initialize swap bitmap
			bitmap_zero(vma->map_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
			//분리될 map_array 부분을 새로운 vma의 map_array에 복사
			first_pn = addr>>PAGE_SHIFT;
			last_pn = (addr+len)>>PAGE_SHIFT;
			if (pos_copy_partial_map_array(vma, tmp_map_array, first_pn, last_pn) == POS_ERROR)
				return POS_ERROR;

			 //기존의 map_array는 해제
			pos_free_map_array(tmp_map_array);

		}
		else {
			return POS_ERROR;
		}

	}
	else if (addr+len == vma->vm_end) {
	//case 3. 세그먼트 뒷부분 해제

		vma->vm_end = addr;
		vma->nr_pages = (vma->vm_end-vma->vm_start)>>PAGE_SHIFT;

		//기존의 vma에서 map_array 재구성
		first_pn = addr>>PAGE_SHIFT;
		last_pn = (addr+len)>>PAGE_SHIFT;
		pos_reduce_map_array(vma->map_array, first_pn, last_pn);
		pos_reduce_map_array_level(vma);

	}
	else if (addr+len < vma->vm_end) {
	//case 4. 세그먼트 중간 부분 해제

		struct pos_vm_area *next_vma;

		//기존의 vma정보 수정
		vma->vm_end = addr;
		vma->nr_pages = (vma->vm_end-vma->vm_start) >>PAGE_SHIFT;

		//새로운 vma 생성

		// Alloc pos_vm_area
		next_vma = pos_kmem_cache_alloc(sb->pos_vma_struct_cachep, GFP_KERNEL);

		next_vma->vm_start = addr+len;
		next_vma->vm_end = vma->vm_end;
		next_vma->nr_pages = (next_vma->vm_end-next_vma->vm_start) >>PAGE_SHIFT;

		// Alloc pos_map_array
		next_vma->map_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);
		
		next_vma->map_array->level = pos_pages_to_level(next_vma->nr_pages);
		next_vma->map_array->pn = next_vma->vm_start >> PAGE_SHIFT;
		for (i=0; i<POS_MAP_NR; i++) {
			next_vma->map_array->pfns[i] = POS_EMPTY;
		}

#ifdef POS_SWAP
		// Initialize swap bitmap
		bitmap_zero(next_vma->map_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
		next_vma->ns_record = record;

		// Insert pos_vm_area
		pos_insert_vm_area(sb, next_vma);
		pos_vma_link_list2(desc, next_vma);

		//분리될 map_array 부분을 새로운 vma의 map_arry에 복사
		first_pn = addr>>PAGE_SHIFT;
		last_pn = (addr+len)>>PAGE_SHIFT;
		if (pos_copy_partial_map_array(next_vma, vma->map_array, first_pn, last_pn) == POS_ERROR)
			return POS_ERROR;

		//기존의 vma에서 map_array 재구성
		last_pn = vma->vm_end>>PAGE_SHIFT;
		pos_reduce_map_array(vma->map_array, first_pn, last_pn);
		pos_reduce_map_array_level(vma);

	}
	else {
		return POS_ERROR;
	}

	return POS_NORMAL;
}


////////////////////////////////////////////////////////////////////////////////


//사용자 주소 공간에 vm_area_struct를 생성 후 삽입
int pos_map_vma(struct mm_struct *mm, unsigned long start, unsigned long end,
	fmode_t mode)
{
	struct vm_area_struct *vma, *prev;
	unsigned int vm_flags = 0;
//POS_SWAP
	int error;
//POS_SWAP
	vm_flags = VM_SHARED | VM_MAYSHARE | VM_NORESERVE| VM_POS;
//	vm_flags = VM_NORESERVE | VM_POS;
	if (mode & POS_MAYREAD)
		vm_flags |= VM_READ;
	if (mode & POS_MAYWRITE)
		vm_flags |= VM_WRITE;

//	mmap_region(NULL, start, end-start, vm_flags, 0);
	
	vma = find_vma_prev(mm, start, &prev);

	vma = vma_merge(mm, prev, start, end, vm_flags, NULL, NULL, -1, NULL);

	if (vma)
		return POS_NORMAL;

	vma = kmem_cache_zalloc(vm_area_cachep, GFP_KERNEL);
	if (unlikely(vma == NULL))
		return POS_ERROR;

	vma->vm_mm = mm;
	vma->vm_start = start;
	vma->vm_end = end;
	vma->vm_flags = vm_flags ;
	vma->vm_page_prot = vm_get_page_prot(vm_flags);
	vma->vm_pgoff = 0;
	vma->vm_file = NULL;
	//vma->vm_private_data = (void *)pos_vma;
/// POS_SWAP
//	vma->vm_policy = NULL;
	vma->anon_vma = NULL;
////
	INIT_LIST_HEAD(&vma->anon_vma_chain);
///POS_SWAP
/*
	if(vm_flags & VM_SHARED){
		error = shmem_zero_setup(vma);
		if(error){
			kmem_cache_free(vm_area_cachep, vma);
			//printk("[POSDEBUG] '%s' shmem setup fail\n",__func__);
			return error;
		}		
		//printk("[POSDEBUG] '%s' shmem setup success %d\n",__func__,error);
	}
*/
////
	if(vma_wants_writenotify(vma)){
		pgprot_t pprot = vma -> vm_page_prot;

		vma->vm_page_prot = vm_get_page_prot(vm_flags & ~VM_SHARED);
		if(pgprot_val(pprot) == pgprot_val(pgprot_noncached(pprot)))
			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
	}
// POS_SWAP
	vma->vm_ops = NULL;

	if (unlikely(insert_vm_struct(mm, vma))) {
		kmem_cache_free(vm_area_cachep, vma);
		return POS_ERROR;
	}

//	vma->vm_pgoff = -1; // not used as page offset. just used as flag for merging...
	
	mm->map_count++;
	mm->total_vm += (end-start)>>PAGE_SHIFT;
//POS_SWAP
//	vma->vm_flags |= VM_SOFTDIRTY;
//
	return POS_NORMAL;
}


//사용자 주소 공간에 vm_area_struct를 삭제, page table entry도 삭제됨
void pos_unmap_vma(struct mm_struct *mm, struct pos_vm_area *pos_vma)
{
	unsigned long start;
	size_t len;

	start = pos_vma->vm_start;
	//len = pos_vma->nr_pages * PAGE_SIZE;
	len = pos_vma->vm_end - pos_vma->vm_start;

	do_munmap(mm, start, len);
}


////////////////////////////////////////////////////////////////////////////////


asmlinkage void *sys_pos_create(char __user *name, unsigned long size)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *pos_vma;
	struct pos_task_pid *task_pid;
	struct pos_ns_trie_node *trie_root;

	struct mm_struct *mm;
	char name_buf[POS_NAME_LENGTH];
	int i;
	fmode_t mode;

	mm = current->mm;
	sb = pos_get_sb();

	copy_from_user(name_buf, name, POS_NAME_LENGTH);
	
	/* Too many mappings? */
	if (mm->map_count > sysctl_max_map_count)
		return (void *)POS_ERROR;

	if (unlikely(sb->trie_root == NULL)) {
		trie_root = pos_kmem_cache_alloc(sb->pos_ns_node_struct_cachep, GFP_KERNEL);
		trie_root->depth = 1;
		for (i=0; i<POS_ARRAY_LENGTH; i++)
			trie_root->ptrs[i] = 0;
		sb->trie_root = trie_root;
	}

	record = pos_ns_insert(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL) {
		return (void *)POS_ERROR;
	}
//TEMP
	copy_from_user(record->name, name,  POS_NAME_LENGTH);

	// Insert new pos_task_pid
	task_pid = kmem_cache_alloc(pos_task_pid_struct_cachep, GFP_KERNEL);
	task_pid->pid_nr = task_pid_nr(current);
	task_pid->task_next = NULL;

	record->task_list = task_pid;

	// Alloc pos_descriptor
	desc = pos_kmem_cache_alloc(sb->pos_desc_struct_cachep, GFP_KERNEL);
	record->desc = desc;

	// Alloc pos_vm_area
	INIT_LIST_HEAD(&desc->d_vm_list);
	pos_vma = pos_kmem_cache_alloc(sb->pos_vma_struct_cachep, GFP_KERNEL);
	list_add(&pos_vma->vm_next2, &desc->d_vm_list);

	desc->prime_seg = pos_vma->vm_start = pos_get_unmapped_area(size*1024, NULL);

	pos_vma->vm_end = pos_vma->vm_start + size*1024;
	pos_vma->nr_pages = 1;

	desc->d_uid = current_uid();
	desc->d_gid = current_gid();
	desc->d_mode = POS_DEFAULT_MODE;
	
	mode = POS_USR_MODE(desc->d_mode);
	task_pid->mode = mode;

	sb->vm_count++;
	
	// Alloc pos_map_array
	pos_vma->map_array = pos_kmem_cache_alloc(sb->pos_map_array_struct_cachep, GFP_KERNEL);

	pos_vma->map_array->level = 1;
	pos_vma->map_array->pn = pos_vma->vm_start >> PAGE_SHIFT;
	for (i=0; i<POS_MAP_NR; i++) {
		pos_vma->map_array->pfns[i] = POS_EMPTY;
	}

#ifdef POS_SWAP
	// Initialize swap bitmap
	bitmap_zero(pos_vma->map_array->swap_bitmap, SWAP_BITMAP_BITS);
#endif
	
	pos_vma->ns_record = record;

	// Insert pos_vm_area
	pos_insert_vm_area(sb, pos_vma);

	// Create & Insert vm_area_struct (mapping)
	pos_map_vma(mm, pos_vma->vm_start, pos_vma->vm_end, mode);

	sb->ns_count++;

	return (void *)desc->prime_seg;
}


asmlinkage int sys_pos_delete(char __user *name)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *pos_vma, *prev_pos_vma, *pos_vma_tmp;

	struct task_struct *task;
	struct mm_struct *mm;
	char name_buf[POS_NAME_LENGTH];


	task = current;
	mm = task->mm;
	sb = pos_get_sb();

	copy_from_user(name_buf, name, POS_NAME_LENGTH);

	if (unlikely(sb->trie_root == NULL))
		return POS_ERROR;

	record = pos_ns_delete(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL)
		return POS_ERROR;

	desc = record->desc;
	while (!list_empty(&desc->d_vm_list)){
		pos_vma = list_entry(desc->d_vm_list.next, struct pos_vm_area, vm_next2);

		//prev_pos_vma는 전체 pos_vm_area로 구성된 리스트에서 이전 노드를 가리킨다
		pos_vma_tmp = pos_find_vma_prev(sb, pos_vma->vm_start, &prev_pos_vma);
		if (pos_vma != pos_vma_tmp){
			return POS_ERROR;
		}

		// Remove pos_vm_area
		pos_remove_vm_area(sb, pos_vma, prev_pos_vma);

		// Free pos_map_array
		pos_free_map_array(pos_vma->map_array);

		// Remove vm_area_struct
		pos_unmap_vma(mm, pos_vma);

		list_del(&pos_vma->vm_next2);

		// Free pos_vm_area
		pos_kmem_cache_free(sb->pos_vma_struct_cachep, pos_vma);

		sb->vm_count--;
	}

	// Free pos_task_ptr
	kmem_cache_free(pos_task_pid_struct_cachep, record->task_list);
	
	// Free pos_descriptor
	pos_kmem_cache_free(sb->pos_desc_struct_cachep, desc);
	
	if (record->str_length)
		pos_kfree(record->str);

	// Free pos_name_entry
	pos_kmem_cache_free(sb->pos_ns_rec_struct_cachep, record);

	sb->ns_count--;
	if (sb->ns_count == 0) {
		pos_sb->magic = 0;
		pos_sb = NULL;
		pos_init();
	}

	return 1;
}


asmlinkage void *sys_pos_map(char __user *name)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *pos_vma;
	struct pos_task_pid *task_pid;
	
	struct mm_struct *mm;
	const struct cred *cred = current_cred();
	char name_buf[POS_NAME_LENGTH];
	fmode_t mode;


	mm = current->mm;
	sb = pos_get_sb();

	copy_from_user(name_buf, name, POS_NAME_LENGTH);
	
	/* Too many mappings? */
	if (mm->map_count > sysctl_max_map_count)
		return (void *)-1;	

	if (unlikely(sb->trie_root == NULL))
		return NULL;

	record = pos_ns_search(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL)
		return NULL;

	desc = record->desc;

	// Access Control
	if (desc->d_uid.val ==current_uid().val) {
		mode = POS_USR_MODE(desc->d_mode);
	} else if (groups_search(cred->group_info, desc->d_gid)) {
		mode = POS_GRP_MODE(desc->d_mode);
	} else {
		mode = POS_OTH_MODE(desc->d_mode);
	}
	if (mode == 0)
		return (void *)POS_ACCESS_ERROR;

	// Insert new pos_task_ptr
	task_pid = kmem_cache_alloc(pos_task_pid_struct_cachep, GFP_KERNEL);
	
	task_pid->pid_nr = task_pid_nr(current);
	task_pid->task_next = record->task_list;
	record->task_list = task_pid;
	task_pid->mode = mode;	

	// Insert vm_area_struct (mapping)
	list_for_each_entry(pos_vma, &desc->d_vm_list, vm_next2) {
		pos_map_vma(mm, pos_vma->vm_start, pos_vma->vm_end, mode);
	}

	return (void *)desc->prime_seg;
}
// POS SWAP
asmlinkage int sys_pos_unmap(char __user *name)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *pos_vma;
	struct pos_task_pid *task_pid, **prev_task_pid;
	
	struct task_struct *task;
	struct mm_struct *mm;
	char name_buf[POS_NAME_LENGTH];


	task = current;
	mm = task->mm;
	sb = pos_get_sb();

	copy_from_user(name_buf, name, POS_NAME_LENGTH);

	if (unlikely(sb->trie_root == NULL))
		return POS_ERROR;

	record = pos_ns_search(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL)
		return POS_ERROR;
	
	desc = record->desc;

	// Remove pos_task_ptr
	prev_task_pid = &record->task_list;
	task_pid = record->task_list;
	while (task_pid) {

		if (task_pid->pid_nr == task_pid_nr(task)) {
			*prev_task_pid = task_pid->task_next;
			task_pid->task_next = NULL;

			kmem_cache_free(pos_task_pid_struct_cachep, task_pid);

			break;
		}

		prev_task_pid = &task_pid->task_next;
		task_pid = task_pid->task_next;
	}

	//맵핑하지 않은 프로세스일 경우
	if (task_pid == NULL)
		return POS_ERROR;
	
	// Remove vm_area_struct (unmapping)
	list_for_each_entry(pos_vma, &desc->d_vm_list, vm_next2) {
		pos_unmap_vma(mm, pos_vma);
	}
	
	return POS_NORMAL;
}


asmlinkage void *sys_pos_seg_alloc(char __user *name, unsigned long len)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *prev_vma, *next_vma;
	struct pos_task_pid *task_pid, **prev_task_pid;
	unsigned long vm_start, vm_end;
	
	struct pid *pid;
	struct task_struct *task;
	struct mm_struct *mm;
	char name_buf[POS_NAME_LENGTH];
	fmode_t mode;
	
	task = current;
	mm = task->mm;
	sb = pos_get_sb();

	copy_from_user(name_buf, name, POS_NAME_LENGTH);

	if (!len)
		return (void *)POS_ERROR;

	/* Careful about overflows.. */
	len = PAGE_ALIGN(len);
	if (!len || len > POS_AREA_SIZE)
		return (void *)POS_ERROR;

	/* Too many mappings? */
	if (mm->map_count > sysctl_max_map_count)
		return (void *)POS_ERROR;

	if (unlikely(sb->trie_root == NULL))
		return POS_ERROR;

	record = pos_ns_search(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL)
		return POS_ERROR;
	
	desc = record->desc;

	//해당 객체저장소를 맵핑한 프로세스인지 확인
	task_pid = record->task_list;
	while (task_pid) {
		if (task_pid->pid_nr == task_pid_nr(task)) {
			break;
		} else {
			task_pid = task_pid->task_next;
		}
	}

	//맵핑하지 않은 프로세스일 경우
	if (task_pid == NULL)
		return POS_ERROR;

	mode = task_pid->mode;

	prev_vma = next_vma = NULL;
	vm_start = pos_get_unmapped_area(len, &prev_vma);
	vm_end = vm_start + len;

	//next_vma = pos_find_vma_prev(sb, vm_start, &prev_vma);
	if (prev_vma)
		next_vma = prev_vma->vm_next;
	else
		next_vma = NULL;

	//vma를 생성하거나 merge
	pos_create_or_merge_vma(sb, record, desc, prev_vma, next_vma, vm_start, vm_end);

	//해당 객체저장소를 맵핑한 모든 프로세스에 새로운 세그먼트 맵핑시킴
	prev_task_pid = &record->task_list;
	task_pid = record->task_list;
	while (task_pid) {
		pid = find_get_pid(task_pid->pid_nr);
		if (pid == NULL) {
			//삭제
			*prev_task_pid = task_pid->task_next;
			task_pid->task_next = NULL;

			if(prev_task_pid == NULL)
				break;

			kmem_cache_free(pos_task_pid_struct_cachep, task_pid);

			task_pid = (*prev_task_pid)->task_next;

			continue;
		} else {
			task = get_pid_task(pid, PIDTYPE_PID);
		}

		mm = task->mm;

		// Create & Insert vm_area_struct (mapping)
		if (pos_map_vma(mm, vm_start, vm_end, mode) == POS_ERROR) {
			return (void *)POS_ERROR;
		}

		prev_task_pid = &task_pid->task_next;
		task_pid = task_pid->task_next;
	}

	//세그먼트의 시작 주소 리턴
	return (void *)vm_start;
}


asmlinkage int sys_pos_seg_free(char __user *name, void *addr, unsigned long len)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *pos_vma, *prev_pos_vma;
	struct pos_task_pid *task_pid, **prev_task_pid;

	struct pid *pid;
	struct task_struct *task;
	struct mm_struct *mm;
	char name_buf[POS_NAME_LENGTH];

	//check whether address is page alinged address.
	if (((unsigned long)addr&(PAGE_SIZE-1)) != 0)
		return POS_ERROR;

	len = PAGE_ALIGN(len);
	if (!len)
		return POS_ERROR;

	task = current;
	sb = pos_get_sb();

	copy_from_user(name_buf, name, POS_NAME_LENGTH);

	if (unlikely(sb->trie_root == NULL))
		return POS_ERROR;

	record = pos_ns_search(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL)
		return POS_ERROR;

	desc = record->desc;

 	//해당 객체저장소를 맵핑한 프로세스인지 확인
	task_pid = record->task_list;
	while (task_pid) {
		if (task_pid->pid_nr ==  task_pid_nr(task)) {
			break;
		} else {
			task_pid = task_pid->task_next;
		}
	}

	//맵핑하지 않은 프로세스일 경우
	if (task_pid == NULL)
		return POS_ERROR;
	
	//prev_pos_vma는 전체 pos_vm_area로 구성된 리스트에서 이전 노드를 가리킨다
	pos_vma = pos_find_vma_prev(sb, (unsigned long)addr, &prev_pos_vma);
	if (!pos_vma)
		return POS_ERROR;

	//지정된 object storage가 맞는지 확인
	if (pos_vma->ns_record != record)
		return POS_ERROR;

	//prime segment 인지 확인
	//if (desc->prime_seg == pos_vma->vm_start)
	if (desc->prime_seg == (unsigned long)(addr))
		return POS_ERROR;

	//vma를 제거하거나 split
	if (pos_delete_or_split_vma(sb, record, desc,
			pos_vma, prev_pos_vma, (unsigned long)addr, len) == POS_ERROR)
		return POS_ERROR;

	//해당 객체저장소를 맵핑한 모든 프로세스에서 세그먼트 맵핑 해제시킴
	prev_task_pid = &record->task_list;
	task_pid = record->task_list;
	while (task_pid) {
		pid = find_get_pid(task_pid->pid_nr);
		if (pid == NULL) {
			//삭제
			*prev_task_pid = task_pid->task_next;
			task_pid->task_next = NULL;

			if(prev_task_pid == NULL)
				break;

			kmem_cache_free(pos_task_pid_struct_cachep, task_pid);

			task_pid =(*prev_task_pid)->task_next;

			continue;
		} else {
			task = get_pid_task(pid, PIDTYPE_PID);
		}
		
		mm = task->mm;
		
		// Remove vm_area_struct
		//pos_unmap_vma(mm, pos_vma);
		do_munmap(mm, (unsigned long)addr, len);
	
		prev_task_pid = &task_pid->task_next;
		task_pid = task_pid->task_next;
	}
	
	return POS_NORMAL;
}


////////////////////////////////////////////////////////////////////////////////


asmlinkage  void *sys_pos_is_mapped(char __user *name)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_task_pid *task_pid;

	struct task_struct *task;
	struct mm_struct *mm;
	char name_buf[POS_NAME_LENGTH];
	

	task = current;
	mm = task->mm;
	sb = pos_get_sb();

	copy_from_user(name_buf, name, POS_NAME_LENGTH);
	
	record = pos_ns_search(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL)
		return NULL;

	desc = record->desc;

	//해당 객체저장소를 맵핑한 프로세스인지 확인
	task_pid = record->task_list;
	while (task_pid) {

		if (task_pid->pid_nr ==  task_pid_nr(task)) {
			break;
		} else {
			task_pid = task_pid->task_next;
		}
	}

	//맵핑하지 않은 프로세스일 경우
	if (task_pid == NULL)
		return (void *)POS_ERROR;
	
	return (void *)desc->prime_seg;
}


////////////////////////////////////////////////////////////////////////////////

/* HEAPO(Cheolhee Lee) */
struct seg_inform {
	unsigned long addr;
	unsigned long size;
};

asmlinkage void sys_pos_check_seg_addr(char __user *name, void __user *buffer)
{	
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *pos_vma;

	char name_buf[POS_NAME_LENGTH];
	struct seg_inform *seg_info;
	int i = 0;
	
	sb = pos_get_sb();
	seg_info = kzalloc(sizeof(struct seg_inform) * 1024 , GFP_KERNEL);

	copy_from_user(name_buf, name, POS_NAME_LENGTH);

	record = pos_ns_search(sb->trie_root, name_buf, strlen(name_buf));
	if (record == NULL)
		return;

	desc = record -> desc;

	list_for_each_entry(pos_vma, &desc->d_vm_list, vm_next2) {
		seg_info[i].addr = pos_vma -> vm_start;
		seg_info[i].size = pos_vma -> vm_end - pos_vma -> vm_start;
		i++;		
	}
	copy_to_user(buffer , seg_info , sizeof(struct seg_inform) * 1024);	
	kfree(seg_info);
}

////////////////////////////////////////////////////////////////////////////////

void pos_init(void)
{
	int i;
	
	if (pos_sb != NULL )
		return;
	
	pos_sb = pos_map_superblock();
	//if (pos_sb->magic != POS_MAGIC ) {
		pos_sb->magic = POS_MAGIC;

		pos_sb->trie_root = NULL;
		pos_sb->ns_count = 0;
	
		pos_sb->sb_rb = RB_ROOT;
		pos_sb->vm_next = NULL;
		pos_sb->find_cache = NULL;
		pos_sb->cached_hole_size = POS_AREA_SIZE;
		pos_sb->free_area_cache = POS_AREA_START;
		pos_sb->total_vm = 0;
		pos_sb->vm_count = 0;

		for (i=0; i<POS_PVAL_TABLE; i++)
			pos_sb->pval_table[i] = NULL;

		pos_sb->pos_desc_struct_cachep = 
			pos_kmem_cache_create("pos_descriptor",
				sizeof(struct pos_descriptor), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
				NULL);

		pos_sb->pos_vma_struct_cachep = 
			pos_kmem_cache_create("pos_vm_area",
				sizeof(struct pos_vm_area), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
				NULL);
		
		pos_sb->pos_map_array_struct_cachep = 
			pos_kmem_cache_create("pos_map_array",
				sizeof(struct pos_map_array), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
				NULL);
		
		pos_sb->pos_pval_dev_struct_cachep = 
			pos_kmem_cache_create("pos_pval_device",
				sizeof(struct pos_pval_device), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
				NULL);
		
		pos_sb->pos_pval_desc_struct_cachep = 
			pos_kmem_cache_create("pos_pval_descriptor",
				sizeof(struct pos_pval_descriptor), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
				NULL);

		pos_sb->pos_ns_rec_struct_cachep = 
			pos_kmem_cache_create("pos_ns_record",
				sizeof(struct pos_ns_record), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
				NULL);
		
		pos_sb->pos_ns_cont_struct_cachep = 
			pos_kmem_cache_create("pos_ns_container",
				sizeof(struct pos_ns_container), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
				NULL);
		
		pos_sb->pos_ns_node_struct_cachep = 
			pos_kmem_cache_create("pos_ns_trie_node",
				sizeof(struct pos_ns_trie_node), 0,
				(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
					NULL);
	//}

	pos_task_pid_struct_cachep = 
		kmem_cache_create("pos_task_pid",
			sizeof(struct pos_task_pid), 0,
			(SLAB_RECLAIM_ACCOUNT|SLAB_PANIC|SLAB_MEM_SPREAD),
			NULL);
}
EXPORT_SYMBOL(pos_init);

void pos_process_exit(void)
{
	struct pos_superblock *sb;
	struct pos_ns_record *record;
	struct pos_descriptor *desc = NULL;
	struct pos_vm_area *pos_vma;
	struct pos_task_pid *task_pid, **prev_task_pid;

	struct task_struct *task;
	struct mm_struct *mm;
	struct pos_vm_area *pos;
//	struct list_head *list;

	task = current;
	mm = task -> mm;
	sb = pos_get_sb();

	if(unlikely(sb->trie_root == NULL))
		return;
	
	pos_vma = sb -> vm_next;
	while(pos_vma)
	{
		record = pos_vma -> ns_record;
		desc = record -> desc;

		prev_task_pid = &record -> task_list;
		task_pid = record -> task_list;

		while (task_pid){

			if(task_pid -> pid_nr == task_pid_nr(task)) {
				*prev_task_pid = task_pid -> task_next;
				task_pid -> task_next = NULL;
				kmem_cache_free(pos_task_pid_struct_cachep, task_pid);
				break;
			}

			prev_task_pid = &task_pid->task_next;
			task_pid = task_pid -> task_next;
		}

		if(task_pid != NULL){
			list_for_each_entry(pos, &desc->d_vm_list, vm_next2)
				pos_unmap_vma(mm, pos);		
		}

		pos_vma = pos_vma -> vm_next;
	}
}

