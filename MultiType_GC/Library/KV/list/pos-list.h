/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
  by 이건우
*/



#ifndef POS_LIST_H
#define POS_LIST_H


#define KEY_SIZE		2

struct list_node {
	unsigned long key[KEY_SIZE];
	unsigned long *value;
	//struct list_node *prev;
	struct list_node *next;
};

struct list_head {
	struct list_node *head;
	//struct list_node *tail;
};

void *get_alloc_head();
void remove_alloc_list();
int pos_list_init(char *name);
int pos_list_destroy(char *name);
int pos_list_open(char *name);
void pos_list_close(char *name);
int pos_list_insert(char *name, void *key, void *val, unsigned long val_size);
void *pos_list_lookup(char *name, void *key);
int pos_list_remove(char *name, void *key);
//int make_list_for_list(struct list_head *lh, Node **head);
//int make_list_for_list2(char *name, Node **head);

#endif
