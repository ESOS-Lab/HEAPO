/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/


/*
 * lib/btree.c	- Simple In-memory B+Tree
 *
 * As should be obvious for Linux kernel code, license is GPLv2
 *
 * Copyright (c) 2007-2008 Joern Engel <joern@logfs.org>
 * Bits and pieces stolen from Peter Zijlstra's code, which is
 * Copyright 2007, Red Hat Inc. Peter Zijlstra <pzijlstr@redhat.com>
 * GPLv2
 *
 * see http://programming.kicks-ass.net/kernel-patches/vma_lookup/btree.patch
 *
 * A relatively simple B+Tree implementation.  I have written it as a learning
 * exercise to understand how B+Trees work.  Turned out to be useful as well.
 *
 * B+Trees can be used similar to Linux radix trees (which don't have anything
 * in common with textbook radix trees, beware).  Prerequisite for them working
 * well is that access to a random tree node is much faster than a large number
 * of operations within each node.
 *
 * Disks have fulfilled the prerequisite for a long time.  More recently DRAM
 * has gained similar properties, as memory access times, when measured in cpu
 * cycles, have increased.  Cacheline sizes have increased as well, which also
 * helps B+Trees.
 *
 * Compared to radix trees, B+Trees are more efficient when dealing with a
 * sparsely populated address space.  Between 25% and 50% of the memory is
 * occupied with valid pointers.  When densely populated, radix trees contain
 * ~98% pointers - hard to beat.  Very sparse radix trees contain only ~2%
 * pointers.
 *
 * This particular implementation stores pointers identified by a long value.
 * Storing NULL pointers is illegal, lookup will return NULL when no entry
 * was found.
 *
 * A tricks was used that is not commonly found in textbooks.  The lowest
 * values are to the right, not to the left.  All used slots within a node
 * are on the left, all unused slots contain NUL values.  Most operations
 * simply loop once over all slots and terminate on the first NUL.
 */

//#include <linux/btree.h>
//#include <linux/cache.h>
//#include <linux/kernel.h>
//#include <linux/slab.h>
//#include <linux/module.h>
#include "pos-btree.h"
#include "../alloc_list/alloc_list.h"
#include <pos-lib.h>
#include <string.h>	//memset
#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>

#define MODE			1	// 1: absolute addressing, 2: offset addressing
#define OFFSET_BASE		(0x3FFEF8000000)	//0x5FFEF8000000 -> error.... I don't know the reason...

#define CONSISTENCY		0
#define pos_write_value	pos_write_value_kv_noflush
#define LOG_CNT_ON		0

unsigned int btree_state = 0;		/* State of allocating the latest Node */
unsigned int pos_m_count = 0;		/* Level of Current B+tree */
unsigned int btree_garbage_count = 0;	/* Number of garbage for creating */

#define L1_CACHE_SHIFT	(6)	// 64bit?
#define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)

#define BITS_PER_LONG	64	// 64bit

#define ENOENT		2	/* No such file or directory */
#define ENOMEM		12	/* Out of Memory */

//typedef unsigned int	__kernel_size_t;	// 32bit
typedef unsigned long	__kernel_size_t;	// 64bit
typedef __kernel_size_t		size_t;

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define NODESIZE MAX(L1_CACHE_BYTES, 128)	// 128

struct btree_geo {
	int keylen;
	int no_pairs;
	int no_longs;
};

/*struct btree_geo btree_geo32 = {
	.keylen = 1,
	.no_pairs = NODESIZE / sizeof(long) / 2,
	.no_longs = NODESIZE / sizeof(long) / 2,
};
EXPORT_SYMBOL_GPL(btree_geo32);*/

#define LONG_PER_U64 (64 / BITS_PER_LONG)	// 1
/*struct btree_geo btree_geo64 = {
	.keylen = LONG_PER_U64,
	.no_pairs = NODESIZE / sizeof(long) / (1 + LONG_PER_U64),
	.no_longs = LONG_PER_U64 * (NODESIZE / sizeof(long) / (1 + LONG_PER_U64)),
};
EXPORT_SYMBOL_GPL(btree_geo64);*/

struct btree_geo btree_geo128 = {
	.keylen = 2 * LONG_PER_U64,	// 2
	.no_pairs = NODESIZE / sizeof(long) / (1 + 2 * LONG_PER_U64), // 5
	.no_longs = 2 * LONG_PER_U64 * (NODESIZE / sizeof(long) / (1 + 2 * LONG_PER_U64)), // 10
};
//EXPORT_SYMBOL_GPL(btree_geo128);

/*static struct kmem_cache *btree_cachep;

void *btree_alloc(gfp_t gfp_mask, void *pool_data)
{
	return kmem_cache_alloc(btree_cachep, gfp_mask);
}
EXPORT_SYMBOL_GPL(btree_alloc);

void btree_free(void *element, void *pool_data)
{
	kmem_cache_free(btree_cachep, element);
}
EXPORT_SYMBOL_GPL(btree_free);*/

