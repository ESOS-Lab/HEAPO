/* 
		Author : Seongbae Son
		Embedded Software System Laboratory, Hanyang University

		This is the program to make the number of process by second input and each to make each process, create a pos for pos_list and make garbage, and unmap the pos in order to trigger SFGC of HEAPO.
		input : base_object_name number_of_process count
		exampe : object 20 100
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <pos-lib.h>
#include <pos-list.h>

int main(int argc, char *argv[])
{
	int i, j;
	int count = 0;
	char child_argv[5][100];
	char tmp[2] = {0, };
	pid_t child_pid[20];
	pid_t pid, tpid;
	
	printf("child path : %s\n", CHILD_PATH);
	printf("base name : %s, count : %s\n", argv[1], argv[2]);
	
	for(i=0; i<20; i++)
	{
		child_pid[i] = pid = fork();
		if(pid == 0)
			break;
		printf("[parent] pid : %d\n", pid);
	}

	if(pid < 0)
		printf("fork failed!\n");
	else if(pid == 0) {
		printf("[child] pid : %d\n", (int)getpid());
		sprintf(tmp, "%d", i);
		strcpy(child_argv[0], CHILD_PATH);
		strcpy(child_argv[1], argv[1]); 
		strcpy(child_argv[1], tmp);
		strcpy(child_argv[2], argv[2]);
		execve(argv[1], child_argv);
	}

	if(pid > 0) {
		for(i=0; i<20; i++) {
			do {
				tpid = wait((int *) 0);
				printf("is completed\n");
			}while(child_pid[i] != tpid);
		}
	}
	
	return 0;
}
