/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "db.h"
#include "workload_list.h"

#define	DB_DIRECTORY	"/tmp"

DB *dbp = NULL;
DB_ENV *db_envp = NULL;


/*
# gcc -o workload workload_list.c -ldb
# mkfs.ext4 /dev/ram1
# mount -t ext4 /dev/ram1 /mnt
# ./workload
*/

// main for test and generating workload
/*int main(int argc, char *argv[])
{
	struct list list;
	unsigned long cnt = 10000000;
	int frequency = 4;
	int rval;

	printf("\n----- create_list() -----\n");
	rval = create_list_bdb(&list, cnt);
	//rval = create_list(&list, cnt);
	
	//printf("\n----- blend_list() -----\n");
	//rval = blend_list(&list, cnt);
	rval = list_to_file(&list, "workload_insert.txt");

	printf("\n----- add_del_ops() -----\n");
	rval = add_del_ops(&list, cnt, frequency);
	rval = list_to_file(&list, "workload_update.txt");

	delete_list(&list);

	return 0;
}*/


int init_bdb(char *store_name)
{
	unsigned long env_flags, open_flags;;
	int rval;

	env_flags = DB_CREATE|DB_INIT_MPOOL;

	if (db_env_create(&db_envp, 0) != 0) {
		printf("[BDB] db_env_create() fail!\n");
		return 0;
	}

	rval = db_envp->set_cachesize(db_envp, 0, 1024*1024*1024, 1);	// 0G + 1024M
	if (db_envp->open(db_envp, DB_DIRECTORY, env_flags, 0) != 0) {
		printf("[BDB] db_env->open() fail!\n");
		db_envp->close(db_envp, 0);
		return 0;
	}

	if(db_create(&dbp, db_envp, 0) != 0) {
		printf("[BDB] db_create() fail!\n");
		return 0;
	}
	
	open_flags = DB_CREATE;
	rval = dbp->open(dbp, NULL, store_name, NULL, DB_BTREE, open_flags, 0);
	if (rval != 0) {
		printf("[BDB] db->open() fail!\n");
		return 0;
	}
	
	return 1;
}

int terminate_bdb(char *store_name)
{
	//db_env->close(db_env, 0);

	dbp->close(dbp, 0);
	/*if (db->remove(db, store_name, NULL, 0) != 0) {
		printf("[BDB] db->remove() fail!\n");
		return 0;
	}*/
	return 1;
}

int create_list_bdb(struct list *list, unsigned long rec_num)
{
	struct node *node, *tail;
	unsigned long cnt, i;
	int rval;
	DBT key, value;
	unsigned long tmp_key;
	unsigned long tmp_value;

	
	if (list == NULL || cnt <=0 ) return 0;

	rval = init_bdb("workload.db");
	
	memset(&key, 0, sizeof(DBT));
	memset(&value, 0, sizeof(DBT));

	key.data = &tmp_key;
	key.size = 8;
	value.data = &tmp_value;
	value.size = 8;
	value.ulen = 8;
	value.flags = DB_DBT_USERMEM;

	srand((int)time(NULL));
	
	node = (struct node *)malloc(sizeof(struct node));

	tmp_key = rand(); //RAND_MAX==2,147,483,647
	tmp_value = tmp_key;
	if (dbp->put(dbp, NULL, &key, &value, DB_NOOVERWRITE) != 0) {
		printf("[BDB] first db->put() error!\n");
		return 0;
	}
	node->key = tmp_key;
	
	node->next = NULL;
	list->head = node;
	list->tail = node;
	cnt = 1;
	
	while (1) {
		node = (struct node *)malloc(sizeof(struct node));

		while (1) {
			tmp_key = rand(); //RAND_MAX==2,147,483,647
			tmp_value = tmp_key;
			if (dbp->put(dbp, NULL, &key, &value, DB_NOOVERWRITE) == 0) {
				break;
			}
		}
		node->key = tmp_key;

		node->next = NULL;

		tail = list->tail;
		tail->next = node;
		list->tail = node;

		cnt++;
		if (cnt == rec_num)
			break;

		if (cnt%10000 == 0)
			printf("cnt=%ld\n", cnt);
	}

	rval = terminate_bdb("workload.db");
	return 1;
}


/*// 1~cnt 키값을 갖는 리스트 생성
int create_list(struct list *list, unsigned long cnt)
{
	struct node *node, *tail;
	unsigned long i;

	if (list == NULL || cnt <=0 ) return 0;
	
	node = (struct node *)malloc(sizeof(struct node));
	node->key = (unsigned long)1;
	node->next = NULL;
	list->head = node;
	list->tail = node;
	
	for (i=2; i<cnt+1; i++) {
		node = (struct node *)malloc(sizeof(struct node));
		node->key = (unsigned long)i;
		node->next = NULL;

		tail = list->tail;
		tail->next = node;
		list->tail = node;
	}

	return 1;
}*/


