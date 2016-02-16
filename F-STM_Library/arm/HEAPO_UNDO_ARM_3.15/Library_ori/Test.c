#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

int main (void)
{
	int i;
	int *ptr[1000000];
	int a;
	int second, micro;
	struct timeval start, end;

	pos_create("object1");

	for(i = 0 ; i < 1000000 ; i++)
	{
		ptr[i] = (int *)pos_malloc("object1", 512);
		*ptr[i] = rand() % 100; 
		a = *ptr[i];
	}

	gettimeofday(&start , NULL);
	for(i = 0 ; i < 1000000 ; i++)
	{
		*ptr[i] = rand() % 100;
		a = *ptr[i];
	}
	gettimeofday(&end, NULL);

	second = end.tv_usec - start.tv_usec + ((end.tv_sec - start.tv_sec) * 1000000);
	
	micro = second % 1000000;
	second = second / 1000000;
	
	printf("%d sec, %d usec\n", second, micro); 	

	return 0;
}

