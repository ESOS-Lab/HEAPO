/*
	Persistent Object Store

	Author: Seongbae Son (afireguy@hanynag.ac.kr)
	Embedded Software Systems Laboratory, Hanyang University

	This interfaces is for list sorted in ascending order by addr of struct node and used for making alloction list used to local GC
*/

#include <stdio.h>
#include <stdlib.h>
#include "alloc_list.h"

/*
struct node
{
  unsigned long addr;
  struct node *next;
};
typedef struct node Node;
*/

/*
* Node *make_node(unsigned long addr)
* 입력 값 : 리스트 노드의 키 값(현재 순회 중인 자료구조의 현재 탐색된 노드의 주소)
* 출력 값 : 새로 할당 및 초기화된 리스트 노드의 주소(입력 받은 주소 값을 addr로 입력 후 반환)
*/
Node *make_node(unsigned long addr)
{
  Node *new_node=NULL;

  new_node = (Node *)malloc(sizeof(Node));
  new_node->next = NULL;
  new_node->addr = addr;

  return new_node;
}

/*
* int insert_node(Node **head, unsigned long addr)
* 입력 값 	
*		head : 리스트의 head 노드(head를 위한 자료구조를 따로 만들지 않고 Node 자료구조의 *head가 리스트의 첫 번째 노드를 가리키도록 구현함.
*			즉, head는 노드가 추가될 때마다 변경될 수 있기 때문에 *head의 주소인 **head로 전달)
*		addr : 현재 탐색된 노드의 시작 주소
* 출력 값 : 제대로 노드 추가 시 '1' 반환, 그렇지 않으면 '-1' 반환
*/
int insert_node(Node **head, unsigned long addr)
{
  Node *new_node=NULL, *cur_node=NULL;

  new_node = make_node(addr);
	printf("current addr - 0x%lx\n", addr);
  if(*head == NULL || addr < (*head)->addr) {
    new_node->next = *head;
    *head = new_node;
  } else {
    cur_node = *head;
    while(cur_node->next != NULL && cur_node->next->addr <= addr) {
      cur_node = cur_node->next;
    }   
    if(cur_node->next == NULL) {
      cur_node->next = new_node;
    } else {
      if(cur_node->next->addr == addr)
        return -1; 
        
	   new_node->next = cur_node->next;
	   cur_node->next = new_node;
    }   
  }
}

/*
* int delete_node(Node **head, unsigned long addr)
* 입력 값
*		head : 리스트의 head 노드
*		addr : 리스트에서 삭제할 노드의 addr
* 출력 값 : 제대로 삭제 시 '1' 반환, 그렇지 않으면 '-1' 반환
*/
int delete_node(Node **head, unsigned long addr)
{
		Node *cur_node=*head, *prev_node=NULL;

		while(cur_node != NULL && cur_node->addr != addr) {
			prev_node = cur_node;
			cur_node = cur_node->next;
		}
		if(cur_node == NULL)
			return 0;
		if(cur_node == *head)
			*head = cur_node->next;
		else
			prev_node->next = cur_node->next;

		printf("current node(0x%lx) is deleted!\n", cur_node->addr);
		free(cur_node);

		return 1;
}

/*
* void display(Node *head)
* 입력 값
*		head : 리스트의 head 노드
*	출력 값 : 없음
* 기능 : 리스트에 있는 모든 노드들의 addr 출력
*/
void display(Node *head)
{
	Node *cur_node = head;
	int i=0;

	while(cur_node->next != NULL) {
		printf("[%d]current node - 0x%lx\n", i++, cur_node->addr);
		cur_node = cur_node->next;
	}
}

/*
* int get_list_num(Node *head)
* 입력 값
*		head : 리스트의 head 노드
* 출력 값 : 없음
* 기능 : 리스트에 있는 모든 노드들의 addr 출력
*/
int get_list_num(Node *head)
{
	int count=0;
	Node *cur_node=NULL;

	cur_node = head;
	while(cur_node != NULL) {
		cur_node = cur_node->next;
		count++;
	}

	return count;
}

/*
* unsigned long get_node_addr(Node *head, int idx)
* 입력 값	
*		head : 리스트의 head 노드
*		idx : 탐색할 리스트의 노드 인덱스
* 출력 값 : 리스트에서 idx 번째 노드의 addr
* 기능 : 테스트 프로그램에서 반환된 주소 값을 pos_free() 함수로 해지 시키기 위해 구현(gargabe 생성을 위해)
*/
unsigned long get_node_addr(Node *head, int idx)
{
	int i;
	Node *cur_node=NULL;

	cur_node = head;
	for(i=0; i<idx; i++)
		cur_node = cur_node->next;

	return cur_node->addr;
}

/*
* void remove_list(Node *head)
* 입력 값 : 리스트의 head 노드
* 출력 값 : 없음
* 기능 : 리스트에서 할당 했던 노드들 모두 해지
*/
void remove_list(Node *head)
{
	Node *next_node=NULL, *cur_node=NULL;

	next_node = head;
	while(cur_node != NULL) {
		cur_node = next_node;
		next_node = next_node->next;
		free(cur_node);
	}
}
