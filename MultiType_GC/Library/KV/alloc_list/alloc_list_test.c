#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "alloc_list.h"

int main(void)
{
  Node *head=NULL, *cur_node, *next_node;
  int i;
  unsigned long num=0;
  unsigned long arr[10];

  srand(time(NULL));
  for(i=0; i<100; i++) {
	num = rand()%9000000+1000000;
	insert_node(&head, num);
	if(i%10 == 0) {
		if(i == 0)
			arr[0] = num;
		else
			arr[i/10] = num;
	}
  }
  
  for(i=0; i<9; i++) {
	if(!delete_node(&head, arr[i]))
		printf("delete error!\n");
  }
  
  display(head);

  remove_list(head);

  return 0;
}
