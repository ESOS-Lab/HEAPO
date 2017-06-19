/*
        Persistent Object Store

        Author: Seongbae Son (afireguy@hanynag.ac.kr)
        Embedded Software Systems Laboratory, Hanyang University


        [INIT HASH] 부분 : 객체 저장소에서 사용하는 자료구조의 Init 함수를 호출(List : pos_list_init(),
                                hashtable : pos_create_hashtable(), btree : pos_btree_init()),
                                내부적으로 pos_create() 함수 호출
        [MAP POS] 부분 : pos_list_init(), pos_create_hashtable(), pos_btree_init() 함수에서 pos_create() 이 후
                                pos_unmap()을 통해 해당 객체 저장소를 매핑 해지 하기 때문에 
                                pos_map()을 통해 해당 프로세스에 다시 매핑
        [INSERT HASH NODES] 부분 : 프로그램 실행 시 입력 받은 개수만큼의 노드 생성
        [MAKE GARBAGES] 부분 : 프로그램 실행 시 입력 받은 개수만큼의 가비지 생성
        [INSERT HASH ADDITIONAL NODES] 부분 : Local GC의 트리거를 위해 추가 노드 삽입
        [UNMAP POS] 부분 : 매핑한 객체 저장소를 매핑 해지
        [FINISH PROGRAM] 부분 : 테스트 프로그램 종료
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pos-lib.h>
#include <pos-hashtable.h>
#include <pos-hashtable_private.h>
#include <alloc_list.h>

#define POS_DEBUG_HASH_TEST	1

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
	int num_of_garbage = 0;

	strcpy(TEST_OBJ_NAME, argv[1]);
	num_of_garbage = atoi(argv[2]);

#if POS_DEBUG_HASH_TEST == 1
	printf("[INIT HASH]\n");
#endif
	if(pos_create_hashtable(TEST_OBJ_NAME, 10, NULL, NULL) < 0) {
		printf("error of creating object storage!\n");
		return 0;
	}

  	syscall(307, TEST_OBJ_NAME, &obj_type, &obj_size, &key_num, &val_num);

#if POS_DEBUG_HASH_TEST == 1
	printf("[MAP POS]\n");
#endif
	pos_map(TEST_OBJ_NAME);

#if POS_DEBUG_HASH_TEST == 1
	printf("[INSERT HASH NODES]\n");
#endif
	srand(time(NULL));
	//prime_num1 = 193;
	prime_num1 = 97;
	//prime_num1 = 769;
	for(i=0; i<(num_of_garbage/2); i++) {
		tmp_val[0] = tmp_val[1] = rand()%10000+9999;
		tmp_key[0] = tmp_key[1] = prime_num1 * i;
		if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)tmp_key, (void *)tmp_val, 8)) {
			printf("insertion failed!\n");
		}
		a++;
#if POS_DEBUG_HASH_TEST == 1
		printf("[USER] INSERT[%d]\n", a);
#endif
	}
	for(i=0; i<41-(num_of_garbage/2); i++) {
		tmp_val[0] = tmp_val[1] = rand()%10000+9999;
		tmp_key[0] = tmp_key[1] = prime_num1 * i + 1;
		if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)tmp_key, (void *)tmp_val, 8)) {
			printf("insertion failed!\n");
		}
		a++;
#if POS_DEBUG_HASH_TEST == 1
		printf("[USER] INSERT[%d]\n", a);
#endif
	}

#if POS_DEBUG_HASH_TEST == 1
	printf("[MAKE GARBAGES]\n");
#endif
	head = NULL;
	pos_hashtable_remove2(TEST_OBJ_NAME, 0);
	//pos_hashtable_unlink_chain(TEST_OBJ_NAME, 0);

#if POS_DEBUG_HASH_TEST == 1
	printf("[INSERT HASH ADDITIONAL NODES]\n");
#endif
	a=0;
	for(i=0; i<22; i++) {
		for(j=0; j<2; j++) {
			val[a] = tmp_val[0] = tmp_val[1] = rand()%10000+9999;
			tmp_key[0] = tmp_key[1] = j + (prime_num2*i);
			key[a] = tmp_key[0];
			if(pos_hashtable_insert(TEST_OBJ_NAME, (void *)tmp_key, (void *)tmp_val, 8)) {
				printf("insertion failed!\n");
			}
#if POS_DEBUG_HASH_TEST == 1
			printf("[USER] INSERT[%d]\n", a);
#endif
			++a;
		}
	}

#if POS_DEBUG_HASH_TEST == 1
	printf("[FINISH PROGRAM]\n");
#endif

	return 0;
}	
