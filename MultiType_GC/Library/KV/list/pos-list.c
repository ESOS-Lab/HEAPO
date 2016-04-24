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

Node *alloc_head=NULL;
unsigned int list_state=0;
//son end

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
// sb s
	//insert_node(&alloc_head, (unsigned long)head);
// sb e
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

//#if LIST_DEBUG == 1
//printf("[pos-insert] start\n");
//#endif

#if CONSISTENCY == 1
	pos_transaction_start(name, POS_TS_INSERT);
#endif

	key = (unsigned long *)_key;
	val = (unsigned long *)_val;
	
	head = (struct list_head *)pos_get_prime_object(name);
//#if LIST_DEBUG == 1
//printf("[pos-insert] 1\n");
//#endif
	node = (struct list_node *)pos_malloc(name, sizeof(struct list_node));
	//dk s
	memset(node, 0, sizeof(struct list_node));
	//dk e
	//sb s
	list_state = 1;
//	insert_node(&alloc_head, (unsigned long)node);
	//sb e
//#if LIST_DEBUG == 1
//printf("[pos-insert] 2\n");
//#endif
	for (i=0; i<KEY_SIZE; i++) {
		node->key[i] = key[i];
	}
#if CONSISTENCY == 1
	pos_clflush_cache_range(node->key, KEY_SIZE*sizeof(unsigned long));
#endif

	node->value = (unsigned long *)pos_malloc(name, val_size);
	//dk s
	memset(node->value, 0, sizeof(val_size));
	//dk e

	//sb s
	//insert_node(&alloc_head, (unsigned long)node->value);
	//list_state = 2;
	//sb e
//#if LIST_DEBUG == 1
	//dk s
//printf("[pos-insert] node : %p\n", node);
	//dk e
//printf("[pos-insert] node->value : %p\n", node->value);
//printf("[pos-insert] 3-1\n");
//#endif

#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->value, sizeof(node->value));
#endif
	//printf("val1 : %lu, val2 : %lu, val_size : %lu\n", val[0], val[1], val_size);
	memcpy(node->value, val, val_size);
//#if LIST_DEBUG == 1
//printf("[pos-insert] 3-2\n");
//#endif

#if CONSISTENCY == 1
	pos_clflush_cache_range(node->value, val_size);
#endif
	node->next = head->head;
//#if LIST_DEBUG == 1
//printf("[pos-insert] 3-3\n");
//#endif

#if CONSISTENCY == 1
	pos_clflush_cache_range(&node->next, sizeof(node->next));
#endif

#if MODE == 1
#if CONSISTENCY == 1
	pos_write_value(name, (unsigned long *)&head->head, (unsigned long)node);
	
	pos_transaction_end(name);
#else
	head->head = node;
	//sb s
	list_state = 2;
	//sb e
//#if LIST_DEBUG == 1
//printf("[pos-insert] 3-4\n");
//#endif

#endif
#elif MODE == 2
	head->head = node - OFFSET_BASE;
#endif

//#if LIST_DEBUG == 1
//	printf("[pos-insert] fin\n");
//#endif

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
	printf("head : %p, head->head : %p\n", lh, cur_node);
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

unsigned int get_list_state()
{
	return list_state;
}

int pos_delete_selected_node(char *name, int idx)
{
	struct list_head *lh;
	struct list_node *cur_node, *prev_node;
	int i;

printf("1\n");
	lh = (struct list_head *)pos_get_prime_object(name);
	if(lh == NULL)
		return 0;
printf("2\n");
	cur_node = lh->head;
	for(i=0; i<idx; i++) {
	printf("[in for]prev_node = %p\n", prev_node);
	printf("[in for]cur_node = %p\n", cur_node);
		prev_node = cur_node;
		cur_node = cur_node->next;
	}
	printf("address check\n");
	printf("i =%d\n", i);
	printf("prev_node = %p\n", prev_node);
	printf("cur_node = %p\n", cur_node);

	if(cur_node == NULL && i < idx-2) {
		printf("wrong index!\n");
		return 0;
	}
printf("3 i - %d\n", i);
    prev_node->next = NULL;
	cur_node->next = NULL;
	
	printf("[delete in pos list] cur_node : %p, cur_node->value : %p\n", cur_node, (void *)cur_node->value);
	pos_free(name, cur_node->value);
	pos_free(name, cur_node);
printf("4\n");
	//cur_node = NULL;	
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
	//struct list_head *lh;
	struct list_node *cur_node;
	unsigned long *value;
	//dk s
	int loop_count = 0; //for debugging
	//dk e 
	
	//lh = (struct list_head *)pos_get_prime_object(name);
	//printf("lh : %p, *head : %p\n", lh, *head);	
	if(lh == NULL)
		return 0;
//printf("start real\n");
	cur_node = lh->head;
	// repeat while next node is not NULL
	insert_node(head, (unsigned long)lh);
	while(cur_node != NULL) {
		// insert current node's address in the alloc tree
		insert_node(head, (unsigned long)cur_node);
		value = cur_node->value;
		if(value != NULL)
			insert_node(head, (unsigned long)value);
#if LIST_DEBUG == 1
		printf("cur_node(%p), value(%p), inserted\n", cur_node, value);
#endif
		cur_node = cur_node->next;
		//dk s
//		loop_count++;
//		if(loop_count > 200)
//		{
//			return -1;
//		}
		
	}

	return 1;
}

int make_list_for_list2(char *name, Node **head)
{
	struct list_head *lh;
	struct list_node *cur_node;
	unsigned long *value;

	lh = (struct list_head *)pos_get_prime_object(name);
	//printf("lh : %p, *head : %p\n", lh, *head);	
	if(lh == NULL)
		return 0;
//printf("start real\n");
	cur_node = lh->head;
	// repeat while next node is not NULL
	insert_node(head, (unsigned long)lh);
	while(cur_node != NULL) {
		// insert current node's address in the alloc tree
		value = cur_node->value;
		insert_node(head, (unsigned long)cur_node);
		insert_node(head, (unsigned long)value);
//#if LIST_DEBUG == 1
//		printf("cur_node(%p), value(%p), inserted\n", cur_node, value);
//#endif
		cur_node = cur_node->next;
	}
	return 1;
}
