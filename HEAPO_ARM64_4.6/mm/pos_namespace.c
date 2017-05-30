/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/

// POS name space was implemented by using burst trie data structure.
// The container is list data structre.


#include <linux/sched.h>	// task_pid_nr
#include <linux/pos.h>
#include <linux/pos_namespace.h>
#include <linux/kernel.h>	// printk

#include <asm/string.h>
//#include <asm/tsc.h>	// get_cycles

void pos_ns_insert_record(struct pos_ns_container *container, struct pos_ns_record *record)
{
	// insert to list head
	record->next = container->head;
	container->head = record;

	container->cnt_limit++;	//heuristics
}


void pos_ns_burst(struct pos_ns_trie_node *prev_trie_node, int prev_index)
{
	struct pos_superblock *sb;
	struct pos_ns_trie_node *new_trie_node;
	struct pos_ns_container *burst_cont, *container;
	struct pos_ns_record *record, *next_record;
	char *str;
	int index, count, i;


	sb = pos_get_sb();

	// A new access trie node is created.
	new_trie_node = pos_kmem_cache_alloc(sb->pos_ns_node_struct_cachep, GFP_KERNEL);
	new_trie_node->depth = prev_trie_node->depth + 1;
	for (i=0; i<POS_ARRAY_LENGTH; i++) {
		new_trie_node->ptrs[i] = 0;
	}

	burst_cont = (struct pos_ns_container *)prev_trie_node->ptrs[prev_index];
	prev_trie_node->ptrs[prev_index] = (unsigned long)new_trie_node;

	// Burst the original container.
	count = burst_cont->cnt_limit;
	record = burst_cont->head;
	for (i=0; i<count; i++) {
		next_record = record->next;
		
		// If the record was the empty string.
		if (!record->str_length) {
			new_trie_node->ptrs[0] = (unsigned long)record;
			record->next = NULL;
			record = next_record;
			continue;
		}

		// The leading character is removed from the string.
		str = record->str;
		record->str_length--;
		if (record->str_length) {
			record->str = (char *)pos_kmalloc(record->str_length);
			strncpy(record->str, str+1, record->str_length);
		} else {
			record->str = NULL;
		}

		// The record is added to the container.
		index = (int)str[0]-POS_ARRAY_INDEX;
		if (new_trie_node->ptrs[index]==0) {
			container = pos_kmem_cache_alloc(sb->pos_ns_cont_struct_cachep, GFP_KERNEL);
			container->head = NULL;
			container->cnt_limit = 0;

			new_trie_node->ptrs[index] = (unsigned long)container;
		} else {
			container = (struct pos_ns_container *)new_trie_node->ptrs[index];
		}
		pos_ns_insert_record(container, record);

		pos_kfree(str);
		record = next_record;
	}

	// The original container is discarded.
	burst_cont->head = NULL;
	burst_cont->cnt_limit = 0;
	pos_kmem_cache_free(sb->pos_ns_cont_struct_cachep, burst_cont);
}


int pos_ns_ratio_burst(struct pos_ns_trie_node *trie_node, int index,
		struct pos_ns_container *container)
{
	int ratio;

	if (container->cnt_accesses < POS_NS_RATIO_ACCESS)
		return POS_NS_FALSE;

	ratio = container->cnt_direct_hits * 100;
	ratio /= container->cnt_accesses;

	if (ratio >= POS_NS_RATIO) {
		//pos_ns_burst(trie_node, index);
		return POS_NS_TRUE;
	} else {
		return POS_NS_FALSE;
	}
}


int pos_ns_limit_burst(struct pos_ns_trie_node *trie_node, int index,
		struct pos_ns_container *container)
{
	if (container->cnt_limit > POS_NS_LIMIT) {
		pos_ns_burst(trie_node, index);
		return POS_NS_TRUE;
	} else {
		return POS_NS_FALSE;
	}
}


int pos_ns_trend_burst(struct pos_ns_trie_node *trie_node, int index,
		struct pos_ns_container *container)
{
	if (container->cnt_capital <= 0) {
		//pos_ns_burst(trie_node, index);
		return POS_NS_TRUE;
	} else {
		return POS_NS_FALSE;
	}
}


