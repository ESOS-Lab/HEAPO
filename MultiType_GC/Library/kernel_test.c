#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pos-lib.h>

#define NAME "objectX"
#define LIST_TYPE 1

int main(void)
{
	pos_create(NAME);
	//pos_map(NAME);
	int obj_type=1;
	int obj_size=32;
	int key_num=2;
	int val_num=2;
	short tmp=0;

	printf("obj_type = %d\n", obj_type);
	syscall(307, NAME, &obj_type, &obj_size, &key_num, &val_num);
	syscall(308, NAME, &tmp);

	printf("object type : %x\n", tmp);	

	return 0;
}
