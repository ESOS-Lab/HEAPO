#include <stdio.h>
#include <pos-lib.h>

int main(void)
{
	int *a, *b;
	int *a2, *b2;

	pos_create("objectAAAAB");
	pos_create("objectBBBBC");

	a = pos_malloc("objectAAAAB", sizeof(int));
	b = pos_malloc("objectBBBBC", sizeof(int));

	a2 = pos_malloc("objectAAAAB", sizeof(int));
	b2 = pos_malloc("objectBBBBC", sizeof(int));

	printf("a : %p, b : %p\n", a, b);
	printf("a2 : %p, b2 : %p\n", a2, b2);

	return 0;
}
