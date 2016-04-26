/* 
    Author : Seongbae Son
    Embedded Software System Laboratory, Hanyang University

		This is the execution program of procs_test in this directory.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <pos-lib.h>
#include <pos-list.h>
#include <alloc_list.h>

int main(int argc, char *argv[])
{
	int i, j;
	unsigned long num[5000][2];
	unsigned long key[5000][2];
	Node *head = NULL;
	int obj_type = 1;
	int obj_size = 32;
	int key_num = 1;
	int val_num = 1;
	char TEST_OBJ_NAME[100] = {0, };
	int count = 0;
	int prog_num = 0;

	strcpy(TEST_OBJ_NAME, argv[1]);
	prog_num = atoi(argv[2]);
	count = atoi(argv[3]);

	TEST_OBJ_NAME[strlen(argv[1])-1] += prog_num;
	printf("[CHILD %d] name : %s, count %d\n", prog_num, TEST_OBJ_NAME, count);

	for(i=0; i<10; i++)
		printf("[CHILD %d] %d\n", prog_num, i);
/*
  printf("[INIT LIST]\n");
  if(pos_list_init(TEST_OBJ_NAME) < 0) {
    printf("error of creating object storage!\n");
    return 0;
  }
  printf("node size = %lu\n", sizeof(struct list_node));

  printf("obj_type = %d\n", obj_type);
  syscall(307, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);

  printf("[MAP POS]\n");
  pos_map(TEST_OBJ_NAME);
  printf("[INSERT LIST NODES]\n");  
  srand(time(NULL));

  count = atoi(argv[2]);  
  for(i=0; i<count; i++) {
    for(j=0; j<2; j++) {
      num[i][j] = rand()%10000+99999;
    }   
    key[0] = key[1] = rand()%100+1;
    if(pos_list_insert(TEST_OBJ_NAME, (void *)key, (void *)num[i], 8) < 0) {
      printf("insertion failed!\n");
    }   
    printf("\n[USER] insert check[%d]\n", i); 
  }
*/	
	
	return 0;
}
