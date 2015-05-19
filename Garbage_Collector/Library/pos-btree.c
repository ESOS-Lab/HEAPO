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
#include <pos-lib.h>
#include <string.h>	//memset
#include <stdio.h>


#define MODE			1	// 1: absolute addressing, 2: offset addressing
#define OFFSET_BASE		(0x3FFEF8000000)	//0x5FFEF8000000 -> error.... I don't know the reason...

#define CONSISTENCY		0
#define pos_write_value	pos_write_value_kv_noflush
#define LOG_CNT_ON		0


#define L1_CACHE_SHIFT	(6)	// 64bit?
#define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)

#define BITS_PER_LONG	64	// 64bit

#define ENOENT		2	/* No such file or directory */
#define ENOMEM		12	/* Out of Memory */

//dk s
#define POS_DEBUG 0
#define POS_BTREE_DEBUG 0
//dk e
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
	//dk s
	.keylen = 2 * LONG_PER_U64,	// 2
	.no_pairs = NODESIZE / sizeof(long) / (1 + 2 * LONG_PER_U64), // 5
	.no_longs = 2 * LONG_PER_U64 * (NODESIZE / sizeof(long) / (1 + 2 * LONG_PER_U64)), // 10

	//.keylen = 8 * LONG_PER_U64,	// 8
	//.no_pairs = NODESIZE / sizeof(long) / (1 + 8 * LONG_PER_U64), // 1
	//.no_longs = 8 * LONG_PER_U64 * (NODESIZE / sizeof(long) / (1 + 8 * LONG_PER_U64)), // 8

	//dk e
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

//dk s
extern int alloc_tree_meta_update_flag;
unsigned long *val_buf = NULL;
unsigned long *key_buf = NULL;
int tree_height;
extern char* Alloc_tree;
struct btree_head *root_node_ptr = NULL;
unsigned long *node_ptr = NULL;
int garbage_count = 0;
int find_count = 0;
//dk e



//static unsigned long *btree_node_alloc(struct btree_head *head, gfp_t gfp)
static unsigned long *btree_node_alloc(char *name)
{
	unsigned long *node;
	int i;

	if(POS_DEBUG == 1)
	{
		printf("----- btree_node_alloc start -----\n");
	}
	//node = mempool_alloc(head->mempool, gfp);
	
	//dk s
	alloc_tree_meta_update_flag = 1;
	//dk e
	node = (unsigned long *)pos_malloc(name, NODESIZE);
	//printf("alloc node = %p\n", node);
	alloc_tree_meta_update_flag = 0;

	if(POS_DEBUG == 1)
	{
		printf("----- btree_node_alloc end -----\n");
	}	

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
	{
		dest[i] = src[i];
		//printf("dest[%d] = %x, src[%d] = %x\n", i, dest[i], i, src[i]);
	}
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
	unsigned long *dest;

	//dk s
	if(0)
	{
		printf("=== setkey start ===\n");
		printf("len = %d\n", geo->keylen);
		printf("i = %d\n", n);
		printf("key = %x\n", *key);
		printf("bkey = %p\n", bkey(geo, node, n));
	}
	//dk e
	dest = longcpy(bkey(geo, node, n), key, geo->keylen);
	//dk s
	if(POS_DEBUG == 1)
	{
		//printf("dest = %p\n", dest);
		//printf("=== setkey end ===\n");
	}
}

static void setkey_log(char *name, struct btree_geo *geo, unsigned long *node, int n,
		   unsigned long *key)
{
	longcpy_log(name, bkey(geo, node, n), key, geo->keylen);
}

static void setval(struct btree_geo *geo, unsigned long *node, int n,
		   void *val)
{
	//dk s
	if(0)
	{
		printf("=== setval start ===\n");
		printf("node = %p\n", node);
		printf("geo->no_longs = %d\n", geo->no_longs);
		printf("n = %d\n", n);
		printf("val address = %p\n", val);
		printf("val = %x\n", (unsigned long)val);
	}

#if MODE == 1
	node[geo->no_longs + n] = (unsigned long) val;
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node[geo->no_longs + n], sizeof(unsigned long));
#endif
#elif MODE == 2
	node[geo->no_longs + n] = (unsigned long) val - OFFSET_BASE; // offset addressing mode;
