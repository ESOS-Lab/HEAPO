/*
	Persistent Object Store

	Author: Seongbae Son (afireguy@hanynag.ac.kr)
	Embedded Software Systems Laboratory, Hanyang University

	This interfaces is for list sorted in ascending order by addr of struct node and used for making alloction list used to local GC
*/

#ifndef	__ALLOC_LIST_H__
#define	__ALLOC_LIST_H__

struct node
{
  unsigned long addr;
  struct node *next;
};
typedef struct node Node;

int insert_node(Node **head, unsigned long addr);
int delete_node(Node **head, unsigned long addr);
void display(Node *head);
int get_list_num(Node *head);
unsigned long get_node_addr(Node *head, int idx);
void remove_list(Node *head);

#endif	// __ALLOC_LIST_H__
