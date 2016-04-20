#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

void help()
{
    printf("**************************\n");
    printf("i: 입력\n");
    printf("d: 삭제\n");
    printf("s: 탐색\n");
    printf("p: 출력\n");
    printf("q: 종료\n");
    printf("**************************\n");
}
void main()
{
    char command;
    unsigned int e;
    TreeNode *root = NULL;
    TreeNode *tmp;
    do{
        help();
        command = getchar();
        fflush(stdin);
        switch(command){
            case 'i':
				printf("input address : ");
				scanf("%u", &e);
                insert_node(&root, e);
                break;
            case 'd':
				scanf("%u", &e);
                if(!delete_node(&root, e))
									printf("key is not in the tree\n");
                break;
            case 'p':
                display(root);
                printf("\n");
                break;
            case 's':
                printf("input address: ");
				scanf("%u", &e);
                tmp=search(root,e);
                if(tmp != NULL)
					printf("주소:%u\n",tmp->addr);
				else
					printf("해당 주소 없음!\n");
                break;
        }
		fflush(stdin);
    }while(command != 'q');
}
