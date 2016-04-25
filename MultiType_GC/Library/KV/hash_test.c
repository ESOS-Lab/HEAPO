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
	int i, j, a=0;
	unsigned long val[10000], tmp_val[2];
	unsigned long key[10000], tmp_key[2];
	Node *head=NULL;
	char TEST_OBJ_NAME[100] = {0, };
	int count=0;
	int obj_type=3;
  int obj_size=40;
  int key_num=2;
  int val_num=2;
	int num_type = 0;
	int prime_num1, prime_num2;
	int loop_num = 0;

	strcpy(TEST_OBJ_NAME, argv[1]);
	num_type = atoi(argv[2]);

	switch(num_type)
	{
		case 10 : prime_num1 = 53; prime_num2 = 97; loop_num = 10; break;						// for 10 nodes freed
		case 50 : prime_num1 = 389; prime_num2 = 769; loop_num = 50; break;					// for 50 nodes freed
		case 100 : prime_num1 = 769; prime_num2 = 1543; loop_num = 100; break;			// for 100 nodes freed
		case 200 : prime_num1 = 1543; prime_num2 = 3079; loop_num = 200; break;			// for 200 nodes freed
		case 1000 : prime_num1 = 6151; prime_num2 = 12289; loop_num = 1000; break;	// for 1000 nodes freed
		default :
			printf("wrong prime number type!\n");
			return 0;
	}

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
	for(i=0; i<loop_num; i++) {
		for(j=0; j<3; j++) {
			val[a] = tmp_val[0] = tmp_val[1] = rand()%10000+9999;
			tmp_key[0] = tmp_key[1] = j + (prime_num1*i);
			key[a] = tmp_key[0];
			//printf("key[%d] : %lu, val[%d] : %lu\n", a, key[a], a, val[a]);
			if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)tmp_key, (void *)tmp_val, 8)) {
				printf("insertion failed!\n");
			}
			printf("[USER] INSERT[%d]\n", a);
			++a;
		}
	}

	printf("[MAKE HASHTABLE]\n");
	make_list_for_hashtable2(TEST_OBJ_NAME, &head);
	printf("[HASHTABLE PRINT]\n");
	display(head);

	printf("[DELETE SOME NODES]\n");
	head = NULL;
	pos_hashtable_remove2(TEST_OBJ_NAME, 0);
	
	printf("[PRINT ALLOC LIST AFTER DELETE]\n");
	make_list_for_hashtable2(TEST_OBJ_NAME, &head);
	display(head);
	remove_list(head);
	printf("\n");
	
	printf("[INSERT HASHTABLE NODES AGAIN]\n");
	for(i=0; i<loop_num; i++) {
		for(j=0; j<3; j++) {
			val[a] = tmp_val[0] = tmp_val[1] = rand()%10000+9999;
			tmp_key[0] = tmp_key[1] = j + (prime_num2*i);
			key[a] = tmp_key[0];
			//printf("key[%d] : %lu, val[%d] : %lu\n", a, key[a], a, val[a]);
			if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)tmp_key, (void *)tmp_val, 8)) {
				printf("insertion failed!\n");
			}
			printf("[USER] INSERT[%d]\n", a);
			++a;
		}
	}
	/*
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
	*/

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
