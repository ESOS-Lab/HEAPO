#include <stdio.h>

void static_test(void);

int test = 1;

int main(void){

	
	int i = 0;

	while(i < 1000){

		static_test();
		i++;
		printf("%d\n", test);	
	}


	return 0;
}

void static_test(void){
	
	static int test = 0;

	printf("%d\n", test);
}
