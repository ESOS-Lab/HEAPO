#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include <pos-btree.h>
#include <alloc_list.h>

int main(int argc, char *argv[])
{
	int i, j;
	unsigned long num[10000][2];
	unsigned long key[10000][2];
	Node *head=NULL;
	char TEST_OBJ_NAME[100] = {0, };	
	unsigned long del_addr;
  int count=0;
  int obj_type=2;
  int obj_size=120;
  int key_num=5;
  int val_num=5;

	strcpy(TEST_OBJ_NAME, argv[1]);
  count = atoi(argv[2]);

	printf("[INIT BTREE]\n");
	if(pos_btree_init(TEST_OBJ_NAME) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}

	printf("obj_type = %d\n", obj_type);
  syscall(307, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);	

	printf("[MAP POS]\n");
	pos_map(TEST_OBJ_NAME);

	printf("[INSERT BTREE NODES]\n");	
	srand(time(NULL));	
	for(i=0; i<count; i++) {
		for(j=0; j<2; j++) {
			num[i][j] = rand()%1000+500;
		}
		key[i][0] = key[i][1] = 30000+i;
		printf("before insert\n");
		if(pos_btree_insert(TEST_OBJ_NAME, (void *)key[i], (void *)num[i], 8) < 0) {
			printf("insertion failed!\n");
		}
		printf("[USER] INSERT[%d]\n\n", i);
	}

	printf("[PRINT ALLOC LIST BEFORE DELETE]\n");
	make_list_for_btree2(TEST_OBJ_NAME, &head);
	display(head);
	remove_list(head);
	
	printf("[DELETE FEW NODES]\n");

	del_addr = get_node_addr(head, get_list_num(head)/2);
	printf("del addr : %p\n", (void *)del_addr);
	//*del_addr = 0;
	//memset((void *)del_addr, 0, 120);
	pos_free(TEST_OBJ_NAME, (void *)del_addr);
	
	del_addr = get_node_addr(head, get_list_num(head)/3);
	printf("del addr : %p\n", (void *)del_addr);
	//*del_addr = 0;
	//memset((void *)del_addr, 0, 120);
	pos_free(TEST_OBJ_NAME, (void *)del_addr);
	
	del_addr = get_node_addr(head, get_list_num(head)/4);
	printf("del addr : %p\n", (void *)del_addr);
	//*del_addr = 0;
	//memset((void *)del_addr, 0, 120);
	pos_free(TEST_OBJ_NAME, (void *)del_addr);

/*
	for(i=0; i<count; i++) {
		if(i != 0 && i%10 == 0) {
			printf("delete %d\n", i);
			pos_btree_remove2(TEST_OBJ_NAME, (void *)key[i]);	
		}
	}
*/
	printf("[PRINT ALLOC LIST AFTER DELETE]\n");
	head = NULL;
	make_list_for_btree2(TEST_OBJ_NAME, &head);
	display(head);
	remove_list(head);

	printf("[DISTROY BTREE]\n");
	pos_btree_destroy(TEST_OBJ_NAME);

	printf("[FINISH PROGRAM]\n");

	return 0;
}