//리스트의 노드들을 해제
int delete_list(struct list *list)
{
	struct node *target, *next;

	if (list == NULL ) return 0;
	
	target = list->head;
	if (target == NULL)
		return 1;

	do {
		next = target->next;
		free(target);
		target = next;
	} while (target);

	list->head = list->tail = NULL;

	return 1;
}


//리스트의 op를 변경
/*int change_list_op(struct list *list, int cnt, int op)
{
	struct node *node;

	if (list == NULL || cnt <=0 ) return 0;
	if (!(op == INSERT || op == DELETE || op == LOOKUP)) return 0;
	
	node = list->head;
	while (node) {
		node->op = op;
		node = node->next;
	}

	return 1;
}*/


//리스트를 섞음 (정렬의 반대)
/*int blend_list(struct list *list, unsigned long cnt)
{
	struct node **prev, *target, *tail;
	unsigned long index;
	unsigned long i, j;

	if (list == NULL || cnt <=0) return 0;

	srand((int)time(NULL));
	
	for (i=0; i<cnt; i++) {
		//cnt-i 중에서 타겟 노드 선택
		index = rand()%(cnt-i); //RAND_MAX==2,147,483,647
		
		//타겟 노드 찾아감
		prev = &(list->head);
		target = list->head;
		for (j=0; j<index ; j++) {
			prev = &(target->next);
			target = target->next;
			//if (target == NULL) return 0;
		}

		//타겟 노드를 리스트에서 제거
		*prev = target->next;
		target->next = NULL;
		
		//타겟 노드를 리스트의 맨 뒤로 보냄
		tail = list->tail;
		tail->next = target;
		list->tail = target;

		//if (i%1000 == 0)
		//	printf("%d\n", i);
	}

	return 1;
}*/


 //주기적으로 del op인 노드를 리스트에 추가
int add_del_ops(struct list *list, unsigned long cnt, int frequency)
{
	struct node *f_start, *f_end; //frequency
	struct node *target, *tmp;
	unsigned long index;
	unsigned long i, j;

	if (list == NULL || cnt <=0) return 0;

	//frequency = 4;

	srand((int)time(NULL));

	f_end = list->head;
	f_start = f_end;
	
	for (i=0; i<cnt; i++) {

		if (((i+1)%frequency) == 0) {
			
			// 0~frequecny-1 중에서 타겟 노드 선택
			index = rand()%(frequency);

			target = f_start;
			for (j=0; j<index; j++) {		
				target = target->next;
			}

			tmp = (struct node *)malloc(sizeof(struct node));
			//tmp->op = DELETE;
			tmp->key = target->key;

			//새로운 노드를 삽입
			tmp->next = f_end->next;
			f_end->next = tmp;

			f_start = tmp->next;
			f_end = tmp;
		}
		
		f_end = f_end->next;
		//if (f_end == NULL) return 0;

		//Update tail pointer
	}

	return 1;
}


//리스트의 내용을 보여주는 함수
int print_list(struct list *list)
{
	struct node *node;
	unsigned long cnt;
	
	if (list == NULL) return 0;

	cnt = 1;
	node = list->head;
	while (node) {

		printf("[%lu] key=%lu\n", cnt, node->key);
		
		node = node->next;
		cnt++;
	}

	return 1;
}


unsigned long list_to_file(struct list *list, char *file_name)
{
	FILE *fp;
	struct node *node;
	unsigned long rec_num;
	
	if (list == NULL || file_name == NULL) return 0;
	
	fp = fopen(file_name, "wt");

	rec_num = 0;
	node = list->head;
	while (node) {
		
		fprintf(fp, "%lu\n", node->key);
		
		node = node->next;
		rec_num++;
	}

	fclose(fp);
	return rec_num;
}


unsigned long list_from_file(struct list *list, unsigned long rec_num, char *file_name)
{
	FILE *fp;
	struct node *node, *tail;
	unsigned long cnt;
	
	if (list == NULL || file_name == NULL) return 0;
	
	fp = fopen(file_name, "rt");
	
	if(fp == NULL || feof(fp) != 0){
		printf("file pointer error or no contents\n");
		return 0;
	}/*else if{ 
		printf("file open success\n") ; 	
	}  */
	
	node = (struct node *)malloc(sizeof(struct node));
	fscanf(fp, "%lu\n", &node->key);
	node->next = NULL;
	list->head = node;
	list->tail = node;
	cnt = 1;
	
	while (1) {
		
		if (feof(fp) != 0)
			break;

		node = (struct node *)malloc(sizeof(struct node));
		fscanf(fp, "%lu\n", &node->key);

		node->next = NULL;

		tail = list->tail;
		tail->next = node;
		list->tail = node;
	
		cnt ++;
		if (cnt == rec_num)
			break;
	}

	fclose(fp);
	return cnt;
}

