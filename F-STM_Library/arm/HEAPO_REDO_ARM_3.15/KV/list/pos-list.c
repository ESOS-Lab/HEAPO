/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../Library/pos-lib.h"
#include "pos-list.h"


#define MODE			1	// 1: absolute addressing, 2: offset addressing
#define OFFSET_BASE		(0x3FFEF8000000)
#define CONSISTENCY		1
#define pos_write_value	pos_write_value_kv

int pos_list_init(char *name)
{
	struct list_head *head;
	
	if (pos_create(name) == 0)
		return -1;

#if CONSISTENCY == 1
	pos_log_create(name);
	pos_transaction_start(name, POS_TS_INSERT);
#endif

	head = (struct list_head *)pos_malloc(name, sizeof(struct list_head));
	pos_set_prime_object(name, head);
	head->head = NULL;

#if CONSISTENCY == 1
	pos_transaction_end(name);
	pos_log_unmap(name);
#endif
	pos_unmap(name);

	return 0;
}

int pos_list_destroy(char *name)
{
	pos_map(name);
#if CONSISTENCY == 1
	pos_log_map(name);
	pos_log_delete(name);
#endif
	pos_delete(name);

	return 0;
}

int pos_list_open(char *name)
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

void pos_list_close(char *name)
{
#if CONSISTENCY == 1
	pos_log_unmap(name);
#endif
	pos_unmap(name);
}

int pos_list_insert(char *name, void *_key, void *_val, unsigned long val_size)
{
	struct list_head * head;
	struct list_node *node;
	unsigned long *key, *val;
	int i;

#if CONSISTENCY == 1
	pos_transaction_start(name, POS_TS_INSERT);
#endif
	
	key = (unsigned long *)_key;
	val = (unsigned long *)_val;
	
	head = (struct list_head *)pos_get_prime_object(name);

	node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));
	
	for (i=0; i<KEY_SIZE; i++) {
		node->key[i] = key[i];
	}
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));
#endif

	node->value = (unsigned long *)pos_malloc(name, val_size);
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->value, sizeof(node->value));
#endif
	memcpy(node->value, val, val_size);
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->value, val_size);
#endif

	node->next = head->head;
#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->next, sizeof(node->next));
#endif

#if MODE == 1
#if CONSISTENCY == 1
	pos_write_value(name, (unsigned long *)&head->head, (unsigned long)node);
	
	pos_transaction_end(name);
#else
	head->head = node;
#endif
#elif MODE == 2
	head->head = node - OFFSET_BASE;
#endif

	return 0;
}

int key_cmp(unsigned long *key1, unsigned long *key2)
{
	int i;

	for (i=0; i<KEY_SIZE; i++) {
		if (key1[i] != key2[i])
			return 0;
	}

	return 1;
}

void *pos_list_lookup(char *name, void *_key)
{
	struct list_head * head;
	struct list_node *node;
	unsigned long *key;
	int i;

	key = (unsigned long *)_key;

	head = (struct list_head *)pos_get_prime_object(name);

	node = head->head;

	while (node) {

#if MODE == 2
		node += OFFSET_BASE;
#endif

		if (key_cmp(node->key, key) == 1)
			return node->value;

		node = node->next;
	}

	return NULL;
}

int pos_list_remove(char *name, void *_key)
{
	struct list_head * head;
	struct list_node *node, **prev_node;
	unsigned long *key;
	int i;

#if CONSISTENCY == 1
	pos_transaction_start(name, POS_TS_REMOVE);
#endif

	key = (unsigned long *)_key;

	head = (struct list_head *)pos_get_prime_object(name);

	prev_node = &head->head;
	node = head->head;
	while (node) {

#if MODE == 2
		node += OFFSET_BASE;
#endif

		if (key_cmp(node->key, key) == 1) {

#if CONSISTENCY == 1
			pos_write_value(name, (unsigned long *)prev_node, (unsigned long)node->next);
#else
			*prev_node = node->next;
#endif
			pos_free(name, node->value);
			pos_free(name, node);

#if CONSISTENCY == 1
			pos_transaction_end(name);
#endif

			return 0;
		}

		prev_node = &node->next;
		node = node->next;
	}

#if CONSISTENCY == 1
			pos_transaction_end(name);
#endif

	return -1;
}

