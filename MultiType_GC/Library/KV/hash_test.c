#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include <pos-hashtable.h>
#include <pos-hashtable_private.h>
#include <alloc_list.h>

int main(int argc, char *argv[])
{
	int i, j;
	unsigned long num[10000][2];
	unsigned long key[10000][2];
	Node *head=NULL;
	char TEST_OBJ_NAME[100] = {0, };
	int count=0;
	int obj_type=3;
  int obj_size=40;
  int key_num=2;
  int val_num=2;

	strcpy(TEST_OBJ_NAME, argv[1]);
	count = atoi(argv[2]);
	//printf("entry size : %d\n", sizeof(struct entry));

	printf("[INIT HASHTABLE]\n");
	if(pos_create_hashtable(TEST_OBJ_NAME, 10, NULL, NULL) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}

	printf("obj_type = %d\n", obj_type);
  syscall(307, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);

	printf("[MAP POS]\n");
	pos_map(TEST_OBJ_NAME);

	printf("[INSERT HASHTABLE NODES]\n");	
	srand(time(NULL));
	for(i=0; i<count; i++) {
		for(j=0; j<2; j++) {
			num[i][j] = rand()%10000+99999;
		}
		key[i][0] = key[i][1] = rand()%100+1;
		if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)key[i], (void *)num[i], 8) < 0) {
			printf("insertion failed!\n");
		}
		printf("[USER] INSERT[%d]\n\n", i);
	}

	printf("[MAKE HASHTABLE]\n");
	make_list_for_hashtable2(TEST_OBJ_NAME, &head);
	printf("[HASHTABLE PRINT]\n");
	display(head);

	printf("[DELETE SOME NODES]\n");
	head = NULL;
	for(i=0; i<count; i++) {
		if(i != 0 && i%10 == 0)
			pos_hashtable_remove(TEST_OBJ_NAME, key[i]);	
	}
	printf("[PRINT ALLOC LIST AFTER DELETE]\n");
	make_list_for_hashtable2(TEST_OBJ_NAME, &head);
	display(head);
	remove_list(head);
	printf("\n");
	
	printf("[INSERT HASHTABLE NODES AGAIN]\n");
	for(i=0; i<count; i++) {
		for(j=0; j<2; j++) {
			num[count+i][j] = rand()%10000+99999;
		}
		key[count+i][0] = key[count+i][1] = rand()%100+1;
		if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)key[count+i], (void *)num[count+i], 8) < 0) {
			printf("insertion failed!\n");
		}
		printf("[USER] INSERT[%d]\n\n", i+count);
	}
	
	printf("[PRINT ALLOC LIST BEFORE FINISH PROGRAM]\n");
	head = NULL;
	make_list_for_hashtable2(TEST_OBJ_NAME, &head);
	display(head);
	remove_list(head);
	printf("\n");

	printf("[DISTROY HASHTABLE]\n");
	pos_hashtable_destroy(TEST_OBJ_NAME);

	printf("[FINISH PROGRAM]\n");

	return 0;
}	
