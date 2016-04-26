/*
  Persistent Object Store

  Author: Seongbae Son (afireguy@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University

  This program is to create the number of object store input second with the name according to second input.
	input : ./multi_pos_test objectA 20 100
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
	int i, j, k;
	unsigned long num[5000][2];
	unsigned long key[5000][2];
	Node *head = NULL;
	int obj_type = 1;
	int obj_size = 32;
	int key_num = 1;
	int val_num = 1;
	char pos_name_arr[100][100] = {0, };
	int count = 0;
	int num_of_pos = 0;

	num_of_pos = atoi(argv[2]);
	count = atoi(argv[3]);

	for(i=0; i<num_of_pos; i++) {
		strcpy(pos_name_arr[i], argv[1]);
		pos_name_arr[i][strlen(argv[1])-1] += i;
		printf("[%d]current pos name : %s, count : %d\n", i, pos_name_arr[i], count);
	}

	for(k=0; k<num_of_pos; k++) {
		printf("[PRINT CURRENT POS NAME]\n");
		printf("object store name : %s\n", pos_name_arr[k]);
		printf("[INIT LIST]\n");
		if(pos_list_init(pos_name_arr[k]) < 0) {
			printf("error of creating object storage!\n");
			return 0;
		}
		printf("node size = %lu\n", sizeof(struct list_node));

		printf("obj_type = %d\n", obj_type);
		syscall(307, pos_name_arr[k], &obj_type, &obj_size, &key_num, &val_num);

		printf("[MAP POS]\n");
		pos_map(pos_name_arr[k]);

		printf("[INSERT LIST NODES]\n");  
		srand(time(NULL));	
		for(i=0; i<count; i++) {
			for(j=0; j<2; j++) {
				num[i][j] = rand()%10000+99999;
			}   
			key[i][0] = key[i][1] = rand()%100+1;
			if(pos_list_insert(pos_name_arr[k], (void *)key[i], (void *)num[i], 8) < 0) {
				printf("insertion failed!\n");
			}
			printf("\n[USER] insert check[%d]\n", i); 
		}
		
		printf("[PRINT ALLOC LIST BEFORE DEL]\n");
		head = NULL;
		make_list_for_list2(pos_name_arr[k], &head);
		display(head);
		remove_list(head);

		printf("[PRINT LIST BEFORE DEL]\n");
		print_list(pos_name_arr[k]);

		printf("[DELETE SOME NODES]\n");
		pos_delete_selected_node(pos_name_arr[k], count/2);
		
		printf("[PRINT ALLOC LIST AFTER DEL]\n");
		head = NULL;
		make_list_for_list2(pos_name_arr[k], &head);
		display(head);
		remove_list(head);
		printf("[UNMAP FOR SFGC] %s\n", pos_name_arr[k]);
		pos_unmap(pos_name_arr[k]);
	}

	return 0;
}
