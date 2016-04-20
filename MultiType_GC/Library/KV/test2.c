#include <stdio.h>
#include <pos-lib.h>

#define FN "sfj923r"

struct Node
{
	struct Node *next;
	int key;
};

int main(void)
{
	struct Node *head=NULL;
	struct Node *node1=NULL, *node2=NULL, *node3=NULL;
	struct Node *cur_node=NULL;

	pos_create(FN);

	head = (struct Node *)pos_malloc(FN, sizeof(struct Node));
	head->next =NULL;
	head->key = 1;
	node1 = (struct Node *)pos_malloc(FN, sizeof(struct Node));
	node1->next = NULL;
	node1->key = 2;
	node2 = (struct Node *)pos_malloc(FN, sizeof(struct Node));
	node2->next = NULL;
	node2->key = 3;
	node3 = (struct Node *)pos_malloc(FN, sizeof(struct Node));
	node3->next = NULL;
	node3->key = 4;

	head->next = node1;
	node1->next = node2;
	node2->next = node3;

	cur_node = head;
	while(cur_node != NULL) {
		printf("cur key : %d\n", cur_node->key);
		cur_node = cur_node->next;
	}

	printf("next : %p, key : %d\n", node1->next, node1->key);
	pos_free(FN, node1);
	printf("\n");
	node1 = (struct Node *)pos_malloc(FN, sizeof(struct Node));
	//node1->next = NULL;
	//node1->key = 10;
	printf("next : %p, key : %d\n", node1->next, node1->key);

	cur_node = head;
	while(cur_node != NULL) {
		printf("cur key : %d\n", cur_node->key);
		cur_node = cur_node->next;
	}

	return 0;
}
