#include "pos-lib.h"
#include <stdio.h>
#include <stdio_ext.h>
#include "linkedlist.h"

extern int TAG;


int main(void)
{
	if(pos_create("linkedlist_obj") < 1){ 
		if(pos_map("linkedlist_obj") < 1){
			return 0;
		} 
	}

	ListHead *L;
	unsigned char menu = MENU_1;
	int node_1, node_2, temp;
	int ch;

	L = CreateList();
	
	
	do
	{
		//ch = getch();
	//printf("%d\n",ch);




		puts("--------------------");
		puts("|       MENU       |");
		puts("|     1.Add        |");
		puts("|     2.Delete     |");
		puts("|     3.Insert     |");
		puts("|     4.Swap       |");
		puts("|     5.Reverse    |");
		puts("|     6.Print      |");
		puts("|     7.Reset      |");
		puts("|     0.Exit       |");
		puts("--------------------");		
		printf("Node counter : %d\n", TAG);
		printf("Choose : ");
			scanf("%c",&menu);

				switch(menu)
				{	
					
					case MENU_1 : 
								AddNode(L);	
					break;

					case MENU_2 : 
						printf("Select a node to delete : ");
						scanf("%d",&node_1);
						if((node_1 > 0) && (node_1 <= TAG ))
						{
							DeleteNode(L, node_1);
						}else	printf("Check the Node Counter.\n");
						
						break;

					case MENU_3 :
						printf("Select a node to insert :");
						scanf("%d",&node_1);
						if((node_1 > 0) && (node_1 <= TAG ))
						{
							InsertNode(L, node_1);
						}else	printf("Check the Node Counter.\n");
						break;

					case MENU_4 : 
						printf("Choose two nodes to switch positions....\n");
						printf("Node 1 : ");
						scanf("%d",&node_1);
						fflush(stdin);
						printf("Node 2 : ");
						scanf("%d",&node_2);

						if(node_1+node_2 > 1){

							if(node_1 == node_2)
							{ 
								printf("They are same nodes\n");
							}
							else if((node_1 > TAG) || (node_2 > TAG))
							{
								printf("Check the node counter\n");

							}else if(node_1 > node_2)
							{
								SwapNodes(L, node_2, node_1);
							}
							else
							{
								SwapNodes(L, node_1, node_2);
							}
						}else printf("Node 0 doesnt exist\n");
	
						break;

					case MENU_5 : ReverseList(L);
						break;

					case MENU_6 : PrintList(L);
						break;

					case MENU_7 : ResetList(L);			break;

					case MENU_0 : printf("Good Bye!\n"); return 0;

					default : printf("GGGGGGGGGGGGGGGG"); break;

				}//end of switch case
				__fpurge(stdin);
				getchar();
				system("clear");

		}while(1);//end of while


	return 0;
}
