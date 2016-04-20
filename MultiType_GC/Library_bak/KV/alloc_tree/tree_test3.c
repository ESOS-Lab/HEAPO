#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

int main(int argc, char *argv[])
{
    char command;
    unsigned int e;
    TreeNode *root = NULL;
    TreeNode *tmp;
		int i, num_of_nodes;
		unsigned int *parr = NULL;

		num_of_nodes = atoi(argv[1]);
		printf("num of nodes inputed : %d\n", num_of_nodes);

		parr = malloc(sizeof(unsigned int)*num_of_nodes);

		srand(time(NULL));
		for(i=0; i<num_of_nodes; i++) {
			e = rand()%9000000+1000000;
			insert_node(&root, e);
			parr[i] = e;
			printf("e(%u) is inserted!\n", e);
		}
		sleep(5);

		for(i=0; i<num_of_nodes; i++) {
			e = parr[i];
			if(!delete_node(&root, e))
				printf("key(%u) is not in the tree\n", e);
			else
				printf("e(%u) is deleted!\n", e);
		}

		free(parr);
		printf("program is completed!\n");
}