//static unsigned long *btree_node_alloc(struct btree_head *head, gfp_t gfp)
static unsigned long *btree_node_alloc(char *name)
{
	unsigned long *node;
	int i;
	
	//node = mempool_alloc(head->mempool, gfp);
	node = (unsigned long *)pos_malloc(name, NODESIZE);
	//if (likely(node))
	if (node) {
//#if CONSISTENCY == 1
//		for (i=0; i<(int)(NODESIZE/sizeof(unsigned long)) ; i++) {
//			pos_write_value(name, (unsigned long *)&node[i], (unsigned long)0);
//		}
//#else
		memset(node, 0, NODESIZE);
//#endif
	}
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node, NODESIZE);
#endif

	return node;
}

static int longcmp(const unsigned long *l1, const unsigned long *l2, size_t n)
{
	size_t i;

	for (i = 0; i < n; i++) {
		if (l1[i] < l2[i])
			return -1;
		if (l1[i] > l2[i])
			return 1;
	}
	return 0;
}

static unsigned long *longcpy(unsigned long *dest, const unsigned long *src,
		size_t n)
{
	size_t i;

	for (i = 0; i < n; i++)
		dest[i] = src[i];
#if CONSISTENCY == 1
	pos_clflush_cache_range(dest, n * sizeof(unsigned long));
#endif
	return dest;
}

static unsigned long *longcpy_log(char *name, unsigned long *dest, const unsigned long *src,
		size_t n)
{
	size_t i;

	for (i = 0; i < n; i++)
		pos_write_value(name, (unsigned long *)&dest[i], (unsigned long)src[i]);
	return dest;
}

static unsigned long *longset(unsigned long *s, unsigned long c, size_t n)
{
	size_t i;

	for (i = 0; i < n; i++)
		s[i] = c;
#if CONSISTENCY == 1
        pos_clflush_cache_range(s, n * sizeof(unsigned long));
#endif
	return s;
}

static unsigned long *longset_log(char *name, unsigned long *s, unsigned long c, size_t n)
{
	size_t i;

	for (i = 0; i < n; i++)
		pos_write_value(name, (unsigned long *)&s[i], (unsigned long)c);
	return s;
}

/*static void dec_key(struct btree_geo *geo, unsigned long *key)
{
	unsigned long val;
	int i;

	for (i = geo->keylen - 1; i >= 0; i--) {
		val = key[i];
		key[i] = val - 1;
		if (val)
			break;
	}
}*/

static unsigned long *bkey(struct btree_geo *geo, unsigned long *node, int n)
{
	return &node[n * geo->keylen];
}

static void *bval(struct btree_geo *geo, unsigned long *node, int n)
{
#if MODE == 1
	return (void *)node[geo->no_longs + n];
#elif MODE == 2
	return (void *)(node[geo->no_longs + n] + OFFSET_BASE); // offset addressing mode
#endif
}

static void *bval2(struct btree_geo *geo, unsigned long *node, int n)
{
	return (void *)node[geo->no_longs + n];				// This function returns only zero value(ie. NULL).
}

static void setkey(struct btree_geo *geo, unsigned long *node, int n,
		   unsigned long *key)
{
	longcpy(bkey(geo, node, n), key, geo->keylen);
}

static void setkey_log(char *name, struct btree_geo *geo, unsigned long *node, int n,
		   unsigned long *key)
{
	longcpy_log(name, bkey(geo, node, n), key, geo->keylen);
}

static void setval(struct btree_geo *geo, unsigned long *node, int n,
		   void *val)
{
#if MODE == 1
	node[geo->no_longs + n] = (unsigned long) val;
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node[geo->no_longs + n], sizeof(unsigned long));
#endif
#elif MODE == 2
	node[geo->no_longs + n] = (unsigned long) val - OFFSET_BASE; // offset addressing mode;
#endif
}

static void setval_log(char *name, struct btree_geo *geo, unsigned long *node, int n,
		   void *val)
{
	pos_write_value(name, (unsigned long *)&node[geo->no_longs + n], (unsigned long)val);
}

static void clearpair(struct btree_geo *geo, unsigned long *node, int n)
{
	longset(bkey(geo, node, n), 0, geo->keylen);
	node[geo->no_longs + n] = 0;
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node[geo->no_longs + n], sizeof(unsigned long));
#endif
}

static void clearpair_log(char *name, struct btree_geo *geo, unsigned long *node, int n)
{
	longset_log(name, bkey(geo, node, n), 0, geo->keylen);
	pos_write_value(name, (unsigned long *)&node[geo->no_longs + n], (unsigned long)0);
}

static inline void __btree_init(struct btree_head *head)
{
	head->node = NULL;
	head->height = 0;
}

/*void btree_init_mempool(struct btree_head *head, mempool_t *mempool)
{
	__btree_init(head);
	head->mempool = mempool;
}
EXPORT_SYMBOL_GPL(btree_init_mempool);*/

