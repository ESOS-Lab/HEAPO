#ifndef LINKED_LIST_HEADER
#define LINKED_LIST_HEADER

#define MENU_0 48
#define MENU_1 49
#define MENU_2 50
#define MENU_3 51
#define MENU_4 52
#define MENU_5 53
#define MENU_6 54
#define MENU_7 55
#define MENU_8 56
#define MENU_9 57
#define MAX 255

typedef struct ListNode
{
	unsigned short tag;
	int data;
	struct ListNode *link;

}ListNode;

typedef struct ListHead
{
	ListNode *Header;

}ListHead;


ListHead* CreateList(void);
void AddNode(ListHead *L);
void PrintList(ListHead *L);
void InsertNode(ListHead *L, int tag);
void DeleteNode(ListHead *L, int tag);
void ResetList(ListHead *L);
void SwapNodes(ListHead *L, int node_1, int node_2);
void ReverseList(ListHead *L);
#endif
