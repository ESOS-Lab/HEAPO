#ifndef	__TREE_H__
#define	__TREE_H__

#define	KEY_NOT_FOUND	0
#define	KEY_FOUND			1
 
//노드의구조
struct TreeNode{
    unsigned long addr;
    struct TreeNode *left, *right;
};
typedef struct TreeNode TreeNode;
 
void display(TreeNode *p);
TreeNode *search(TreeNode *root, unsigned long key);
void insert_node(TreeNode **root, unsigned long key); 
int delete_node(TreeNode **root, unsigned long key);

#endif // __TREE_H__