//int btree_init(struct btree_head *head)
int pos_btree_init(char *name)
{
	struct btree_head *head;
//printf("1\n");	
	if (pos_create(name) == 0)
		return -1;
//printf("2\n");
#if CONSISTENCY == 1
	pos_log_create(name);
	pos_transaction_start(name, POS_TS_INSERT);
#endif
//printf("3\n");
	head = (struct btree_head *)pos_malloc(name, sizeof(struct btree_head));
	pos_m_count++;
#if BTREE_DEBUG == 1
	printf("[pos_btree_init] pos_malloc count : %d\n", pos_m_count);
#endif
	pos_set_prime_object(name, head);
	//printf("4\n");
//printf("prime node in init : %p\n", head->node);	
	__btree_init(head);
	//head->mempool = mempool_create(0, btree_alloc, btree_free, NULL);
	//if (!head->mempool)
	//	return -ENOMEM;
//printf("5\n");
#if CONSISTENCY == 1
	pos_transaction_end(name);
	pos_log_unmap(name);
#endif
	pos_unmap(name);
	return 0;
}
//EXPORT_SYMBOL_GPL(btree_init);

//void btree_destroy(struct btree_head *head)
int pos_btree_destroy(char *name)
{
	pos_map(name);

#if CONSISTENCY == 1
	pos_log_map(name);
	pos_log_delete(name);
#endif

	//btree 탐색하면서 할당된 노드들 해제하는 과정 추가
	//위에 과정 pos_delete()만 호출하면 모두 사라지니까 필요 없는지 확인
	
	pos_delete(name);
	//mempool_destroy(head->mempool);
	//head->mempool = NULL;

	return 0;
}
//EXPORT_SYMBOL_GPL(btree_destroy);

int pos_btree_open(char *name)
{
	if (pos_map(name) == 1) {
#if CONSISTENCY == 1
		pos_log_map(name);

		// If transaction was ended abnormally.
		// Recovery is executed.
		pos_recovery(name);
#endif
		return 0;
	} else
		return -1;
}

void pos_btree_close(char *name)
{
#if LOG_CNT_ON == 1
	print_log_cnt();
	clear_log_cnt();
#endif

#if CONSISTENCY == 1
	pos_log_unmap(name);
#endif
	pos_unmap(name);
}

/*void btree_retrieval_level(struct btree_geo *geo, unsigned long *node, int height)
{
	unsigned long *next_node;
	int i;


	printf("height=%d\n", height);
	
	for (i=0; i<geo->no_pairs; i++) {
		if ( (*bkey(geo, node, i)) > 0)
			printf("%lu(0x%lX) ", (unsigned long)(*bkey(geo, node, i)), (unsigned long)bval(geo, node, i));
		else 
			break;
	}
	printf("\n");
	
	if (height != 1) {
		for (i=0; i<geo->no_pairs; i++) {
			if ( (*bkey(geo, node, i)) > 0) {
				next_node = bval(geo, node, i);
				btree_retrieval_level(geo, next_node, height-1);
			} else 
				break;
		}
	} else {
		return ;
	}

}

void pos_btree_retrieval(char *name, struct btree_geo *geo)
{
	struct btree_head *head;
	
	head = (struct btree_head *)pos_get_prime_object(name);
	return btree_retrieval_level(geo, head->node, head->height);
}*/

/*void *btree_last(struct btree_head *head, struct btree_geo *geo,
		 unsigned long *key)
{
	int height = head->height;
	unsigned long *node = head->node;

	if (height == 0)
		return NULL;

	for ( ; height > 1; height--)
		node = bval(geo, node, 0);

	longcpy(key, bkey(geo, node, 0), geo->keylen);
	return bval(geo, node, 0);
}
EXPORT_SYMBOL_GPL(btree_last);*/

static int keycmp(struct btree_geo *geo, unsigned long *node, int pos,
		  unsigned long *key)
{
	return longcmp(bkey(geo, node, pos), key, geo->keylen);
}

static int keyzero(struct btree_geo *geo, unsigned long *key)
{
	int i;

	for (i = 0; i < geo->keylen; i++)
		if (key[i])
			return 0;

	return 1;
}

void *btree_lookup(struct btree_head *head, struct btree_geo *geo,
		unsigned long *key)
{
	int i, height = head->height;
	unsigned long *node = head->node;

	if (height == 0)
		return NULL;

	for ( ; height > 1; height--) {
		for (i = 0; i < geo->no_pairs; i++)
			if (keycmp(geo, node, i, key) <= 0)
				break;
		if (i == geo->no_pairs)
			return NULL;
		node = bval(geo, node, i);
		if (!node)
			return NULL;
	}

	if (!node)
		return NULL;

	for (i = 0; i < geo->no_pairs; i++)
		if (keycmp(geo, node, i, key) == 0)
			return bval(geo, node, i);
	return NULL;
}
//EXPORT_SYMBOL_GPL(btree_lookup);