struct pos_ns_record *pos_ns_search_container(struct pos_ns_container *container,
		int depth, const char *str, int str_length)
{
	struct pos_ns_record *record, **prev_record;
	int count, i;


	container->cnt_accesses++;	// heuristics

	prev_record = &container->head;
	record = container->head;
	count = container->cnt_limit;
	for (i=0; i<count; i++) {
		if ((str_length-depth+1 == record->str_length) &&
				!memcmp(str+depth-1, record->str, record->str_length)) {
				//(strncmp(str+depth-1, record->str, record->str_length) == 0)) {
			// move-to-front list			
			*prev_record = record->next;
			record->next = container->head;
			container->head = record;

			// heuristics
			if (i==0) {
				// direct hits
				container->cnt_direct_hits++;
				container->cnt_capital += POS_NS_TREND_BONUS;
			} else {
				container->cnt_capital -= POS_NS_TREND_PENALTY;
			}

			return record;
		} else {
			prev_record = &record->next;
			record = record->next;
		}
	}

	return NULL;
}


struct pos_ns_record *pos_ns_search(struct pos_ns_trie_node *root,
		const char *str, int str_length)
{
	struct pos_ns_trie_node *trie_node, *prev_node;
	struct pos_ns_container *container;
	struct pos_ns_record *record;

	int *checker;
	int index, depth;

	//unsigned long long start_tick, end_tick;
	//start_tick = get_cycles();

	// The access trie is traversed.
	prev_node = NULL;
	trie_node = root;
	depth = 1;
	while (depth <= str_length) {
		index = (int)str[depth-1]-POS_ARRAY_INDEX;
		prev_node = trie_node;
		trie_node = (struct pos_ns_trie_node *)trie_node->ptrs[index];
		depth++;

		if(trie_node == NULL)
		    return NULL;

		checker = (int *)trie_node;
		// container
		if (*checker != depth) {

			// search the container
			container = (struct pos_ns_container *)trie_node;

			record = pos_ns_search_container(container, depth, str, str_length);

			//end_tick = get_cycles();
			//printk("[POS] lookup time (ticks): %llu\n", end_tick-start_tick);

			// Burst heuristics
			if (pos_ns_ratio_burst(prev_node, index, container))
				return record;
			pos_ns_trend_burst(prev_node, index, container);

			return record;
		}
	}

	//end_tick = get_cycles();
	//printk("[POS] lookup time (ticks): %llu\n", end_tick-start_tick);

	printk("----------------end-----------------\n");
	// empty-string or NULL
	//if (depth == str_length+1) {
	record = (struct pos_ns_record *)trie_node->ptrs[0];
	return record;
	//}
}


struct pos_ns_record *pos_ns_insert(struct pos_ns_trie_node *root,
		const char *str, int str_length)
{
	struct pos_superblock *sb;
	struct pos_ns_trie_node *trie_node, *prev_node;
	struct pos_ns_container *container;
	struct pos_ns_record *record;
	unsigned long *prev_trie_node;
	
	int *checker;
	int index, depth;


	sb = pos_get_sb();

	// The access trie is traversed.
	prev_node = NULL;
	trie_node = root;
	depth = 1;
	while (depth <= str_length) {
		index = (int)str[depth-1]-POS_ARRAY_INDEX;
		prev_node = trie_node;
		prev_trie_node = &trie_node->ptrs[index];
		trie_node = (struct pos_ns_trie_node *)trie_node->ptrs[index];
		depth++;

		// no container or no trie node
		if (trie_node == NULL) {
			goto alloc_container;
		}

		checker = (int *)trie_node;
		//container
		if (*checker != depth) {
			container = (struct pos_ns_container *)trie_node;

			goto insert_record_to_container;
		}
	}

	// empty-string or NULL
	if (trie_node->ptrs[0]) 
		return NULL;

	record = pos_kmem_cache_alloc(sb->pos_ns_rec_struct_cachep, GFP_KERNEL);
	record->str_length = 0;
	record->str = NULL;
	record->task_list = NULL;
	record->desc = NULL;
	record->next = NULL;
	
	trie_node->ptrs[0] = (unsigned long)record;
	return record;

alloc_container:
	container = pos_kmem_cache_alloc(sb->pos_ns_cont_struct_cachep, GFP_KERNEL);
	container->head = NULL;
	container->cnt_accesses = 0;
	container->cnt_direct_hits = 0;
	container->cnt_limit = 0;
	container->cnt_capital = POS_NS_TREND_CAPITAL;

	*prev_trie_node = (unsigned long)container;

insert_record_to_container:
	// duplication check
	if (pos_ns_search_container(container, depth, str, str_length) != NULL)
		return NULL;

	record = pos_kmem_cache_alloc(sb->pos_ns_rec_struct_cachep, GFP_KERNEL);
	record->str_length = str_length - depth + 1;
	if (record->str_length != 0) {
		record->str = (char *)pos_kmalloc(record->str_length);
		strncpy(record->str, str+depth-1, record->str_length);
	} else {
		record->str = NULL;
	}
	record->task_list = NULL;
	record->desc = NULL;
	record->next = NULL;

	pos_ns_insert_record(container, record);

	// Burst heuristics
	if (pos_ns_ratio_burst(prev_node, index, container))
		return record;
	else if (pos_ns_trend_burst(prev_node, index, container))
		return record;
	pos_ns_limit_burst(prev_node, index, container);

	return record;
}


