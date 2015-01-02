/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/

#ifndef WORKLOAD_LIST_H
#define WORKLOAD_LIST_H


#define INSERT	0
#define DELETE	1
#define LOOKUP	2
#define UPDATE	3

struct node {
	unsigned long key;
	struct node *next;
};

struct list {
	struct node *head;
	struct node *tail;
};

int create_list_bdb(struct list *list, unsigned long cnt);
//int create_list(struct list *list, unsigned long cnt);
int delete_list(struct list *list);
//int change_list_op(struct list *list, int cnt, int op);
//int blend_list(struct list *list, unsigned long cnt);
int add_del_ops(struct list *list, unsigned long cnt, int frequency);
int print_list(struct list *list);
unsigned long list_to_file(struct list *list, char *file_name);
unsigned long list_from_file(struct list *list, unsigned long rec_num, char *file_name);


#endif
