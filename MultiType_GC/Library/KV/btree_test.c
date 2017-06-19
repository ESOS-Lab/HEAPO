/*
        Persistent Object Store

        Author: Seongbae Son (afireguy@hanynag.ac.kr)
        Embedded Software Systems Laboratory, Hanyang University


        [INIT BTREE] 부분 : 객체 저장소에서 사용하는 자료구조의 Init 함수를 호출(List : pos_list_init(),
                                hashtable : pos_create_hashtable(), btree : pos_btree_init()),
                                내부적으로 pos_create() 함수 호출
        [MAP POS] 부분 : pos_list_init(), pos_create_hashtable(), pos_btree_init() 함수에서 pos_create() 이 후
                                pos_unmap()을 통해 해당 객체 저장소를 매핑 해지 하기 때문에 
                                pos_map()을 통해 해당 프로세스에 다시 매핑
        [INSERT BTREE NODES] 부분 : 프로그램 실행 시 입력 받은 개수만큼의 노드 생성
        [MAKE GARBAGES] 부분 : 프로그램 실행 시 입력 받은 개수만큼의 가비지 생성
        [INSERT BTREE ADDITIONAL NODES] 부분 : Local GC의 트리거를 위해 추가 노드 삽입
        [UNMAP POS] 부분 : 매핑한 객체 저장소를 매핑 해지
        [FINISH PROGRAM] 부분 : 테스트 프로그램 종료
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include <pos-btree.h>
#include <alloc_list.h>

#define POS_DEBUG_BTREE_TEST	1

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
	int garbage_count = 0;
	int a=0;

	strcpy(TEST_OBJ_NAME, argv[1]);
  	count = atoi(argv[2]);
	garbage_count = atoi(argv[3]);
	
	if(pos_btree_init(TEST_OBJ_NAME) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}

  	syscall(307, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);	
#if POS_DEBUG_BTREE_TEST == 1
	printf("[POS MAP]\n");
#endif
	pos_map(TEST_OBJ_NAME);

#if POS_DEBUG_BTREE_TEST == 1
	printf("[INSERT BTREE NODES]\n");
#endif
	srand(time(NULL));	
	for(i=0; i<count; i++) {
		for(j=0; j<2; j++) {
			num[i][j] = rand()%1000+500;
		}
		key[i][0] = key[i][1] = 30000+i;
		if(pos_btree_insert(TEST_OBJ_NAME, (void *)key[i], (void *)num[i], 8) < 0) {
			printf("insertion failed!\n");
		}
#if POS_DEBUG_BTREE_TEST == 1
		printf("[USER] INSERT[%d]\n", i);
#endif
	}

#if POS_DEBUG_BTREE_TEST == 1
	printf("[MAKE GARBAGES]\n");
#endif
	unlink_leaf_nodes(TEST_OBJ_NAME, garbage_count);
	head = NULL;

#if POS_DEBUG_BTREE_TEST == 1
	printf("[INSERT BTREE ADDITIONAL NODES]\n");
#endif
	a = i;
	for(i=0; i<43; i++) {
		for(j=0; j<2; j++) {
			num[i][j] = rand()%1000+500;
		}
		key[i][0] = key[i][1] = 30000+a;
		if(pos_btree_insert(TEST_OBJ_NAME, (void *)key[i], (void *)num[i], 8) < 0) {
			printf("insertion failed!\n");
		}
#if POS_DEBUG_BTREE_TEST == 1
		printf("[USER] INSERT[%d]\n", i);
#endif
		a++;
	}

	pos_unmap(TEST_OBJ_NAME);

#if POS_DEBUG_BTREE_TEST == 1
	printf("[FINISH PROGRAM]\n");
#endif

	return 0;
}
