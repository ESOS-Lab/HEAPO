#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include "btree/pos-btree.h"
#include "alloc_list/alloc_list.h"

#define TEST_OBJ_NAME "EobjStoreA"

int main(void)
{
	int i, j;
	unsigned long num[50][2];
	unsigned long key[2];
	unsigned long del_addr;
	Node *head=NULL, *head2=NULL;
	struct btree_head *bh;
	void *prime_obj=NULL;
	
	printf("[INIT BTREE]\n");
	if(pos_btree_init(TEST_OBJ_NAME) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}

	printf("[MAP POS]\n");
	pos_map(TEST_OBJ_NAME);
	printf("[INSERT BTREE NODES]\n");	
	srand(time(NULL));
	
	for(i=0; i<50; i++) {
		for(j=0; j<2; j++) {
			num[i][j] = rand()%1000+500;
		}
		//key[0] = key[1] = rand()%100+1;
		key[0] = key[1] = 10+i;
		printf("before insert\n");
		if(pos_btree_insert(TEST_OBJ_NAME, (void *)key, (void *)(num[i]), 8) < 0) {
			printf("insertion failed!\n");
		}
		printf("insert check[%d]\n", i);
	}

	printf("[MAKE LIST]\n");
	make_list_for_btree(TEST_OBJ_NAME, &head);
	printf("[LIST PRINT]\n");
	display(head);
	
	printf("[DELETE FEW NODES]\n");
	del_addr = get_node_addr(head, get_list_num(head)/2);
	printf("del addr : %p\n", (void *)del_addr);
	pos_free(TEST_OBJ_NAME, (void *)del_addr);
	
	del_addr = get_node_addr(head, get_list_num(head)/3);
	printf("del addr : %p\n", (void *)del_addr);
	pos_free(TEST_OBJ_NAME, (void *)del_addr);
	
	del_addr = get_node_addr(head, get_list_num(head)/4);
	printf("del addr : %p\n", (void *)del_addr);
	pos_free(TEST_OBJ_NAME, (void *)del_addr);

	printf("[MAKE LIST2]\n");
	make_list_for_btree(TEST_OBJ_NAME, &head2);
	printf("[LIST2 PRINT]\n");
	display(head2);

	printf("[DISTROY BTREE]\n");
	pos_btree_destroy(TEST_OBJ_NAME);

	remove_list(head);
	remove_list(head2);
	printf("[FINISH PROGRAM]\n");

	return 0;
}
