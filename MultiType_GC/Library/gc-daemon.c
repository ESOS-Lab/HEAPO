#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <syslog.h>
#include <string.h>

int main(void)
{
	pid_t pid, sid; //process id / session id
 	char obj_storage_name[10][POS_NAME_LENGTH]; //name buffer
        int i = 0;

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

        while (1)
	{
	     sys_pos_get_sfgc_list(obj_storage_name);
             sleep(300); //sleep during 5 minutes
        }

   exit(EXIT_SUCCESS);
}