struct pos_ns_record *pos_ns_delete_record(struct pos_ns_container *container,
		int depth, const char *str, int str_length)
{
	struct pos_ns_record **prev_record, *record;
	struct task_struct *task;
	int count, i;

 
	task = current;

	prev_record = &container->head;
	record = container->head;
	count = container->cnt_limit;
	for (i=0; i<count; i++) {
		if ((str_length-depth+1 == record->str_length) &&
				(strncmp(str+depth-1, record->str, record->str_length) == 0)) {
			
			// Deletion is executed when there is only one process which is mapping this object storage and called deletion function.
			//if (record->task_count != 1 || record->task_list->task  != task)
			if (record->task_list->pid_nr != task_pid_nr(task))
				return NULL;

			*prev_record = record->next;
			return record;
		} else {
			prev_record = &record->next;
			record = record->next;
		}
	}

	return NULL;
}


struct pos_ns_record *pos_ns_delete(struct pos_ns_trie_node *root,
		const char *str, int str_length)
{
	struct pos_ns_trie_node *trie_node;
	struct pos_ns_container *container;
	struct pos_ns_record *record;
	unsigned long *prev_trie_node;
	
	struct task_struct *task;
	int *checker;
	int index, depth;

	
	task = current;

	// The access trie is traversed.
	trie_node = root;
	depth = 1;
	while (depth <= str_length) {
		index = (int)str[depth-1]-POS_ARRAY_INDEX;
		prev_trie_node = &trie_node->ptrs[index];
		trie_node = (struct pos_ns_trie_node *)trie_node->ptrs[index];
		depth++;

		// no container or no trie node
		if (trie_node == NULL) {
			return NULL;
		}

		checker = (int *)trie_node;
		//container
		if (*checker != depth) {
			container = (struct pos_ns_container *)trie_node;

			return pos_ns_delete_record(container, depth, str, str_length);
		}
	}

	// empty-string or NULL
	if (!trie_node->ptrs[0])
		return NULL;
	
	record = (struct pos_ns_record *)trie_node->ptrs[0];
	
	// Deletion is executed when there is only one process which is mapping this object storage and called deletion function.
	//if (record->task_count != 1 || record->task_list->task  != task)
	if (record->task_list->pid_nr != task_pid_nr(task))
		return NULL;
	
	trie_node->ptrs[0] = 0;

	return record;
}


//burst와 반대로 trie가 축소되는 과정은 논문에 나와있지 않아서 미구현 상태


// Display the content of trie node for test
/*void pos_ns_display_node(struct pos_ns_trie_node *prev_trie, int depth)
{
	struct pos_ns_trie_node *trie_node;
	struct pos_ns_container *container;
	struct pos_ns_record *record;
	int *checker;
	int i, j;
	int str_length;
	char *str;

	for (i=0; i<POS_ARRAY_LENGTH; i++) {
		trie_node = (struct pos_ns_trie_node *)prev_trie->ptrs[i];
		if (trie_node == NULL)
			continue;
		if (i == 0) {
			printk("[POS] dpeth=%d, character=NULL\n", depth);
			continue;
		} else {
			printk("[POS] depth=%d, character=%c\n", depth, (char)(i+POS_ARRAY_INDEX));
		}
		checker = (int *)trie_node;
		if (*checker != depth+1) {
			container = (struct pos_ns_container *)trie_node;
			record = container->head;
			while(record) {
				printk("[POS] dpeth=%d, character(s)=", depth+1);
				str_length = record->str_length;
				str = record->str;
				if (str_length == 0) {
					printk("NULL");
				} else {
					for (j=0; j<str_length; j++)
						printk("%c", str[j]);
				}
				printk("\n");
				record = record->next;
			}
		} else {
			pos_ns_display_node(trie_node, depth+1);
		}
	}
}*/