void *pos_btree_lookup(char *name, void *_key)
{
	struct btree_head *head;
	unsigned long *key;


	if (name==NULL || _key==NULL)
		return NULL;

	head = (struct btree_head *)pos_get_prime_object(name);
	key = (unsigned long *)_key;

	return btree_lookup(head, &btree_geo128, key);
}

//int btree_update(struct btree_head *head, struct btree_geo *geo,
//		 unsigned long *key, void *val)
int btree_update(char *name, struct btree_head *head, struct btree_geo *geo, 
		unsigned long *key, void *val, unsigned long val_size)
{
	int i, height = head->height;
	unsigned long *node = head->node;

	if (height == 0)
		return -ENOENT;

	for ( ; height > 1; height--) {
		for (i = 0; i < geo->no_pairs; i++)
			if (keycmp(geo, node, i, key) <= 0)
				break;
		if (i == geo->no_pairs)
			return -ENOENT;
		node = bval(geo, node, i);
		if (!node)
			return -ENOENT;
	}

	if (!node)
		return -ENOENT;

	for (i = 0; i < geo->no_pairs; i++)
		if (keycmp(geo, node, i, key) == 0) {
			//setval(geo, node, i, val);
			
			void *new_val;
			
			// Free the allocated object
			pos_free(name, bval(geo, node, i));
			pos_m_count--;
			// Allocate object and copy the content 
			new_val = pos_malloc(name, val_size);
			pos_m_count++;
#if BTREE_DEBUG == 1
	printf("[btree_update] pos_malloc count : %d\n", pos_m_count);
#endif
			memcpy(new_val, val, val_size);
			setval(geo, node, i, new_val);
			
			return 0;
		}
	return -ENOENT;
}
//EXPORT_SYMBOL_GPL(btree_update);

int pos_btree_update(char *name, void *_key, void *_val, unsigned long val_size)
{
	struct btree_head *head;
	unsigned long *key, *val;
	
	if (name==NULL || _key==NULL || _val==NULL || val_size <0)
		return -1;

	key = (unsigned long *)_key;
	val = (unsigned long *)_val;
	head = (struct btree_head *)pos_get_prime_object(name);

	return btree_update(name, head, &btree_geo128, key, val, val_size);
}

/*
 * Usually this function is quite similar to normal lookup.  But the key of
 * a parent node may be smaller than the smallest key of all its siblings.
 * In such a case we cannot just return NULL, as we have only proven that no
 * key smaller than __key, but larger than this parent key exists.
 * So we set __key to the parent key and retry.  We have to use the smallest
 * such parent key, which is the last parent key we encountered.
 */
/*void *btree_get_prev(struct btree_head *head, struct btree_geo *geo,
		     unsigned long *__key)
{
	int i, height;
	unsigned long *node, *oldnode;
	unsigned long *retry_key = NULL, key[geo->keylen];

	if (keyzero(geo, __key))
		return NULL;

	if (head->height == 0)
		return NULL;
retry:
	longcpy(key, __key, geo->keylen);
	dec_key(geo, key);

	node = head->node;
	for (height = head->height ; height > 1; height--) {
		for (i = 0; i < geo->no_pairs; i++)
			if (keycmp(geo, node, i, key) <= 0)
				break;
		if (i == geo->no_pairs)
			goto miss;
		oldnode = node;
		node = bval(geo, node, i);
		if (!node)
			goto miss;
		retry_key = bkey(geo, oldnode, i);
	}

	if (!node)
		goto miss;

	for (i = 0; i < geo->no_pairs; i++) {
		if (keycmp(geo, node, i, key) <= 0) {
			if (bval(geo, node, i)) {
				longcpy(__key, bkey(geo, node, i), geo->keylen);
				return bval(geo, node, i);
			} else
				goto miss;
		}
	}
miss:
	if (retry_key) {
		__key = retry_key;
		retry_key = NULL;
		goto retry;
	}
	return NULL;
}*/

static int getpos(struct btree_geo *geo, unsigned long *node,
		unsigned long *key)
{
	int i;

	for (i = 0; i < geo->no_pairs; i++) {
		if (keycmp(geo, node, i, key) <= 0)
			break;
	}
	return i;
}

static int getfill(struct btree_geo *geo, unsigned long *node, int start)
{
	int i;
	int ret = 0;

	for (i = start; i < geo->no_pairs; i++)
	{
		ret = !bval2(geo, node ,i);
		//printf("[getfill] ret = %d\n", ret);
		//if (!bval(geo, node, i))
		if (!bval2(geo, node, i))
		{
			break;
		}
	}
	return i;
}

/*
 * locate the correct leaf node in the btree
 */
