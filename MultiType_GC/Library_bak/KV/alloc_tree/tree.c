#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>
#include "tree.h"
 
 
int compare(unsigned long e1, unsigned long e2)
{
    //return strcmp(e1.word, e2.word);
	return (e1 == e2)? 0 : (e1 > e2)? 1 : -1;
}
 
//이진탐색트리출력함수중위순회로구만
void display(TreeNode *p)
{
    if(p != NULL){
        printf("(");
        display(p->left);
        //printf("%s", p->key.word);
		printf("%lu", p->addr);
        display(p->right);
        printf(")");
    }
}
//이진탐색트리탐색함수
TreeNode *search(TreeNode *root, unsigned long key)
{
    TreeNode *p= root;
    while(p != NULL){
        switch(compare(key, p->addr)){
            case -1:
				//printf("-1 : %s : %s\n", p->key.word, p->key.meaning);
                p = p->left;
                break;
            case 0:
				//printf("0 : %s : %s\n", p->key.word, p->key.meaning);
                return p;
            case 1:
				//printf("1 : %s : %s\n", p->key.word, p->key.meaning);
                p = p->right;
                break;
        }
    }
    return p;    //탐색에실패했을경우NULL을반환
}
//key를이진탐색트리root에삽입한다.
//key가이미root안에있으면삽입되지않는다.
void insert_node(TreeNode **root, unsigned long key)
{
    TreeNode *p, *t;    //p는부모노드t는자식노드
    TreeNode *n;        //n은새로운노드
 
    t = *root;
    p = NULL;
    //탐색을먼저수행
    while(t != NULL){
        if(compare(key, t->addr)==0) return;
        p = t;
        if(compare(key, t->addr)==-1)
            t = t->left;
        else t = t->right;
    }
    //item이트리안에없으므로삽입가능
    n = (TreeNode *)malloc(sizeof(TreeNode));
    if(n == NULL) return;
    //데이터복사
    n->addr = key;
    n->left = n->right = NULL;
    //부모노드와링크연결
    if(p != NULL)
        if(compare(key,p->addr)<0)
            p->left = n;
        else
            p->right = n;
    else *root = n;
}
//삭제함수
int delete_node(TreeNode **root, unsigned long key)
{
    TreeNode *p, *child, *succ, *succ_p, *t;
    //key를갖는노드t를탐색, p는t의부모노드
    p = NULL;
    t = *root;
 
    while(t != NULL && compare(t->addr, key) != 0){
        p = t;
        t = (compare(key, t->addr)<0)?t->left:t->right;
    }
    if(t == NULL){//탐색트리에없는키
        //printf("key is not in the tree");
        //return;
				return KEY_NOT_FOUND;
    }
    //단말노드인경우
    if((t->left == NULL) &&(t->right == NULL)){
        if(p != NULL){
            if(p->left == t)
                p->left = NULL;
            else
                p->right = NULL;
        }
        else    //부모노드가없으면루트
            *root = NULL;
    }
    //하나의자식만가지는경우
    else if((t->left == NULL)||(t->right == NULL)){
        child = (t->left != NULL)? t->left:t->right;
        if(p != NULL){
            if(p->left == t)    //부모노드를자식노드와연결
                p->left = child;
            else p->right = child;
        }
        else *root = child;
    }
    else{//두개의자식을가지는경우
        //오른쪽서브트리에서후속자를찾는다.
        succ_p = t;
        succ = t->right;
        //후속자를찾아서계속왼쪽으로이동한다.
        while(succ->left != NULL){
            succ_p = succ;
            succ = succ->left;
        }
        //후속자의부모와자식을연결
        if(succ_p->left == succ)
            succ_p->left = succ->right;
        else
            succ_p->right = succ->right;
        //후속자를현재노드로이동한다.
        t->addr = succ->addr;
        t = succ;
    }
    free(t);

		return KEY_FOUND;
}
