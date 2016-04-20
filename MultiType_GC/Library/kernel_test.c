#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pos-lib.h>

#define NAME "objectA"
#define LIST_TYPE 1

int main(void)
{
	pos_create(NAME);
	//pos_map(NAME);
	short obj_type=0;

	syscall(307, NAME, 1, 0, 0, 0);
	syscall(308, NAME, &obj_type);

	syscall(330, NAME);
//obj_type = 1;
	printf("object type : %d\n", obj_type);	

	return 0;
}