#endif
	if(POS_DEBUG == 1)
	{
		//printf("bval =%x\n", bval(geo, node, n));
		//printf("=== setval end ===\n");
	}
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
int alloc_tree_init(char *name)
{
	struct btree_head *head;

	//dk s
	/*
	if (pos_create(name) == 0)
		return -1;
	*/
	if(POS_DEBUG == 1)
	{
		printf("----- alloc_tree_init start -----\n");
	}
	//dk e
#if CONSISTENCY == 1
	pos_log_create(name);
	pos_transaction_start(name, POS_TS_INSERT);
#endif

	head = (struct btree_head *)pos_malloc(name, sizeof(struct btree_head));

	pos_set_prime_object(name, head);
	
	__btree_init(head);
	//head->mempool = mempool_create(0, btree_alloc, btree_free, NULL);
	//if (!head->mempool)
	//	return -ENOMEM;
	if(POS_DEBUG == 1)
	{
		printf("----- alloc_tree_init end-----\n");
		printf("Alloc_tree head = %p\n", head);
		printf("--------------------------\n");
	}

#if CONSISTENCY == 1
	pos_transaction_end(name);
	pos_log_unmap(name);
#endif
	//dk s
	//pos_unmap(name); //unmap no~~~!!
	//dk e
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
	//printf("keycmp bkey(geo, node, pos) = %x, key=%x\n", bkey(geo, node, pos), key);
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

//dk s
void * dk_buf[3000]={0};
int dk_cnt = 0 ; 
//dk s
int pos_btree_gc(unsigned long *input_node, char* name)
{
	int get_fill = 0;
	int i, j;
	unsigned long* node=NULL;
	unsigned long* node_buf = NULL;
	int level; 
	unsigned long* value = NULL;
	int v= 0;
	int ret = 0;
	unsigned long *key_ptr= NULL;
	unsigned long key_ptr2 = 0;
	
	//printf("traverse\n");
	node = input_node;
	get_fill = getfill(&btree_geo128, node, 0);
	
	//printf("check 1\n");
	for(i=0; i<get_fill; i++)
	{
		if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
		{
			printf("node = %p\n", node);
			printf("i=%d\n", i);
		}
		value = bval(&btree_geo128, node, i);
		if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
		{
			printf("value = %d\n", *value);
		}
		v = *value;
		//printf("check 2\n");
		if(v > 30000 || v < 0)
		{
			//printf("check 3\n");
			node_buf = bval(&btree_geo128, node, i);
		//	printf("check 4\n");
			if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
			{
				printf("sub node = %p\n", node_buf);
			}
			pos_btree_gc(node_buf, name);
		}
		else
		{
			//printf("check 5\n");
			val_buf=bval(&btree_geo128, node, i);
			key_buf=bkey(&btree_geo128, node,i);
			//printf("key = %x, value = %d\n", *key_buf, *val_buf);
			//printf("key ad = %p, value ad = %\n", key_buf, val_buf);
			key_ptr = *key_buf;
			key_ptr2 = *key_ptr;
			//printf("key_ptr = %d, &key_ptr = %p\n", key_ptr, &key_ptr);
			//printf("key_ptr2 = %d, &key_ptr2 = %p\n", key_ptr2, &key_ptr2);
			
			//ret_ptr = pos_btree_lookup(name, &key_ptr2);
			//printf("check 6\n");
			root_node_ptr=pos_get_prime_object(name);
			node_ptr = root_node_ptr->node;
			//printf("root_node_ptr = %p\n", root_node_ptr);
			//printf("node_ptr = %p\n", node_ptr);
			
			ret = pos_btree_node_lookup(node_ptr, key_ptr);
			if(ret == -1)
			{
				//printf("This node address %x, key %d is garbage \n", *key_buf, key_ptr2);
				
				//printf("[%s][%p]\n",__func__,*key_buf);
				dk_buf[garbage_count] = *key_buf;
				garbage_count++;
				//pos_free(name, *key_buf);
			}
			else
			{
				//printf("This node finded, key = %x, value = %d\n", *key_buf, *val_buf);
			}
		}
	}
	
	return;
}
//dk e
		
//dk s
int pos_btree_node_lookup(unsigned long* input_node, unsigned long *alloc_node)
{
	int get_fill = 0;
	int i, j;
	unsigned long* node=NULL;
	unsigned long* node_buf = NULL;
	int level; 
	unsigned long* value = NULL;
	unsigned long* key = NULL;
	int v= 0;
	int k= 0;
	int ret = 0;
	
	node = input_node;
	get_fill = getfill(&btree_geo128, node, 0);

	for(i=0; i<get_fill; i++)
	{
		value = bval(&btree_geo128, node, i);
		key = bkey(&btree_geo128, node, i);
		v = *value;
		k = *key;
		//printf("k = %d, v = %d\n", k,v);
		
		if(v != k)
		{
			if(node == alloc_node || alloc_node == root_node_ptr)
			{
				//printf("node %p finded\n", alloc_node);
				return 0;
			}
			node_buf = bval(&btree_geo128, node, i);
			ret = pos_btree_node_lookup(node_buf, alloc_node);
			if(ret == -1)
			{
			}
			else
			{
				return 0;
			}
		}
		else
		{
			//printf("node = %p, alloc_node = %p\n", node, alloc_node);
			//printf("node = %p, alloc_node = %p, root_node_ptr = %p, node_ptr = %p\n", node, alloc_node, root_node_ptr, node_ptr);
			if(node == alloc_node || alloc_node == root_node_ptr)
			{
				//printf("node %p finded\n", alloc_node);
				find_count++;
				return 0;
			}
		}
	}
	return -1;

}
//dk e

//dk s
void pos_btree_traverse2(unsigned long *input_node)
{
	int get_fill = 0;
	int i, j;
	unsigned long* node=NULL;
	unsigned long* node_buf = NULL;
	int level; 
	unsigned long* value = NULL;
	int v= 0;
	
	//printf("traverse\n");
	node = input_node;
	get_fill = getfill(&btree_geo128, node, 0);

	for(i=0; i<get_fill; i++)
	{
		if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
		{
			printf("node = %p\n", node);
			printf("i=%d\n", i);
		}
		value = bval(&btree_geo128, node, i);
		if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
		{
			printf("value = %d\n", *value);
		}
		v = *value;
		
		if(v > 30000 || v < 0)
		{
			
			node_buf = bval(&btree_geo128, node, i);
			if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
			{
				printf("sub node = %p\n", node_buf);
			}
			pos_btree_traverse2(node_buf);
		}
		else
		{
			val_buf=bval(&btree_geo128, node, i);
			key_buf=bkey(&btree_geo128, node,i);
			printf("key = %x, value = %d\n", *key_buf, *val_buf);
		}
	}
	
	return;
}

void pos_btree_traverse_test(char *name)
{
	struct btree_head *ptr;

	int i, height;
	unsigned long *node = NULL;

	//dk s
	int get_fill = 0;
	//dk e
	ptr=pos_get_prime_object(name);
	if(POS_DEBUG ==1)
	{
		printf("----- pos_btree_traverse -----\n");
		printf("btree head = %p\n", ptr);
	}
	
	height = ptr->height;
	node = ptr->node;		
	if(POS_DEBUG ==1)
	{
		printf("node = %p\n", node);
		printf("height = %d\n", ptr->height);
	}
	
	if (height == 0)
		return 0;

	for ( ; height > 1; height--)
	{
		printf("checkpoint 1\n");
		
		get_fill = getfill(&btree_geo128, node, 0);
		printf("get_fill = %d\n", get_fill);
		for (i = 0; i < get_fill; i++)
		{
			val_buf=bval(&btree_geo128, node, i);
			key_buf=bkey(&btree_geo128, node, i);
			printf("key = %x, value = %d\n", *key_buf, *val_buf);
		}

		printf("checkpoint 2\n");
		printf("i=%d\n", i);
		i--;
		if (i == btree_geo128.no_pairs)
		{
			return 0;
		}
				
		printf("checkpoint 3\n");
		node = bval(&btree_geo128, node, i);
		printf("node = %p\n", node);
		
		if (!node)
		{	
			printf("checkpoint 4\n");
			return 0;
		}

	}
	
	if (!node)
		return 0;
	
	
	printf("checkpoint 5\n");

	/*
	val_buf=bval(&btree_geo128, node, 0);
	key_buf=bkey(&btree_geo128, node, 0);
	printf("key = %x, value = %d\n", *key_buf, *val_buf);
	*/
	
	get_fill = getfill(&btree_geo128, node, 0);
	printf("get_fill = %d\n", get_fill);
	//for (i = 0; i < btree_geo128.no_pairs; i++)
	for (i = 0; i < get_fill; i++)
	{
		printf("checkpoint 6\n");
		/*
		key_buf = node[0*btree_geo128.keylen];
		printf("key=%x\n", *key_buf);
		printf("key_buf=%p\n", key_buf);
		key_buf = bkey(&btree_geo128, node, 0);			
		printf("bkey = %x\n", *key_buf);
		
		if(i == 1)
		{
			key_buf = node[1*btree_geo128.keylen];
			printf("key=%x\n", *key_buf);
			printf("key_buf=%p\n", key_buf);
			key_buf = bkey(&btree_geo128, node, 1);			
			printf("bkey = %x\n", *key_buf);
		}
		val_buf = node[btree_geo128.no_longs + 0];
		printf("value=%d\n", *val_buf);
		printf("val_buf=%p\n", val_buf);
		val_buf = bval(&btree_geo128, node, 0);
		printf("bval=%d\n", *val_buf);
		if(i == 1)
		{
			val_buf = node[btree_geo128.no_longs + 1];
			printf("value=%d\n", *val_buf);
			printf("val_buf=%p\n", val_buf);
			val_buf = bval(&btree_geo128, node, 1);
			printf("bval=%d\n", *val_buf);
		}
		*/
		//&node[n * geo->keylen];
		val_buf = bval(&btree_geo128, node, i);
		printf("checkpoint 7\n");
		key_buf = bkey(&btree_geo128, node, i);			
		printf("key = %x, value=%d\n", *key_buf, *val_buf);
		
		printf("checkpoint 8\n");
	}
	printf("checkpoint 9\n");
	return ;
	
}

//dk e

void *btree_lookup(struct btree_head *head, struct btree_geo *geo,
		unsigned long *key)
{
	int i, height = head->height;
	unsigned long *node = head->node;

	if (height == 0)
		return NULL;

	//printf("btree_lookup check point 1\n");
	for ( ; height > 1; height--) {
		for (i = 0; i < geo->no_pairs; i++)
			if (keycmp(geo, node, i, key) <= 0)
				break;
		if (i == geo->no_pairs)
			return NULL;
		//printf("lookup i = %d\n", i);
		node = bval(geo, node, i);
		if (!node)
			return NULL;
	}
	//printf("btree_lookup check point 2\n");
	if (!node)
		return NULL;
	//printf("btree_lookup check point 3\n");
	for (i = 0; i < geo->no_pairs; i++)
	{
		//printf("btree_lookup check point 4\n");
		//printf("key = %p\n", *key);
		//printf("bkey = %p, *bkey = %p\n", bkey(geo, node, i), *bkey(geo, node, i));
		if (keycmp(geo, node, i, key) == 0)
		{
			//dk s
			printf("key = %p\n", *key);
			printf("bkey = %p, *bkey = %p\n", bkey(geo, node, i), *bkey(geo, node, i));
			return node;
			//return bval(geo, node, i);
			//dk e
		}
		
	}
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
	//dk s
	printf("key = %p\n", *key);
	//dk e

	return btree_lookup(head, &btree_geo128, key);
}

/*//int btree_update(struct btree_head *head, struct btree_geo *geo,
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
			// Allocate object and copy the content 
			new_val = pos_malloc(name, val_size);
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
}*/

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

int getfill(struct btree_geo *geo, unsigned long *node, int start)
{
	int i;

	for (i = start; i < geo->no_pairs; i++)
		//if (!bval(geo, node, i))
		if (!bval2(geo, node, i))
			break;
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

	//dk s
	if(POS_DEBUG ==1 )
	{
		printf("----- btree_grow start  -----\n");
	}
	//node = btree_node_alloc(head, gfp);
	node = btree_node_alloc(name);
	//dk e
	
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
	//dk s
	if(POS_DEBUG ==1 )
	{
		printf("----- btree_grow end  -----\n");
	}
	//dk e
	
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

	//dk s
	unsigned long *val_buf;

	val_buf = (unsigned long *)val;
	//dk e
	
	if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
	{
		printf("----- btree_insert_level -----\n");
		printf("head->height = %d\n", head->height);
		printf("inserted key = %p\n", key);
		printf("inserted value = %d\n", *val_buf);
		printf("value size = %d\n", val_size);
		printf("---------------------------\n");
	}
	
	//BUG_ON(!val);
	if (head->height < level) 
	{
		//err = btree_grow(head, geo, gfp);
		err = btree_grow(name, head, geo);
		if (err)
		{
			return err;
		}
	}
	//dk e
	
	if(POS_DEBUG == 1)
	{
		printf("----- btree_insert_level RETRY -----\n");
	}
retry:
	//printf("check point 1\n");
	node = find_level(name, head, geo, key, level);
	pos = getpos(geo, node, key);
	fill = getfill(geo, node, pos);
	/* two identical keys are not allowed */
	//BUG_ON(pos < fill && keycmp(geo, node, pos, key) == 0);
	
	//printf("check point 2\n");
	
	if (fill == geo->no_pairs) {
		/* need to split node */
		unsigned long *new;

		//new = btree_node_alloc(head, gfp);
		//printf("check point 3\n");
		new = btree_node_alloc(name);
		//printf("check point 4\n");
		
		if (!new)
			return -ENOMEM;
		//err = btree_insert_level(head, geo,
		//		bkey(geo, node, fill / 2 - 1),
		//		new, level + 1, gfp);
		//printf("check point 5\n");
		err = btree_insert_level(name, head, geo, bkey(geo, node, fill / 2 - 1), new, 0, level + 1);	// Val_size(0) indicates whether copy or not.
		//printf("check point 6\n");
				
		
		if (err) {
			//mempool_free(new, head->mempool);
			////pos_free(name, new);
			//printf("check point 7\n");
			return err;
		}
		//printf("check point 8\n");
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
		if (fill & 1) {
			//printf("check point 9\n");
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
	//printf("check point 10\n");
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
	//printf("check point 11\n");
#if CONSISTENCY == 1
	setkey_log(name, geo, node, pos, key);
#else
	setkey(geo, node, pos, key);
	//setval(geo, node, pos, val);
#endif
	if (!val_size) {
		//printf("check point 12\n");
#if CONSISTENCY == 1
		setval_log(name, geo, node, pos, val);
#else
		setval(geo, node, pos, val);
#endif
	} else {
		void *new_val;

		//printf("check point 13\n");

		// Allocate object and copy the content 
		//dk s
		alloc_tree_meta_update_flag = 1;
		//dk e
		new_val = pos_malloc(name, val_size);
		//dk s
		alloc_tree_meta_update_flag = 0;
		//dk e
		memcpy(new_val, val, val_size);
#if CONSISTENCY == 1
		pos_clflush_cache_range(new_val, val_size);
		setval_log(name, geo, node, pos, new_val);
#else
		setval(geo, node, pos, new_val);
#endif
	}

#if CONSISTENCY == 1
		pos_clflush_cache_range(node, NODESIZE); // Delayed flush in unit of NODESIZE
#endif
		//printf("check point 14\n");
	return 0;
}

//int btree_insert(struct btree_head *head, struct btree_geo *geo,
//		unsigned long *key, void *val, gfp_t gfp)
int alloc_tree_insert(char *name, void *_key, void *_val, unsigned long val_size)
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

	//dk s
	if(POS_DEBUG == 1 && POS_BTREE_DEBUG == 1)
	{
		printf("key = %p\n", key);
		printf("val = %d\n", *val);
		printf("head = %p\n", head);
	}
	//dk e

	//printf("333333\n");
	//return btree_insert_level(head, geo, key, val, 1, gfp);
	//return btree_insert_level(name, head, &btree_geo128, key, val, val_size, 1);
	rval = btree_insert_level(name, head, &btree_geo128, key, val, val_size, 1);
	//printf("4444444\n");
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
//EXPORT_SYMBOL_GPL(btree_remove);

//int btree_merge(struct btree_head *target, struct btree_head *victim,
//		struct btree_geo *geo, gfp_t gfp)
//{
//	unsigned long key[geo->keylen];
//	unsigned long dup[geo->keylen];
//	void *val;
//	int err;
//
//	BUG_ON(target == victim);
//
//	if (!(target->node)) {
//		/* target is empty, just copy fields over */
//		target->node = victim->node;
//		target->height = victim->height;
//		__btree_init(victim);
//		return 0;
//	}
//
//	/* TODO: This needs some optimizations.  Currently we do three tree
//	 * walks to remove a single object from the victim.
//	 */
//	for (;;) {
//		if (!btree_last(victim, geo, key))
//			break;
//		val = btree_lookup(victim, geo, key);
//		err = btree_insert(target, geo, key, val, gfp);
//		if (err)
//			return err;
//		/* We must make a copy of the key, as the original will get
//		 * mangled inside btree_remove. */
//		longcpy(dup, key, geo->keylen);
//		btree_remove(victim, geo, dup);
//	}
//	return 0;
//}
//EXPORT_SYMBOL_GPL(btree_merge);

/*static size_t __btree_for_each(struct btree_head *head, struct btree_geo *geo,
			       unsigned long *node, unsigned long opaque,
			       void (*func)(void *elem, unsigned long opaque,
					    unsigned long *key, size_t index,
					    void *func2),
			       void *func2, int reap, int height, size_t count)
{
	int i;
	unsigned long *child;

	for (i = 0; i < geo->no_pairs; i++) {
		child = bval(geo, node, i);
		if (!child)
			break;
		if (height > 1)
			count = __btree_for_each(head, geo, child, opaque,
					func, func2, reap, height - 1, count);
		else
			func(child, opaque, bkey(geo, node, i), count++,
					func2);
	}
	if (reap)
		mempool_free(node, head->mempool);
	return count;
}

static void empty(void *elem, unsigned long opaque, unsigned long *key,
		  size_t index, void *func2)
{
}

void visitorl(void *elem, unsigned long opaque, unsigned long *key,
	      size_t index, void *__func)
{
	visitorl_t func = __func;

	func(elem, opaque, *key, index);
}
EXPORT_SYMBOL_GPL(visitorl);

void visitor32(void *elem, unsigned long opaque, unsigned long *__key,
	       size_t index, void *__func)
{
	visitor32_t func = __func;
	u32 *key = (void *)__key;

	func(elem, opaque, *key, index);
}
EXPORT_SYMBOL_GPL(visitor32);

void visitor64(void *elem, unsigned long opaque, unsigned long *__key,
	       size_t index, void *__func)
{
	visitor64_t func = __func;
	u64 *key = (void *)__key;

	func(elem, opaque, *key, index);
}
EXPORT_SYMBOL_GPL(visitor64);

void visitor128(void *elem, unsigned long opaque, unsigned long *__key,
		size_t index, void *__func)
{
	visitor128_t func = __func;
	u64 *key = (void *)__key;

	func(elem, opaque, key[0], key[1], index);
}
EXPORT_SYMBOL_GPL(visitor128);

size_t btree_visitor(struct btree_head *head, struct btree_geo *geo,
		     unsigned long opaque,
		     void (*func)(void *elem, unsigned long opaque,
		     		  unsigned long *key,
		     		  size_t index, void *func2),
		     void *func2)
{
	size_t count = 0;

	if (!func2)
		func = empty;
	if (head->node)
		count = __btree_for_each(head, geo, head->node, opaque, func,
				func2, 0, head->height, 0);
	return count;
}
EXPORT_SYMBOL_GPL(btree_visitor);

size_t btree_grim_visitor(struct btree_head *head, struct btree_geo *geo,
			  unsigned long opaque,
			  void (*func)(void *elem, unsigned long opaque,
				       unsigned long *key,
				       size_t index, void *func2),
			  void *func2)
{
	size_t count = 0;

	if (!func2)
		func = empty;
	if (head->node)
		count = __btree_for_each(head, geo, head->node, opaque, func,
				func2, 1, head->height, 0);
	__btree_init(head);
	return count;
}
EXPORT_SYMBOL_GPL(btree_grim_visitor);*/

/*static int __init btree_module_init(void)
{
	btree_cachep = kmem_cache_create("btree_node", NODESIZE, 0,
			SLAB_HWCACHE_ALIGN, NULL);
	return 0;
}

static void __exit btree_module_exit(void)
{
	kmem_cache_destroy(btree_cachep);
}*/

/* If core code starts using btree, initialization should happen even earlier */
/*module_init(btree_module_init);
module_exit(btree_module_exit);

MODULE_AUTHOR("Joern Engel <joern@logfs.org>");
MODULE_AUTHOR("Johannes Berg <johannes@sipsolutions.net>");
MODULE_LICENSE("GPL");*/