static unsigned long *find_level(char *name, struct btree_head *head, struct btree_geo *geo,
		unsigned long *key, int level)
{
	unsigned long *node = head->node;
	int i, height;

	for (height = head->height; height > level; height--) {
		for (i = 0; i < geo->no_pairs; i++)
			if (keycmp(geo, node, i, key) <= 0)
				break;

		//if ((i == geo->no_pairs) || !bval(geo, node, i)) {
		if ((i == geo->no_pairs) || !bval2(geo, node, i)) {
			/* right-most key is too large, update it */
			/* FIXME: If the right-most key on higher levels is
			 * always zero, this wouldn't be necessary. */
			i--;
#if CONSISTENCY == 1
			setkey_log(name, geo, node, i, key);
#else
			setkey(geo, node, i, key);
#endif
		}
		//BUG_ON(i < 0);
		node = bval(geo, node, i);
	}
	//BUG_ON(!node);
	return node;
}

//static int btree_grow(struct btree_head *head, struct btree_geo *geo,
//		      gfp_t gfp)
static int btree_grow(char *name, struct btree_head *head, struct btree_geo *geo)
{
	unsigned long *node;
	int fill;
	static int grow_count=0;

	//node = btree_node_alloc(head, gfp);
	node = btree_node_alloc(name);
	if (!node)
		return -ENOMEM;
	if (head->node) {
		fill = getfill(geo, head->node, 0);
		setkey(geo, node, 0, bkey(geo, head->node, fill - 1));
		setval(geo, node, 0, head->node);
	}
#if CONSISTENCY == 1
	pos_write_value(name, (unsigned long *)&head->node, (unsigned long)node);
	pos_write_value(name, (unsigned long *)&head->height, (unsigned long)(head->height+1));
	pos_clflush_cache_range(head, sizeof(struct btree_head)); // Delayed flush
#else
	head->node = node;
	head->height++;
#endif
//sb s
grow_count++;
//printf("grow count : %d!\n", grow_count);
//sb e
	return 0;
}

//static void btree_shrink(struct btree_head *head, struct btree_geo *geo)
static void btree_shrink(char *name, struct btree_head *head, struct btree_geo *geo)
{
	unsigned long *node;
	int fill;

	if (head->height <= 1)
		return;

	node = head->node;
	fill = getfill(geo, node, 0);
	//BUG_ON(fill > 1);
#if CONSISTENCY == 1
	pos_write_value(name, (unsigned long *)&head->node, (unsigned long)bval(geo, node, 0));
	pos_write_value(name, (unsigned long *)&head->height, (unsigned long)(head->height-1));
	pos_clflush_cache_range(head, sizeof(struct btree_head)); // Delayed flush
#else
	head->node = bval(geo, node, 0);
	head->height--;
#endif
	//mempool_free(node, head->mempool);
	pos_free(name, node);
	pos_m_count--;
}

