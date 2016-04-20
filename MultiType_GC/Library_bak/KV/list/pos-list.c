/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pos-lib.h>
#include "pos-list.h"
#include "../alloc_list/alloc_list.h"

#define MODE			1	// 1: absolute addressing, 2: offset addressing
#define OFFSET_BASE		(0x3FFEF8000000)
#define CONSISTENCY		0
#define pos_write_value	pos_write_value_kv

//son start
#define	LIST_DEBUG		1
//son end

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

void print_list(char *name)
{
	struct list_head *lh;
	struct list_node *cur_node;

	lh = (struct list_head *)pos_get_prime_object(name);
	if(lh == NULL)
		return;
	
	cur_node = lh->head;
	// repeat while next node is not NULL
	while(cur_node != NULL) {
#if LIST_DEBUG == 1
		printf("cur(%p)\t", cur_node);
#endif
		cur_node = cur_node->next;
	}
	printf("\n");
}

void delete_second_node(char *name)
{
	struct list_head *lh;
	struct list_node *cur_node;

	lh = (struct list_head *)pos_get_prime_object(name);
	if(lh == NULL)
		return;
	
	cur_node = lh->head->next;
	pos_free(name, cur_node);
	cur_node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));
	cur_node->next = NULL;
}

/*
*	make_list_for_list(struct list_head *lh, Node **head)	
*	입력 값
*		name : 순회해서 allocation list를 구성할 object storage의 이름
*		head : allocation list를 구성할 head(리스트의 첫 번째 노드를 가리킬 포인터)
* 출력 값 : list 자료구조를 제대로 탐색해서 allocation list가 만들어 졌으면 '1'을 반환, 
*		그렇지 않으면 '-1'을 반환
* 기능 : name에 해당하는 object storage에서 사용하는 자료구조인 list를 prime 오브젝트(리스트 head)가 
*		가리키는 첫 번재 노드부터 탐색하여 insert_node()(내가 구현한 정렬 리스트 인터페이스)을 통해 
*		allocation list 구성
*/
int make_list_for_list(struct list_head *lh, Node **head)
{
	struct list_head *lh;
	struct list_node *cur_node;

	//lh = (struct list_head *)pos_get_prime_object(name);
	//printf("lh : %p, *head : %p\n", lh, *head);	
	if(lh == NULL)
		return 0;
//printf("start real\n");
	cur_node = lh->head;
	// repeat while next node is not NULL
	while(cur_node != NULL) {
		// insert current node's address in the alloc tree
		insert_node(head, (unsigned long)cur_node);
#if LIST_DEBUG == 1
		printf("cur_node(%p) inserted\n", cur_node);
#endif
		cur_node = cur_node->next;
	}

	return 1;
}
