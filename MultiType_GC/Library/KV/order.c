/* 이건우 작성 */

#include <stdio.h>
#include <stdlib.h>
#include "tree.h"
#include "list/pos-list.h"
#include "btree/pos-btree.h"
#include "hashtable/pos-hashtable.h"
#include "hashtable/pos-hashtable_private.h"

#define LIST_TYPE				0
#define HASHTABLE_TYPE	1
#define	BTREE_TYPE			2

int make_tree_for_list(struct list_head *lh, TreeNode **root)
{
	struct list_node *cur_node;

	if(lh == NULL || root == NULL)
		return 0;

	cur_node = lh->head;
	/* repeat while next node is not NULL */
	while(cur_node != NULL) {
		/* insert current node's address in the alloc tree */
		insert_node(root, (unsigned long)cur_node);
		printf("cur_node's addr(%lu) is inserted in alloc tree\n", (unsigned long)cur_node);
		cur_node = cur_node->next;
	}

	return 1;
}

int make_tree_for_hashtable(struct hashtable *h, TreeNode **root)
{
	return 1;
}

int make_tree_for_btree(struct btree_head *head, TreeNode **root)
{
	return 1;
}

int make_alloc_tree(TreeNode **root, void *prime_obj, int type)
{
	switch(type) {
		case LIST_TYPE : 
			make_tree_for_list((struct list_head *)prime_obj, root);
			break;
		case HASHTABLE_TYPE	: 
			make_tree_for_hashtable((struct hashtable *)prime_obj, root);
			break;
		case BTREE_TYPE : 
			make_tree_for_btree((struct btree_head *)prime_obj, root);
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
