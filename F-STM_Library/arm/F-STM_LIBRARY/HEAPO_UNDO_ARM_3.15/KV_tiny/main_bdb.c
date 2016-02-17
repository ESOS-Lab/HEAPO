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
#include <db.h>

#define	FREQ_NUM	4				// insert 4 : delete 1

#define	BTREE		1
#define	HASH		2
#define	DB_DIRECTORY	"/mnt"

DB *db = NULL;
DB_ENV *db_env = NULL;
int kv_type;
int log_flag = 1;

//void purge_buffer_cache(void);
int init_experiment(char *store_name);
int terminate_experiment(char *store_name);
int do_experiment(struct list *list, char *store_name, unsigned long rec_num,
			unsigned long rec_size, int op);


int main(int argc, char *argv[])
{
	struct list list;
	char *store_name = "kvstore.db";
	unsigned long rec_num, rec_size;
	int rval;
	pthread_t ptid;

	if (argc != 5) {
		printf("Argument error! ./main test_type record_num record_size kv_type\n");
		return 0;
	}
	
	rec_num = (unsigned long)atoi(argv[2]);
	if (rec_num <= 0 ) {
		printf("[POS] record num argument error!\n");
		return 0;
	}
	rec_num *= 10000;
	
	rec_size = atoi(argv[3]);
	if (rec_size <= 0 ) {
		printf("[BDB] record size argument error!\n");
		return 0;
	}

	if (strcmp(argv[4], "btree") == 0) {
		kv_type = BTREE;
	} else if (strcmp(argv[4], "hash") == 0) {
		kv_type = HASH;
	} else {
		printf("[BDB] KV type argument error!\n");
		return 0;
	}

	/*if (strcmp(argv[5], "1") == 0) {
		log_flag = 1;
	} else if (strcmp(argv[5], "0") == 0) {
		log_flag = 0;
	} else {
		printf("[BDB] Log argument error!\n");
		return 0;
	}*/

	if (init_experiment(store_name) != 1) {
		printf("[BDB] init_experiment() fail!\n");
		return 0;
	}
	
	if (strcmp(argv[1], "insert") == 0) {
		rval = list_from_file(&list, rec_num, "workload_insert.txt");
		if (rval != rec_num) {
			printf("list_from_file() error!\n");
			return 0;
		}
		
		printf("[BDB] Insert Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, INSERT);

		delete_list(&list);
	} else if (strcmp(argv[1], "lookup") == 0) {
		rval = list_from_file(&list, rec_num, "workload_insert.txt");
		if (rval != rec_num) {
			printf("list_from_file() error!\n");
			return 0;
		}
		
		printf("[BDB] Lookup Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, LOOKUP);
		if (rval != rec_num) {
			printf("error!\n");
			return 0;
		}
		
		delete_list(&list);
	} else if (strcmp(argv[1], "delete") == 0) {
		rval = list_from_file(&list, rec_num, "workload_insert.txt");
		if (rval != rec_num) {
			printf("list_from_file() error!\n");
			return 0;
		}
		
		printf("[BDB] Delete Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, DELETE);
		if (rval != rec_num) {
			printf("error!\n");
			return 0;
		}
		
		delete_list(&list);
	} else if (strcmp(argv[1], "update") == 0) {
		rec_num += rec_num/FREQ_NUM;
		rval = list_from_file(&list, rec_num, "workload_update.txt");
		if (rval != rec_num) {
			printf("list_from_file() error!\n");
			return 0;
		}
		
		printf("[BDB] Update Experiment\n");
		rval = do_experiment(&list, store_name, rec_num, rec_size, UPDATE);
		if (rval != rec_num) {
			printf("error!\n");
			return 0;
		}
		
		delete_list(&list);
	} else {
		printf("[BDB] type error!\n");
	}

	if (terminate_experiment(store_name) != 1) {
		printf("[BDB] terminate_experiment() fail!\n");
		return 0;
	}

	//system("rm /mnt/kvstore.db");
	
	return 0;
}

/*void purge_buffer_cache(void)
{
	char command[1024];
	int i, rval;

	strcpy(command, "umount /mnt");
	for (i = 1; i < 10; ++i) {
		rval = system(command);
		if (rval == 0)
			break;
		sleep(i);
	}

	strcpy(command, "mount -t ext4 /dev/ram1 /mnt");
	for (i = 1; i < 10; ++i) {
		rval = system(command);
		if (rval == 0)
			break;
		sleep(i);
	}
}*/

int init_experiment(char *store_name)
{
	unsigned long env_flags, open_flags;;
	int rval;

	env_flags = DB_CREATE|DB_INIT_MPOOL;
	if (log_flag == 1) {
		env_flags |= DB_RECOVER|DB_INIT_TXN|DB_INIT_LOG;
	}
	//env_flags |=  DB_THREAD|DB_INIT_LOCK;

	if (db_env_create(&db_env, 0) != 0) {
		printf("[BDB] db_env_create() fail!\n");
		return 0;
	}
	
	//rval = envp->set_lk_detect(db_env, DB_LOCK_MINWRITE);
	//rval = envp->set_lk_max_locks(db_env, 10000);
	//rval = envp->set_lk_max_objects(db_env, 10000);
	rval = db_env->set_cachesize(db_env, 0, 1024*1024*1024, 1);	// 0G + 1024M
	if (db_env->open(db_env, DB_DIRECTORY, env_flags, 0) != 0) {
		printf("[BDB] db_env->open() fail!\n");
		db_env->close(db_env, 0);
		return 0;
	}

	if(db_create(&db, db_env, 0) != 0) {
		printf("[BDB] db_create() fail!\n");
		return 0;
	}
	
	open_flags = DB_CREATE;
	if (log_flag == 1) {
		open_flags |= DB_AUTO_COMMIT;
	}
	if (kv_type == BTREE) {
		rval = db->open(db, NULL, store_name, NULL, DB_BTREE, open_flags, 0);
	} else if (kv_type == HASH) {
		rval = db->open(db, NULL, store_name, NULL, DB_HASH, open_flags, 0);
	}
	if (rval != 0) {
		printf("[BDB] db->open() fail!\n");
		return 0;
	}
	
	return 1;
}

int terminate_experiment(char *store_name)
{
	//db_env->close(db_env, 0);

	db->close(db, 0);
	/*if (db->remove(db, store_name, NULL, 0) != 0) {
		printf("[BDB] db->remove() fail!\n");
		return 0;
	}*/
	return 1;
}

int do_experiment(struct list *list, char *store_name, unsigned long rec_num, 
			unsigned long rec_size, int op)
{
	struct timespec stamp_s, stamp_e;
	unsigned long tv_sec, tv_nsec;
	struct node *node;
	unsigned long tmp_key[2];
	unsigned long *tmp_value;
	DBT key, value;
	unsigned long cnt, i;
	int rval;

	tmp_value = (unsigned long *)malloc(rec_size);
	node = list->head;
	cnt = 1;
	
	memset(&key, 0, sizeof(DBT));
	memset(&value, 0, sizeof(DBT));

	key.data = tmp_key;
	key.size = 16;
	value.data = tmp_value;
	value.size = rec_size;
	value.ulen = rec_size;
	value.flags = DB_DBT_USERMEM;

	clock_gettime(CLOCK_REALTIME, &stamp_s);
	while (node) {

		tmp_key[0] = tmp_key[1] = node->key;
		
		switch (op) {
			case INSERT:
				for (i=0; i<rec_size/8; i++) {
					tmp_value[i] = rec_num + node->key;
				}
				if (db->put(db, NULL, &key, &value, DB_NOOVERWRITE) != 0) {
					printf("[BDB] db->put() fail");
					return 0;
				}
				break;
				
			case LOOKUP:
				if (db->get(db, NULL, &key, &value, 0) != 0) {
					printf("[BDB] db->get() fail\n");
					return 0;
				} //else {
				//	tmp_value = (unsigned long *)value.data;
				//	if (tmp_value[0] != rec_num + node->key) {
				//		printf("[BDB] db->get(), wrong value!\n");
				//		return 0;
				//	}
				//}
				break;
				
			case DELETE:
				if (db->del(db, NULL, &key, 0) != 0) {
					printf("[BDB] db->del() fail\n");
					return 0;
				}
				break;

			case UPDATE:
				if (cnt%(FREQ_NUM+1) == 0) {
					if (db->del(db, NULL, &key, 0) != 0) {
						printf("[BDB] update: db->del() fail\n");
						return 0;
					}
				} else {
					for (i=0; i<rec_size/8; i++) {
						tmp_value[i] = rec_num + node->key;
					}
					if (db->put(db, NULL, &key, &value, DB_NOOVERWRITE) != 0) {
						printf("[BDB] update: db->put() fail\n");
						return 0;
					}
				}
				break;
				
			default:
				printf("Wrong operation!\n");
				return 0;
				//break;
		}

		node = node->next;
		cnt++;
		//if (cnt == rec_num)
		//	break;
	}
	clock_gettime(CLOCK_REALTIME, &stamp_e);
	
	tv_sec = stamp_e.tv_sec - stamp_s.tv_sec;
	if (stamp_e.tv_nsec < stamp_s.tv_nsec) {
		stamp_e.tv_nsec += 1000000000;
		tv_sec--;
	}
	tv_nsec = stamp_e.tv_nsec - stamp_s.tv_nsec;
	printf("[BDB] Experiment Time (sec=%lu, nsec=%lu)\n", tv_sec, tv_nsec);

	free(tmp_value);
	return cnt-1;
}
