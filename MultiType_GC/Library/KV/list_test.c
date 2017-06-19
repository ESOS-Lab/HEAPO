/*
        Persistent Object Store

        Author: Seongbae Son (afireguy@hanynag.ac.kr)
        Embedded Software Systems Laboratory, Hanyang University


        [INIT LIST] 부분 : 객체 저장소에서 사용하는 자료구조의 Init 함수를 호출(List : pos_list_init(),
                                hashtable : pos_create_hashtable(), btree : pos_btree_init()),
                                내부적으로 pos_create() 함수 호출
        [MAP POS] 부분 : pos_list_init(), pos_create_hashtable(), pos_btree_init() 함수에서 pos_create() 이 후
                                pos_unmap()을 통해 해당 객체 저장소를 매핑 해지 하기 때문에 
                                pos_map()을 통해 해당 프로세스에 다시 매핑
        [INSERT LIST NODES] 부분 : 프로그램 실행 시 입력 받은 개수만큼의 노드 생성
        [MAKE GARBAGES] 부분 : 프로그램 실행 시 입력 받은 개수만큼의 가비지 생성
        [INSERT LIST ADDITIONAL NODES] 부분 : Local GC의 트리거를 위해 추가 노드 삽입
        [UNMAP POS] 부분 : 매핑한 객체 저장소를 매핑 해지
        [FINISH PROGRAM] 부분 : 테스트 프로그램 종료
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include <pos-list.h>
#include <alloc_list.h>

#define POS_DEBUG_LIST_TEST	1

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

#if POS_DEBUG_LIST_TEST == 1
	printf("[INIT LIST]\n");
#endif
	if(pos_list_init(TEST_OBJ_NAME) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}

  	syscall(307, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);
#if POS_DEBUG_LIST_TEST == 1
	printf("[MAP POS]\n");
#endif
	pos_map(TEST_OBJ_NAME);

#if POS_DEBUG_LIST_TEST == 1
	printf("[INSERT LIST NODES]\n");
#endif
	srand(time(NULL));	
	for(i=0; i<count; i++) {
		for(j=0; j<2; j++) {
			num[i][j] = rand()%10000+99999;
		}
		key[0] = key[1] = rand()%100+1;
		if(pos_list_insert(TEST_OBJ_NAME, (void *)key, (void *)num[i], 8) < 0) {
			printf("insertion failed!\n");
		}
#if POS_DEBUG_LIST_TEST == 1
		printf("[USER] insert check[%d]\n", i);
#endif
	}

	head = NULL;
#if POS_DEBUG_LIST_TEST == 1
	printf("[MAKE GARBAGES]\n");
#endif
	pos_delete_selected_node(TEST_OBJ_NAME, garbage_idx-1);

#if POS_DEBUG_LIST_TEST == 1
	printf("[INSERT LIST ADDITIONAL NODES]\n");
#endif
	for(i=0; i<50; i++) {
		for(j=0; j<2; j++) {
			num[count+i][j] = rand()%10000+99999;
		}
		key[0] = key[1] = rand()%100+1;
		if(pos_list_insert(TEST_OBJ_NAME, (void *)key, (void *)num[i+count], 8) < 0) {
			printf("insertion failed!\n");
		}
#if POS_DEBUG_LIST_TEST == 1
		printf("[USER] insert check[%d]\n", i);
#endif
	}

#if POS_DEBUG_LIST_TEST == 1	
	printf("[DISTROY LIST]\n");
#endif
	//pos_list_destroy(TEST_OBJ_NAME);

#if POS_DEBUG_LIST_TEST == 1 
	printf("[FINISH PROGRAM]\n");
#endif

	return 0;
}	
