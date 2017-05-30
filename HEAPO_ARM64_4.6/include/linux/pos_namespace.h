/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/

// POS name space was implemented by using burst trie data structure.
// The container is list data structure.


#ifndef _LINUX_POS_NAMESPACE_H
#define _LINUX_POS_NAMESPACE_H


#include <linux/pos.h>

#define POS_ARRAY_LENGTH		92	// 35~126 in ASCII
#define POS_ARRAY_INDEX		34

// heuristics
#define POS_NS_RATIO			65	// BST: 45, list: 65
#define POS_NS_RATIO_ACCESS	100
#define POS_NS_LIMIT			16	//35	// 100 or 35
#define POS_NS_TREND_CAPITAL	5000
#define POS_NS_TREND_BONUS	4
#define POS_NS_TREND_PENALTY	32

#define POS_NS_TRUE				1
#define POS_NS_FALSE			0


struct pos_ns_record
{
	int str_length;
	char *str;
	struct pos_task_pid *task_list;	// This points volatile struct.
	struct pos_descriptor *desc;
	struct pos_ns_record *next;
};


struct pos_ns_container
{
	struct pos_ns_record *head;	// list data structure
	int cnt_accesses;
	int cnt_direct_hits;
	int cnt_limit;
	int cnt_capital;
};


struct pos_ns_trie_node
{
	int depth;			// depth field must be first one in this structure.
	unsigned long ptrs[POS_ARRAY_LENGTH];
};


extern struct pos_ns_record *pos_ns_search(struct pos_ns_trie_node *root, 
			const char *str, int str_length);
extern struct pos_ns_record *pos_ns_insert(struct pos_ns_trie_node *root,
			const char *str, int str_legnth);
extern struct pos_ns_record *pos_ns_delete(struct pos_ns_trie_node *root,
			const char *str, int str_length);
//extern void pos_ns_display_node(struct pos_ns_trie_node *prev_trie, int depth);


#endif /* _LINUX_POS_NAMESPACE_H */

