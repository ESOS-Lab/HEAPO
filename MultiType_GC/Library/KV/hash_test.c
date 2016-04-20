#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include <pos-hashtable.h>
#include <alloc_list.h>
//#include "hashtable/pos-hashtable.h"
//#include "alloc_list/alloc_list.h"

#define TEST_OBJ_NAME "."

int main(void)
{
	int i, j;
	unsigned long num[2];
	unsigned long key[2];
	Node *head=NULL;

	printf("[INIT HASHTABLE]\n");
	if(pos_create_hashtable(TEST_OBJ_NAME, 10, NULL, NULL) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}

	printf("[MAP POS]\n");
	pos_map(TEST_OBJ_NAME);
	printf("[INSERT HASHTABLE NODES]\n");	
	srand(time(NULL));

	for(i=0; i<20; i++) {
		for(j=0; j<2; j++) {
			num[j] = rand()%10000+99999;
		}
		key[0] = key[1] = rand()%100+1;
		if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)key, (void *)num, 8) < 0) {
			printf("insertion failed!\n");
		}
		printf("insert check[%d]\n", i);
	}

	printf("[MAKE HASHTABLE]\n");
	make_list_for_hashtable2(TEST_OBJ_NAME, &head);
	printf("[HASHTABLE PRINT]\n");
	display(head);
	
	printf("[DISTROY HASHTABLE]\n");
	pos_hashtable_destroy(TEST_OBJ_NAME);

	printf("[FINISH PROGRAM]\n");

	return 0;
}	
