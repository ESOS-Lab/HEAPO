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

int main(void)
{
	pid_t pid, sid; //process id / session id
	//char obj_storage_name[10][100] = {0, }; //name buffer
	char **obj_storage_names = NULL;
	char *cur_name = NULL;
	int i = 0;
	int sfgc_cnt = 0;
	char names[10][100] = {" ", "objectA", "objectB", "objectC", "objectD", "objectE", "objectF", "objectG", "objectH", "objectI"};
/*
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
*/
	//strcpy(obj_storage_name[0], "name");
	//cur_name = obj_storage_name[0];
	//if(cur_name[0] == 0)
	//	printf("0\n");
	
	obj_storage_names = (char **)malloc(10);
	for(i=0; i<10; i++)
		obj_storage_names[i] = (char *)malloc(sizeof(char)*128);

	//strcpy(obj_storage_names[0], "namename1");
	//printf("obj 1 : %s\n", obj_storage_names[0]);

	i = 0;
	while (1)
	{
		//sys_pos_get_sfgc_list(obj_storage_name);
		syscall(309, obj_storage_names);
/*
		cur_name = obj_storage_names[i];
		if((int)strlen(cur_name) != 0) {
			printf("[%d] %s\n", i+1, obj_storage_names[i]);
			i++;
			cur_name = obj_storage_names[i];
		}
*/
		for(i=0; i<10; i++) {
			printf("cur name : %s, len : %d\n", obj_storage_names[i], strlen(obj_storage_names[i]));
			printf("cur name : %s\n", names[i]);
			if(obj_storage_names[i][0] != 0) {
				printf("[POS MAP]\n");
				//obj_storage_names[i][strlen(obj_storage_names[i]+1) =
				pos_map(obj_storage_names[i]);
				//pos_map(names[i]);
				printf("[GC START] %s\n", obj_storage_names[i]);
				//pos_local_gc(obj_storage_names[i]);
				pos_local_gc(names[i]);
				printf("[GC END] %s\n", obj_storage_names[i]);
			}
		}
		printf("(cnt : %d)sfgc triggered!\n", sfgc_cnt);
		sfgc_cnt++;
		//sleep(300); //sleep during 5 minutes
		sleep(5);
	}

	exit(EXIT_SUCCESS);
}
