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

#define	LIST_DEBUG		0

Node *alloc_head=NULL;
unsigned int list_state=0;

void *get_alloc_head()
{
	return (void *)alloc_head;
}

void remove_alloc_list()
{
	remove_list(alloc_head);
}

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
	//insert_node(&alloc_head, (unsigned long)head);
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

	printf("[DEBUG] pos_list_insert\n");
	head = (struct list_head *)pos_get_prime_object(name);
	node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));
	printf("[DEBUG] pos_list_insert: pos_malloc() finished\n");
	memset(node, 0, sizeof(struct list_node));
	list_state = 1;
	for (i=0; i<KEY_SIZE; i++) {
		node->key[i] = key[i];
	}
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));
#endif

	node->value = (unsigned long *)pos_malloc(name, val_size);
	memset(node->value, 0, sizeof(val_size));

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
	list_state = 2;

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
			delete_node(&alloc_head, (unsigned long)node->value);
			pos_free(name, node);
			delete_node(&alloc_head, (unsigned long)node);

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
	//printf("head : %p, head->head : %p\n", lh, cur_node);
	// repeat while next node is not NULL
	while(cur_node != NULL) {
#if LIST_DEBUG == 1
		printf("cur(%p)\tcur_next(%p)\n", cur_node, cur_node->next);
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

//최근 생성한 List Node의 상태를 나타내는 list_state 반환
//list_state의 상태
//      Node와 Value 둘 다 할당 성공    : 2
//      Node만 할당                     : 1
//      Node와 Value 둘 다 할당 실패    : 0
unsigned int get_list_state()
{
	return list_state;
}

//기능 : Linked List에서 idx 번째 노드를 할당 해지하여 List에서 idx 뒤에 위치한 
//	노드 개수*2개(Node, Value)의 가비지를 생성하는 함수
//입력 값
//      name : 객체저장소 이름
//      idx : 연결을 끊을 Linked List 내 인덱스
//출력 값: name에 해당하는 객체저장소가 없을 시 '-1' 반환, 정상적으로 수행 시 '0' 반환
int pos_delete_selected_node(char *name, int idx)
{
	struct list_head *lh;
	struct list_node *cur_node, *prev_node;
	int i;

	lh = (struct list_head *)pos_get_prime_object(name);
	if(lh == NULL)
		return -1;

	cur_node = lh->head;
	for(i=0; i<idx; i++) {
		prev_node = cur_node;
		cur_node = cur_node->next;
	}

	if(cur_node == NULL && i < idx-2) {
		printf("wrong index!\n");
		return -1;
	}
	prev_node->next = NULL;
	cur_node->next = NULL;
	
	pos_free(name, cur_node->value);
	pos_free(name, cur_node);
}

//기능 : Linked List를 순회하여 탐색된 노드들로 Allocation List 구성
//입력 값
//      lh : Linked List 자료구조의 head
//      head : Allocation List를 구성할 List의 head
//출력 값 : 정상적으로 수행 시 '1' 반환, 그렇지 않으면 '0' 반환
int make_list_for_list(struct list_head *lh, Node **head)
{
	struct list_node *cur_node;
	unsigned long *value;
	
	if(lh == NULL)
		return 0;
	cur_node = lh->head;
	// repeat while next node is not NULL
	insert_node(head, (unsigned long)lh);
	while(cur_node != NULL) {
		// insert current node's address in the alloc tree
		insert_node(head, (unsigned long)cur_node);
		value = cur_node->value;
		if(value != NULL)
			insert_node(head, (unsigned long)value);
		
		cur_node = cur_node->next;
	}

	return 1;
}
