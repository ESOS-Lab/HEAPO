#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <syslog.h>
#include <string.h>
#include <pos-lib.h>
#include <sys/time.h>

struct timeval acc_T;

void print_time(struct timeval T1 , struct timeval T2)  
{ 
	long sec,usec;
	double time;
	double rate;
	time_t t;

	if(T1.tv_usec > T2.tv_usec)
	{     
		sec = T2.tv_sec - T1.tv_sec -1;
		acc_T->tv_sec += sec; 
		usec = 1000000 + T2.tv_usec - T1.tv_usec;
		acc_T->tv_usec += usec;
	} else {
		sec = T2.tv_sec - T1.tv_sec;
		acc_T->tv_sec += sec;
		usec = T2.tv_usec - T1.tv_usec;
		acc_T->tv_usec += usec;
	}
	time = (double)sec + (double)usec/1000000;
	printf("Current Object store  Exec Time :%6ld sec %06ldus\n",sec,usec);
}

int main(void)
{
	pid_t pid, sid; //process id / session id
	char **obj_storage_names = NULL;
	char *cur_name = NULL;
	int i = 0;
	int sfgc_cnt = 0;
	struct timeval T1, T2;
	long sec, usec;

#if DAEMON_MODE
	pid = fork();

	if (pid < 0)
	{
		exit(EXIT_FAILURE);
	}

	if (pid > 0)
	{
		exit(EXIT_SUCCESS);
	}
        
	umask(0); //file mode mask
        
	sid = setsid(); //new SID for child process
	if (sid < 0)
	{
		exit(EXIT_FAILURE); //failure log
	}

	if ((chdir("/")) < 0)	//directory change 
	{
		exit(EXIT_FAILURE);
	}
        
	close(STDIN_FILENO); //close standard file descriptor
	close(STDOUT_FILENO);
	close(STDERR_FILENO);
#endif
	
	obj_storage_names = (char **)malloc(sizeof(char*)*10);
	for(i=0; i<10; i++)
		obj_storage_names[i] = (char *)malloc(sizeof(char)*128);

	i = 0;
	while (1)
	{
		//sys_pos_get_sfgc_list(obj_storage_name);
		syscall(309, obj_storage_names);
		
		gettimeofday(&T1, NULL);
		for(i=0; i<10; i++) {
			printf("cur name : %s, len : %d\n", obj_storage_names[i], strlen(obj_storage_names[i]));
			if(obj_storage_names[i][0] != 0) {
				printf("[POS MAP]\n");
				pos_map(obj_storage_names[i]);
				printf("[GC START] %s\n", obj_storage_names[i]);
				pos_local_gc(obj_storage_names[i]);
				printf("[SFGC] current gc exec time \n");
				printf("[GC END] %s\n", obj_storage_names[i]);
			}
		}
		gettimeofday(&T2, NULL);
		print_time(T1, T2);	
		printf("(cnt : %d)sfgc triggered!\n", sfgc_cnt);
		sfgc_cnt++;
		sleep(5);
	}

	exit(EXIT_SUCCESS);
}
