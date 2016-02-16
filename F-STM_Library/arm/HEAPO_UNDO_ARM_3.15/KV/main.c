/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "workload_list.h"
#include "btree/pos-btree.h"
#include "hashtable/pos-hashtable.h"
#include "list/pos-list.h"
#include "v7_pmu.h"

#define	FREQ_NUM	4				// insert 4 : delete 1

#define	BTREE		1
#define	HASH		2
#define	LIST		3

int32_t perf_event[]={
        0x60, 0x61, 0x62, 0x66, 0x67, 0x81
	//      0x61, 0x61, 0x61, 0x61, 0x61, 0x61
};

void pmu_start(void);
void pmu_stop(void);

int kv_type;

int init_experiment(char *store_name, unsigned long rec_num);
int terminate_experiment(char *store_name);
int do_experiment(struct list *list, char *store_name, unsigned long rec_num,
			unsigned long rec_size, int op);

struct function_ptr {
	int (*open_func)(char *);
	void (*close_func)(char *);
	int (*insert_func)(char *, void *, void *, unsigned long);
	void *(*lookup_func)(char *, void *);
	int (*remove_func)(char *, void *);
};

struct function_ptr *func_ptr;
unsigned long *value;

int main(int argc, char *argv[])
{
	struct list list;
	char *store_name = "kvstore1";
	unsigned long rec_num, rec_size;
	int rval;

	if (argc != 5) {
		printf("Argument error! ./main test_type record_num record_size kv_type\n");
		return 0;
	}
	//store_name = argv[6];

	rec_num = (unsigned long)atoi(argv[2]);
	if (rec_num <= 0 ) {
		printf("[POS] record num argument error!\n");
		return 0;
	}
	rec_num *= 10000;
	
	rec_size = atoi(argv[3]);
	if (rec_size <= 0 ) {
		printf("[POS] record size argument error!\n");
		return 0;
	}
	value = (unsigned long *)malloc(rec_size);

	func_ptr = (struct function_ptr *)malloc(sizeof(struct function_ptr));
	if (strcmp(argv[4], "btree") == 0) {
		kv_type = BTREE;
		func_ptr->open_func = pos_btree_open;
		func_ptr->close_func = pos_btree_close;
		func_ptr->insert_func = pos_btree_insert;
		func_ptr->lookup_func = pos_btree_lookup;
		func_ptr->remove_func = pos_btree_remove;
	} else if (strcmp(argv[4], "hash") == 0) {
		kv_type = HASH;
		func_ptr->open_func = pos_hashtable_open;
		func_ptr->close_func = pos_hashtable_close;
		func_ptr->insert_func = pos_hashtable_insert;
		func_ptr->lookup_func = pos_hashtable_search;
		func_ptr->remove_func = pos_hashtable_remove;
	} else if (strcmp(argv[4], "list") == 0) {
		kv_type = LIST;
		func_ptr->open_func = pos_list_open;
		func_ptr->close_func = pos_list_close;
		func_ptr->insert_func = pos_list_insert;
		func_ptr->lookup_func = pos_list_lookup;
		func_ptr->remove_func = pos_list_remove;
	} else {
		printf("[POS] KV type argument error!\n");
		return 0;
	}
	
	if (init_experiment(store_name, rec_num) != 1) {
		printf("[POS] init_experiment() fail!\n");
		return 0;
	}

	//if (func_ptr->open_func(store_name) != 0) {
	//	printf("[POS] pos_open() fail\n");
	//	return 0;
	//}
	
	if (strcmp(argv[1], "separate") == 0) {
		rval = list_from_file(&list, rec_num, "workload_insert.txt");
		if (rval != rec_num) {
			printf("list_from_file() error!\n");
			return 0;
		}

		printf("[POS] Insert Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, INSERT);

		printf("[POS] Lookup Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, LOOKUP);

		printf("[POS] Delete Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, DELETE);
		
		delete_list(&list);
	} else if (strcmp(argv[1], "update") == 0) {
		rec_num += rec_num/FREQ_NUM;
		rval = list_from_file(&list, rec_num, "workload_update.txt");
		if (rval != rec_num) {
			printf("list_from_file() error!\n");
			return 0;
		}
		
		printf("[POS] Update Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, UPDATE);
		
		delete_list(&list);
	}
	
	pos_btree_destroy(store_name);
	free(value);
	free(func_ptr);
	if (terminate_experiment(store_name) != 1) {
		printf("[POS] terminate_experiment() fail!\n");
		return 0;
	}
	return 0;
}


int init_experiment(char *store_name, unsigned long rec_num)
{
	switch(kv_type) {
		case BTREE:
			if (pos_btree_init(store_name) != 0) {
				printf("[POS] pos_btree_init() fail\n");
				return 0;
			}
			break;
		case HASH:
			if (pos_create_hashtable(store_name, rec_num, NULL, NULL) != 0) {
				printf("[POS] pos_create_hashtable() fail\n");
				return 0;
			}
			break;
		case LIST:
			if (pos_list_init(store_name) != 0) {
				printf("[POS] pos_lit_init() fail\n");
				return 0;
			}
			break;
	};
	return 1;
}

int terminate_experiment(char *store_name)
{
	switch(kv_type) {
		case BTREE:
			if (pos_btree_destroy(store_name) != 0) {
				printf("[POS] pos_btree_destroy() fail!\n");
			}
			break;
		case HASH:
			if (pos_hashtable_destroy(store_name) != 0) {
				printf("[POS] pos_hashtable_destroy() fail!\n");
			}
			break;
		case LIST:
			if (pos_list_destroy(store_name) != 0) {
				printf("[POS] pos_list_destroy() fail!\n");
			}
			break;
	};
	return 1;
}

int do_experiment(struct list *list, char *store_name, unsigned long rec_num,
			unsigned long rec_size, int op)
{
	struct timespec stamp_s, stamp_e;
	unsigned long tv_sec, tv_nsec;
	struct node *node;
	unsigned long key[2];
	//unsigned long *value;
	unsigned long cnt, i;

	if (func_ptr->open_func(store_name) != 0) {
		printf("[POS] pos_open() fail\n");
		return 0;
	}

	//value = (unsigned long *)malloc(rec_size);
	node = list->head;
	cnt = 1;
	
	printf("gettime\n") ;
	clock_gettime(CLOCK_REALTIME, &stamp_s);
	while (node) {

		key[0] = key[1] = node->key;
		
		switch (op) {
			case INSERT:
				for (i=0; i<rec_size/8; i++) {
					value[i] = rec_num + node->key;
				}
				if (func_ptr->insert_func(store_name, key, value, rec_size) != 0) {
					printf("[POS] pos_insert() fail");
					return 0;
				}
				break;
				
			case LOOKUP:
				value = (unsigned long *)func_ptr->lookup_func(store_name, key);
				if (value == NULL) {
					printf("[POS] pos_lookup() fail\n");
					return 0;
				} //else { //insert & lookup test
				//	if (value[0] != rec_num + node->key) {
				//		printf("[POS] pos_lookup(), wrong value!\n");
				//		return 0;
				//	}
				//}
				break;
				
			case DELETE:
				if (func_ptr->remove_func(store_name, key) != 0) {
					printf("[POS] pos_remove() fail\n");
					return 0;
				}
				break;

			case UPDATE:
				if (cnt%(FREQ_NUM+1) == 0) {
					if (func_ptr->remove_func(store_name, key) != 0) {
						printf("[POS] update: pos_remove() fail\n");
						return 0;
					}
				} else {
					for (i=0; i<rec_size/8; i++) {
						value[i] = rec_num + node->key;
					}
					if (func_ptr->insert_func(store_name, key, value, rec_size) != 0) {
						printf("[POS] update: pos_insert() fail\n");
						return 0;
					}
				}
				//pos_@_retrieval(store_name); // test
				break;
				
			default:
				printf("Wrong operation!\n");
				return 0;
				//break;
		}


		if (cnt == rec_num)
			break;
		
		node = node->next;
		cnt++;
	}
	clock_gettime(CLOCK_REALTIME, &stamp_e);

	tv_sec = stamp_e.tv_sec - stamp_s.tv_sec;
	if (stamp_e.tv_nsec < stamp_s.tv_nsec) {
		stamp_e.tv_nsec += 1000000000;
		tv_sec--;
	}
	tv_nsec = stamp_e.tv_nsec - stamp_s.tv_nsec;
	printf("[POS] Experiment Time (sec=%lu, nsec=%lu)\n", tv_sec, tv_nsec);

	//free(value);
	func_ptr->close_func(store_name);
	return cnt-1;
}


void pmu_start(void)
{
    enable_pmu();              // Enable the PMU
    ccnt_divider(0);
    reset_ccnt();              // Reset the CCNT (cycle counter)
    reset_pmn();               // Reset the configurable counters
    pmn_config(0, perf_event[0]);       // Configure counter 0 to count event code 0x03
    pmn_config(1, perf_event[1]);       // Configure counter 1 to count event code 0x03
    pmn_config(2, perf_event[2]);       // Configure counter 2 to count event code 0x03
    pmn_config(3, perf_event[3]);       // Configure counter 3 to count event code 0x03
    pmn_config(4, perf_event[4]);       // Configure counter 4 to count event code 0x03
    pmn_config(5, perf_event[5]);       // Configure counter 5 to count event code 0x03

    enable_ccnt();             // Enable CCNT
    enable_pmn(0);             // Enable counter
    enable_pmn(1);             // Enable counter
    enable_pmn(2);             // Enable counter
    enable_pmn(3);             // Enable counter
    enable_pmn(4);             // Enable counter
    enable_pmn(5);             // Enable counter
}


void pmu_stop(void){
  unsigned int cycle_count, overflow, counter0, counter1, counter2, counter3, counter4, counter5;

      disable_ccnt();            // Stop CCNT
      disable_pmn(0);            // Stop counter 0
      disable_pmn(1);            // Stop counter 1
      disable_pmn(2);            // Stop counter 2
      disable_pmn(3);            // Stop counter 3
      disable_pmn(4);            // Stop counter 4
      disable_pmn(5);            // Stop counter 5

      counter0 = read_pmn(0); // Read counter 0
      counter1 = read_pmn(1); // Read counter 1
      counter2 = read_pmn(2); // Read counter 2
      counter3 = read_pmn(3); // Read counter 3
      counter4 = read_pmn(4); // Read counter 4
      counter5 = read_pmn(5); // Read counter 5
      cycle_count = read_ccnt(); // Read CCNT
      overflow=read_flags();        //Check for overflow flag
      printf("%d\t%d %d %d %d %d %d\n", cycle_count/667, counter0/667, counter1/667, counter2/667 ,counter3/667,counter4/667,counter5/667);
 
 	if(overflow)
        printf("Warning Overflow Occured\n");
																																		                                                             // printf("Overflow: %d, Cycle Count: %d \n\n", overflow,cycle_count);
};

