/*
	Persistent Object Store

	Author: Seongbae Son (afireguy@hanynag.ac.kr)
	Embedded Software Systems Laboratory, Hanyang University

* [INIT LIST] 부분 : object storage에서 사용하는 자료구조의 init 함수를 호출(list : pos_list_init(),
*			hashtable : pos_create_hashtable(), btree : pos_btree_init()), 내부적으로 pos_create() 함수 호출
*	[MAP POS] 부분 : pos_list_init(), pos_create_hashtable(), pos_btree_init() 함수에서 pos_create() 이 후
*			pos_unmap()을 통해 해당 객체 저장소를 매핑 해지 하기 때문에 pos_map()을 통해 해당 프로세스에 다시 매핑
*	[INSERT LIST NODES] 부분 : 사용하는 자료구조의 insert 함수를 이용하여 랜덤한 key값 및 value 값 삽입
*			(20개 및 100개 테스트)
*	[MAKE 사용자료구조 ] 부분 : make_list_for_list(), make_list_for_hashtable(), make_list_for_btree() 함수를
*			호출하여 insert에 따라 생성된 노드들을 allocation list를 생성하고 allocation list에 삽입
*	[사용자료구조 PRINT] 부분 : allocation list(정렬된)에 있는 모든 노드들이 가지는 addr 출력
*	[DELETE FEW NODES] 부분 : 사용하고 있는 자료구조 내에서 몇 개의 노드들을 pos_free()로 할당 해지하여 가비지 생성
*	[MAKE 사용자료구조2] 부분 : 가비지 생성에 따른 또다른 allocation list 구성
*	[사용자료구조2 PRINT] 부분 : 두 번째 allocation list에 있는 모든 노드들이 가지는 addr 출력(가비지 생성 전과 후 비교)
*	[DISTROY 사용자료구조] 부분 : object storage에 할당 받은 모든 노드들 할당 해지
*	[FINISH PROGRAM] 부분 : allocation list, allocation list2 할당 해지
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include <pos-list.h>
#include <alloc_list.h>

int main(int argc, char *argv[])
{
	int i, j;
	unsigned long num[100000][2];
	unsigned long key[2];
	unsigned long del_addr;
	Node *head=NULL, *head2=NULL;
	struct list_node *ln=NULL;
	int obj_type=1;
  int obj_size=32;
  int key_num=2;
  int val_num=2;
	char TEST_OBJ_NAME[100] = {0, };
	int count=0;
	int garbage_idx = 0;

	strcpy(TEST_OBJ_NAME, argv[1]);
	count = atoi(argv[2]);
	garbage_idx = atoi(argv[3]);

	printf("[INIT LIST]\n");
	if(pos_list_init(TEST_OBJ_NAME) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}
	//printf("node size = %lu\n", sizeof(struct list_node));

	//printf("obj_type = %d\n", obj_type);
  syscall(307, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);

	printf("[MAP POS]\n");
	pos_map(TEST_OBJ_NAME);
	printf("[INSERT LIST NODES]\n");	
	srand(time(NULL));
	
	for(i=0; i<count; i++) {
		for(j=0; j<2; j++) {
			num[i][j] = rand()%10000+99999;
		}
		key[0] = key[1] = rand()%100+1;
		if(pos_list_insert(TEST_OBJ_NAME, (void *)key, (void *)num[i], 8) < 0) {
			printf("insertion failed!\n");
		}
		printf("[USER] insert check[%d]\n", i);
	}

	head = NULL;
	//make_list_for_list2(TEST_OBJ_NAME, &head);
	//printf("[PRINT ALLOC LIST BEFORE DEL]\n");
	//display(head);
	//remove_list(head);
	printf("[PRINT LIST BEFORE DEL]\n");
	print_list(TEST_OBJ_NAME);
	pos_delete_selected_node(TEST_OBJ_NAME, garbage_idx);

//	printf("[PRINT LIST AFTER DEL]\n");
//	print_list(TEST_OBJ_NAME);

	for(i=0; i<count; i++) {
		for(j=0; j<2; j++) {
			num[count+i][j] = rand()%10000+99999;
		}
		key[0] = key[1] = rand()%100+1;
		if(pos_list_insert(TEST_OBJ_NAME, (void *)key, (void *)num[i+count], 8) < 0) {
			printf("insertion failed!\n");
		}
		printf("[USER] insert check[%d]\n", i);
	}

//	printf("[PRINT ALLOC LIST BEFORE FINISH PROGRAM]\n");
//	head = NULL;
//	make_list_for_list2(TEST_OBJ_NAME, &head);
//	display(head);
//	remove_list(head);

	printf("[DISTROY LIST]\n");
	//pos_list_destroy(TEST_OBJ_NAME);

	printf("[FINISH PROGRAM]\n");

	return 0;
}	
