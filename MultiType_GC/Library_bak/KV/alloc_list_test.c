#include <stdio.h>
#include <stdlib.h>
#include "alloc_list/alloc_list.h"
#include "list/pos-list.h"
#include "btree/pos-btree.h"
#include "hashtable/pos-hashtable.h"
#include "hashtable/pos-hashtable_private.h"

#define LIST_TYPE				0
#define HASHTABLE_TYPE	1
#define	BTREE_TYPE			2
/*
int make_list_for_list(struct list_head *lh, Node **head)
{
	struct list_node *cur_node;

	if(lh == NULL || *head == NULL)
		return 0;

	cur_node = lh->head;
	// repeat while next node is not NULL
	while(cur_node != NULL) {
		// insert current node's address in the alloc tree
		insert_node(head, (unsigned long)cur_node);
		printf("cur_node's addr(%lu) is inserted in alloc list\n", (unsigned long)cur_node);
		cur_node = cur_node->next;
	}

	return 1;
}

int make_list_for_hashtable(struct hashtable *h, Node **head)
{
	return 1;
}

int make_list_for_btree(struct btree_head *bh, Node **head)
{
	return 1;
}
*/
int make_alloc_list(Node **head, void *prime_obj, int type)
{
	switch(type) {
		case LIST_TYPE : 
			//make_list_for_list((struct list_head *)prime_obj, head);
			break;
		case HASHTABLE_TYPE	: 
			//make_list_for_hashtable((struct hashtable *)prime_obj, head);
			break;
		case BTREE_TYPE : 
			make_list_for_btree((struct btree_head *)prime_obj, head);
			break;
		default :
			printf("Wrong type(%d) passed!\n", type);
	}
}

void main(void)
{
	int num;

	num = 0;
	printf("num : %d\n", num);
}