//static int btree_insert_level(struct btree_head *head, struct btree_geo *geo,
//			      unsigned long *key, void *val, int level,
//			      gfp_t gfp)
static int btree_insert_level(char *name, struct btree_head *head,
			      struct btree_geo *geo, unsigned long *key,
			      void *val, unsigned long val_size, int level)
{
	unsigned long *node;
	int i, pos, fill, err;
	int backup_state;
	//BUG_ON(!val);
	if (head->height < level) {
		//err = btree_grow(head, geo, gfp);
		err = btree_grow(name, head, geo);
		if (err) {
			printf("btree_grwo error!\n");
			return err;
		}
	}

	backup_state = btree_state;
retry:
	btree_state = 3;
	node = find_level(name, head, geo, key, level);
	pos = getpos(geo, node, key);
	fill = getfill(geo, node, pos);
	/* two identical keys are not allowed */
	//BUG_ON(pos < fill && keycmp(geo, node, pos, key) == 0);

	if (fill == geo->no_pairs) {
		/* need to split node */
		unsigned long *new;

		//new = btree_node_alloc(head, gfp);
		//printf("[btree_insert_level] check1\n");
		new = btree_node_alloc(name);
#if	BTREE_DEBUG == 1
	printf("[btree_insert_level1] pos_malloc count : %d\n", pos_m_count);
#endif
		//sb s
		//btree_state = 1;
		//sb e
		if (!new) {
			printf("new node alloc error!\n");
			return -ENOMEM;
		}
		pos_m_count++;
		//err = btree_insert_level(head, geo,
		//		bkey(geo, node, fill / 2 - 1),
		//		new, level + 1, gfp);
		err = btree_insert_level(name, head, geo,
				bkey(geo, node, fill / 2 - 1),
				new, 0, level + 1);	// Val_size(0) indicates whether copy or not.
		if (err) {
			//mempool_free(new, head->mempool);
			////pos_free(name, new);
			//printf("btree_insert_level error!\n");
			return err;
		}
		//printf("[btree_insert_level] check2\n");
		for (i = 0; i < fill / 2; i++) {
			setkey(geo, new, i, bkey(geo, node, i));
			setval(geo, new, i, bval(geo, node, i));
#if CONSISTENCY == 1
			setkey_log(name, geo, node, i, bkey(geo, node, i + fill / 2));
			setval_log(name, geo, node, i, bval(geo, node, i + fill / 2));
			clearpair_log(name, geo, node, i + fill / 2);
#else
			setkey(geo, node, i, bkey(geo, node, i + fill / 2));
			setval(geo, node, i, bval(geo, node, i + fill / 2));
			clearpair(geo, node, i + fill / 2);
#endif
		}
	//	printf("[btree_insert_level] check3\n");
		if (fill & 1) {
#if CONSISTENCY == 1
			setkey_log(name, geo, node, i, bkey(geo, node, fill - 1));
			setval_log(name, geo, node, i, bval(geo, node, fill - 1));
			clearpair_log(name, geo, node, fill - 1);
#else
			setkey(geo, node, i, bkey(geo, node, fill - 1));
			setval(geo, node, i, bval(geo, node, fill - 1));
			clearpair(geo, node, fill - 1);
#endif
		}

#if CONSISTENCY == 1
		pos_clflush_cache_range(node, NODESIZE); // Delayed flush in unit of NODESIZE
#endif

		goto retry;
	}
	//BUG_ON(fill >= geo->no_pairs);
	btree_state = backup_state;
	/* shift and insert */
	for (i = fill; i > pos; i--) {
#if CONSISTENCY == 1
		setkey_log(name, geo, node, i, bkey(geo, node, i - 1));
		setval_log(name, geo, node, i, bval(geo, node, i - 1));
#else
		setkey(geo, node, i, bkey(geo, node, i - 1));
		setval(geo, node, i, bval(geo, node, i - 1));
#endif
	}
#if CONSISTENCY == 1
	setkey_log(name, geo, node, pos, key);
#else
	setkey(geo, node, pos, key);
	setval(geo, node, pos, val);
#endif


	if (!val_size) {
#if CONSISTENCY == 1
		setval_log(name, geo, node, pos, val);
#else
		setval(geo, node, pos, val);
#endif
	} else {
		void *new_val;
		//printf("[btree_insert_level] check4\n");
		// Allocate object and copy the content 
		new_val = pos_malloc(name, val_size);
		pos_m_count++;
#if BTREE_DEBUG == 1
	printf("[pos_btree_init2] pos_malloc count : %d\n", pos_m_count);
#endif
		//sb s
		btree_state = 2;
		//sb e	
		memcpy(new_val, val, val_size);
	//	printf("[btree_insert_level] check5\n");
#if CONSISTENCY == 1
		pos_clflush_cache_range(new_val, val_size);
		setval_log(name, geo, node, pos, new_val);
#else
		//if(btree_garbage_count > 0) {
			setval(geo, node, pos, new_val);
		//	btree_garbage_count--;
	//	}
#endif
	}

#if CONSISTENCY == 1
		pos_clflush_cache_range(node, NODESIZE); // Delayed flush in unit of NODESIZE
#endif

	return 0;
}

//int btree_insert(struct btree_head *head, struct btree_geo *geo,
//		unsigned long *key, void *val, gfp_t gfp)
int pos_btree_insert(char *name, void *_key, void *_val, unsigned long val_size)
{
	struct btree_head *head;
	unsigned long *key, *val;
	int rval;
	
	if (name==NULL || _key==NULL || _val==NULL || val_size <0)
		return -1;

#if CONSISTENCY == 1
	pos_transaction_start(name, POS_TS_INSERT);
#endif

	key = (unsigned long *)_key;
	val = (unsigned long *)_val;
	head = (struct btree_head *)pos_get_prime_object(name);
#if BTREE_DEBUG	== 1
	printf("prime node : %p\n", head->node);
#endif
//printf("head : %p\n", head);
	//return btree_insert_level(head, geo, key, val, 1, gfp);
	//return btree_insert_level(name, head, &btree_geo128, key, val, val_size, 1);
	rval = btree_insert_level(name, head, &btree_geo128, key, val, val_size, 1);
#if CONSISTENCY == 1
	pos_transaction_end(name);
#endif
	return rval;
}
//EXPORT_SYMBOL_GPL(btree_insert);

//static void *btree_remove_level(struct btree_head *head, struct btree_geo *geo,
//		unsigned long *key, int level);
static int btree_remove_level(char *name, struct btree_head *head, 
		 struct btree_geo *geo, unsigned long *key, int level);
		 
