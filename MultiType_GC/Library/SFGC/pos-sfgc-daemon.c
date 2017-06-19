/*
 	Persistent Object Store

	Author: Seongbae Son (afireguy@hanynag.ac.kr)
 	Embedded Software Systems Laboratory, Hanyang University

 	This program is the SFGC daemon. It is executed every 5 seconds as default and the interval can be adjusted by changing the value, SFGC_INTERVAL.
	by 손성배
*/

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

#define POS_DEBUG_SFGC	1
#define SFGC_INTERVAL	5

int main(void)
{
	pid_t pid, sid; //process id / session id
	char **obj_storage_names = NULL;
	int i = 0;
#if POS_DEBUG_SFGC == 1
	int sfgc_cnt = 0;
	struct timeval T1, T2;
#endif
	
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

        if ((chdir("/")) < 0)   //directory change 
        {
                exit(EXIT_FAILURE);
        }
        
        close(STDIN_FILENO); //close standard file descriptor
        close(STDOUT_FILENO);
        close(STDERR_FILENO);


	obj_storage_names = (char **)malloc(sizeof(char*)*10);
	for(i=0; i<10; i++)
		obj_storage_names[i] = (char *)malloc(sizeof(char)*128);

	//i = 0;
	while (1)
	{
		//sys_pos_get_sfgc_list(obj_storage_name);
		syscall(309, obj_storage_names);

#if POS_DEBUG_SFGC == 1
		gettimeofday(&T1, NULL);
#endif
		for(i=0; i<10; i++) {
			if(obj_storage_names[i][0] != 0) {
				pos_map(obj_storage_names[i]);
				pos_local_gc(obj_storage_names[i]);
			}
		}
#if POS_DEBUG_SFGC == 1
		gettimeofday(&T2, NULL);
		print_time(T1, T2);
		printf("(cnt : %d)sfgc triggered!\n", sfgc_cnt);
		sfgc_cnt++;
#endif
		sleep(SFGC_INTERVAL);
	}

	exit(EXIT_SUCCESS);
}