//static void merge(struct btree_head *head, struct btree_geo *geo, int level,
static void merge(char *name, struct btree_head *head,
		struct btree_geo *geo, int level,
		unsigned long *left, int lfill,
		unsigned long *right, int rfill,
		unsigned long *parent, int lpos)
{
	int i;

	for (i = 0; i < rfill; i++) {
		/* Move all keys to the left */
#if CONSISTENCY == 1
		setkey_log(name, geo, left, lfill + i, bkey(geo, right, i));
		setval_log(name, geo, left, lfill + i, bval(geo, right, i));
#else
		setkey(geo, left, lfill + i, bkey(geo, right, i));
		setval(geo, left, lfill + i, bval(geo, right, i));
#endif
	}

#if CONSISTENCY == 1
	pos_clflush_cache_range(left, NODESIZE); // Delayed flush in unit of NODESIZE
#endif

	/* Exchange left and right child in parent */
#if CONSISTENCY == 1
	setval_log(name, geo, parent, lpos, right);
	setval_log(name, geo, parent, lpos + 1, left);
	pos_clflush_cache_range(parent, NODESIZE); // Delayed flush in unit of NODESIZE
#else
	setval(geo, parent, lpos, right);
	setval(geo, parent, lpos + 1, left);
#endif
	/* Remove left (formerly right) child from parent */
	//btree_remove_level(head, geo, bkey(geo, parent, lpos), level + 1);
	btree_remove_level(name, head, geo, bkey(geo, parent, lpos), level + 1);
	//mempool_free(right, head->mempool);
	pos_free(name, right);
	pos_m_count--;
}

//static void rebalance(struct btree_head *head, struct btree_geo *geo,
static void rebalance(char *name, struct btree_head *head, struct btree_geo *geo,
		unsigned long *key, int level, unsigned long *child, int fill)
{
	unsigned long *parent, *left = NULL, *right = NULL;
	int i, no_left, no_right;

	if (fill == 0) {
		/* Because we don't steal entries from a neighbour, this case
		 * can happen.  Parent node contains a single child, this
		 * node, so merging with a sibling never happens.
		 */
		//btree_remove_level(head, geo, key, level + 1);
		btree_remove_level(name, head, geo, key, level + 1);
		//mempool_free(child, head->mempool);
		return;
	}

	parent = find_level(name, head, geo, key, level + 1);
	i = getpos(geo, parent, key);
	//BUG_ON(bval(geo, parent, i) != child);

	if (i > 0) {
		left = bval(geo, parent, i - 1);
		no_left = getfill(geo, left, 0);
		if (fill + no_left <= geo->no_pairs) {
			//merge(head, geo, level,
			merge(name, head, geo, level,
					left, no_left,
					child, fill,
					parent, i - 1);
			return;
		}
	}
	if (i + 1 < getfill(geo, parent, i)) {
		right = bval(geo, parent, i + 1);
		no_right = getfill(geo, right, 0);
		if (fill + no_right <= geo->no_pairs) {
			//merge(head, geo, level,
			merge(name, head, geo, level,
					child, fill,
					right, no_right,
					parent, i);
			return;
		}
	}
	/*
	 * We could also try to steal one entry from the left or right
	 * neighbor.  By not doing so we changed the invariant from
	 * "all nodes are at least half full" to "no two neighboring
	 * nodes can be merged".  Which means that the average fill of
	 * all nodes is still half or better.
	 */
}

//static void *btree_remove_level(struct btree_head *head, struct btree_geo *geo,
//		unsigned long *key, int level)
static int btree_remove_level(char *name, struct btree_head *head, 
		 struct btree_geo *geo, unsigned long *key, int level)
{
	unsigned long *node;
	int i, pos, fill;
	void *ret;

	if (level > head->height) {
		/* we recursed all the way up */
#if CONSISTENCY == 1
		pos_write_value(name, (unsigned long *)&head->height, (unsigned long)0);
		pos_write_value(name, (unsigned long *)&head->node, (unsigned long)NULL);
		pos_clflush_cache_range(head, sizeof(struct btree_head)); // Delayed flush
#else
		head->height = 0;
		head->node = NULL;
#endif
		//return NULL;
		return -1;
	}

	node = find_level(name, head, geo, key, level);
	pos = getpos(geo, node, key);
	fill = getfill(geo, node, pos);
	if ((level == 1) && (keycmp(geo, node, pos, key) != 0))
		//return NULL;
		return -1;
	ret = bval(geo, node, pos);

	// Free the allocated object
	pos_free(name, bval(geo, node, pos));
	pos_m_count--;

	/* remove and shift */
	for (i = pos; i < fill - 1; i++) {
#if CONSISTENCY == 1
		setkey_log(name, geo, node, i, bkey(geo, node, i + 1));
		setval_log(name, geo, node, i, bval(geo, node, i + 1));
#else
		setkey(geo, node, i, bkey(geo, node, i + 1));
		setval(geo, node, i, bval(geo, node, i + 1));
#endif
	}
#if CONSISTENCY == 1
	clearpair_log(name, geo, node, fill - 1);
#else
	clearpair(geo, node, fill - 1);
#endif

#if CONSISTENCY == 1
	pos_clflush_cache_range(node, NODESIZE); // Delayed flush in unit of NODESIZE
#endif

	if (fill - 1 < geo->no_pairs / 2) {
		if (level < head->height)
			//rebalance(head, geo, key, level, node, fill - 1);
			rebalance(name, head, geo, key, level, node, fill - 1);
		else if (fill - 1 == 1)
			//btree_shrink(head, geo);
			btree_shrink(name, head, geo);
	}

	//return ret;
	return 0;
}

//void *btree_remove(struct btree_head *head, struct btree_geo *geo,
//		unsigned long *key)
int pos_btree_remove(char *name, void *_key)
{
	struct btree_head *head;
	unsigned long *key;
	int rval;
	
	if (name==NULL || key==NULL)
		return -1;

#if CONSISTENCY == 1
	pos_transaction_start(name, POS_TS_REMOVE);
#endif

	key = (unsigned long *)_key;
	head = (struct btree_head *)pos_get_prime_object(name);
	if (head->height == 0)
		return -1;

	//return btree_remove_level(head, geo, key, 1);
	//return btree_remove_level(name, head, &btree_geo128, key, 1);
	rval = btree_remove_level(name, head, &btree_geo128, key, 1);
#if CONSISTENCY == 1
	pos_transaction_end(name);
#endif
	return rval;

}

//기능 : Btree에서 unlink_leaf_node() 함수의 인자로 전달받은 g_count  개수만큼의 가비지를 
//      생성하는 재귀 함수, Node와 Value 중 Value만 가비지화
//입력 값: input_node는 전체 순회 중 탐색된 노드
//출력 값: 정상 동작 시 '0' 반환
int __unlink_leaf_nodes(unsigned long *input_node)
{
	int get_fill = 0, get_fill2=0;
  	int i, j;
  	unsigned long* node=NULL;
  	unsigned long* node_buf = NULL;
  	int level;
  	unsigned long* value = NULL;
  	unsigned long v= 0;
  	unsigned long *zero_val = NULL;

  	node = input_node;
  	get_fill = getfill(&btree_geo128, node, 0);

  	for(i=0; i<get_fill; i++) 
  	{
    		value = bval(&btree_geo128, node, i);
    		v = *value;  
			if(v < 0 || v > 30000)
    			{               
      				node_buf = bval(&btree_geo128, node, i);
				__unlink_leaf_nodes(node_buf);
    			}
    			else 
    			{			    
				if(btree_garbage_count > 0) {
					setval(&btree_geo128, node, i, zero_val);
					btree_garbage_count--;
				}
    			}
  	}
	
  	return 1;
}

//기능 : __unlink_leaf_node() 함수를 호출하여 Btree에서 g_count 개수만큼의 가비지를 생성
//입력 값
//      name : 객체저장소 이름
//      g_count : 생성할 가비지 개수
//출력 값: name에 해당하는 객체저장소가 없을 시 '-1' 반환, 정상적으로 수행 시 '0' 반환
int unlink_leaf_nodes(char *name, int g_count)
{
	struct btree_head *bh;
	unsigned long *node = NULL;

	bh = (struct btree_head *)pos_get_prime_object(name);
	node = bh->node;

	btree_garbage_count = g_count;

	return __unlink_leaf_nodes(node);
}

//기능 : 최근 생성한 Btree Node의 상태를 나타내는 btree_state 반환
//btree_state의 상태
//      Node와 Value 둘 다 할당 성공    : 2
//      Node만 할당                     : 1
//      Node와 Value 둘 다 할당 실패    : 0
unsigned int get_btree_state()
{
	return btree_state;
}

//기능 : Btree를 순회하여 탐색된 노드들로 Allocation List 구성
//입력 값
//      input_node : Btree 순회 중 현재 탐색된 노드(초기 input_node는 Root Node)
//      head : Allocation List를 구성할 List의 head
//출력 값 : 정상적으로 수행 시 '1' 반환, 그렇지 않으면 '0' 반환
int __make_list_for_btree(unsigned long *input_node, Node **head)
{
  	int get_fill = 0, get_fill2=0;
  	int i, j;
  	unsigned long* node=NULL;
  	unsigned long* node_buf = NULL;
  	int level;
  	unsigned long* value = NULL;
  	unsigned long v= 0;

  	node = input_node;
  	get_fill = getfill(&btree_geo128, node, 0);

  	for(i=0; i<get_fill; i++) 
  	{
    		value = bval(&btree_geo128, node, i);
    		v = *value;  
		if(v < 0 || v > 30000)
    		{               
     	 		node_buf = bval(&btree_geo128, node, i);
			__make_list_for_btree(node_buf, head);
    		} 
    		else 
    		{    
			insert_node(head, (unsigned long)value);
    		}
  	}
	insert_node(head, (unsigned long)node);
	
  	return 1;
}

//기능 : Btree를 순회하여 탐색된 노드들로 Allocation List 구성
//입력 값
//      bh : Btree 자료구조의 Root Node 포인터
//      head : Allocation List를 구성할 List의 head
//출력 값 : 정상적으로 수행 시 '1' 반환, 그렇지 않으면 '0' 반환
int make_list_for_btree(struct btree_head *bh, Node **head)
{
	unsigned long *node=NULL;
	
	node = bh->node;
	insert_node(head, (unsigned long)bh);
	if(!__make_list_for_btree(node, head)) {
		printf("error of making list for btree!\n");
		return 0;
	}

	return 1;
}
