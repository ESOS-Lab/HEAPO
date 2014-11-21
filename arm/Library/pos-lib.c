/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <unistd.h>
#include <syscall.h>

#include "pos-lib.h"
#include "pos-malloc.h"

//#define POS_NAME_LENGTH	128
#define POS_NAME_TABLE		25

//#define DEBUG	1
#define DEBUG	0


/*struct pos_name_entry {
	char name[POS_NAME_LENGTH];
	void *mstate;	// Start address of prime region (prime segment)
	struct pos_name_entry *next;
};*/


//라이브러리 레벨 네임 테이블
struct pos_name_entry *name_table[POS_NAME_TABLE];


void debug_printf(char *string)
{
#if DEBUG==1
	printf("POS-lib debug: %s\n", string);
#endif
}

////////////////////////////////////////////////////////////////////////////////

int
pos_name_table_index(char *name)
{
	int index;
	int size;
	int i;

	
	index = 0;
	size = strlen(name);

	for (i=0; i<size ; i++) {
		index += (int)name[i];
	}

	index = index%POS_NAME_TABLE;
	
	return index;
}

////////////////////////////////////////////////////////////////////////////////

// This fucntion checks whether the object storage is mapped or not.
// If the object storage is mapped, it returns start address of prime segment (prime region).
void *
pos_lookup_mstate(char* name)
{
	struct pos_name_entry *name_entry;
	int index;
	
	if (strlen(name) >= POS_NAME_LENGTH)
		return NULL;

	index = pos_name_table_index(name);
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {		
			return name_entry->mstate;
		} else {
			name_entry = name_entry->next;
		}
	}

	return NULL;
}

struct pos_name_entry *
pos_lookup_name_entry(char *name)
{
	struct pos_name_entry *name_entry;
	int index;

	if (strlen(name) >= POS_NAME_LENGTH)
		return NULL;

	index = pos_name_table_index(name);
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {		
			return name_entry;
		} else {
			name_entry = name_entry->next;
		}
	}
	
	return NULL;
}

////////////////////////////////////////////////////////////////////////////////

int
pos_create(char *name)
{
	struct pos_name_entry *name_entry;
	int index;


	if (strlen(name) >= POS_NAME_LENGTH)
		return 0;

	//라이브러리에서 관리하는 name table 먼저 확인
	index = pos_name_table_index(name);
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {
			debug_printf("Already created\n");
			return 0;
		} else {
			name_entry = name_entry->next;
		}
	}

	//새로운 name table entry를 할당
	name_entry = (struct pos_name_entry *)malloc(sizeof(struct pos_name_entry));
	strcpy(name_entry->name, name);

	//sys_pos_create() 시스템 콜 호출
//#if CONSISTENCY == 1
	//name_entry->mstate = (void *)syscall(299, name, 1024*1024); // Contiguous object whose size is about 1GB...
//#else
	name_entry->mstate = (void *)syscall(383, name, 4); // 4KB
//#endif
	if (name_entry->mstate == (void *)0) {
		debug_printf("pos_create() error!\n");
		free(name_entry);
		return 0;
	} else {
#if DEBUG==1
		printf("pos_create() returns 0x%lX address.\n", (unsigned long)name_entry->mstate);
#endif
	}

	name_entry->log_addr = NULL;
	name_entry->seg_head = NULL;

	//name table에 삽입
	name_entry->next = name_table[index];
	name_table[index] = name_entry; 

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

int
pos_delete(char *name)
{
	struct pos_name_entry *name_entry, **prev;
	int index;
	

	if (strlen(name) >= POS_NAME_LENGTH)
		return 0;

	//라이브러리에서 관리하는 name table 확인
	index = pos_name_table_index(name);
	prev = &name_table[index];
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {
			*prev = name_entry->next;
			break;
		} else {
			prev = &name_entry->next;
			name_entry = name_entry->next;
		}
	}

	//존재 할 경우 삭제 시도
	if (name_entry != NULL) {
		//malloc_state 초기화 (key값 초기화)
		struct malloc_state *ms;
		ms = name_entry->mstate;

		clear_init_key(ms);

		//sys_pos_delete() 시스템 콜 호출
		if (syscall(384, name) == 0) {
			debug_printf("pos_delete() error!\n");
			return 0;
		}

		//name table에서 삭제
		*prev = name_entry->next;
		name_entry->next = NULL;

		free(name_entry);
		return 1;
	} else {
		debug_printf("Target object storage isn't mapped.\n");
		return 0;
	}
}

////////////////////////////////////////////////////////////////////////////////

int
pos_map(char* name)
{
	struct pos_name_entry *name_entry;
	int index;
	

	if (strlen(name) >= POS_NAME_LENGTH)
		return 0;

	//라이브러리에서 관리하는 name table 먼저 확인
	index = pos_name_table_index(name);
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {
			debug_printf("Already mapped\n");
			return 0;
		} else {
			name_entry = name_entry->next;
		}
	}

	//새로운 name table entry를 할당
	name_entry = (struct pos_name_entry *)malloc(sizeof(struct pos_name_entry));
	strcpy(name_entry->name, name);

	//sys_pos_map() 시스템 콜 호출
	name_entry->mstate = (void *)syscall(385, name);
	if (name_entry->mstate == (void *)0) {
		debug_printf("pos_map() error!\n");
		free(name_entry);
		return 0;
	} else {
#if DEBUG==1
		printf("pos_map() returns 0x%lX address.\n", (unsigned long)name_entry->mstate);
#endif
	}

	name_entry->log_addr = NULL;
	name_entry->seg_head = NULL;

	//name table에 삽입
	name_entry->next = name_table[index];
	name_table[index] = name_entry; 

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

int
pos_unmap(char *name)
{
	struct pos_name_entry *name_entry, **prev;
	int index;
	

	if (strlen(name) >= POS_NAME_LENGTH)
		return 0;

	//라이브러리에서 관리하는 name table 확인
	index = pos_name_table_index(name);
	prev = &name_table[index];
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {

			//sys_pos_unmap() 시스템 콜 호출
			if (syscall(386, name) == 0) {
				debug_printf("pos_unmap() error!\n");
				return 0;
			}

			//name table에서 삭제
			*prev = name_entry->next;
			name_entry->next = NULL;

			free(name_entry);
			
			return 1;
		} else {
			prev = &name_entry->next;
			name_entry = name_entry->next;
		}
	}

	debug_printf("There isn't target object storage!\n");
	return 0;
}

////////////////////////////////////////////////////////////////////////////////

void *
pos_seg_alloc(char *name, unsigned long len)
{
	struct pos_name_entry *name_entry;
	int index;
	

	if (strlen(name) >= POS_NAME_LENGTH)
		return (void *)0;

	//라이브러리에서 관리하는 name table 먼저 확인
	index = pos_name_table_index(name);
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {
			void *addr;

			//sys_pos_seg_alloc() 시스템 콜 호출
			addr = (void *)syscall(387, name, len);
			if (addr == (void *)0) {
				debug_printf("pos_seg_alloc() error!\n");
			} else {
#if DEBUG==1
				printf("pos_seg_alloc() returns 0x%lX address.\n", (unsigned long)addr);
#endif
			}
				
			return addr;
		} else {
			name_entry = name_entry->next;
		}
	}

	debug_printf("Target object storage has not mapped\n");
	return (void *)0;
}

////////////////////////////////////////////////////////////////////////////////

void
pos_seg_free(char *name, void *addr, unsigned long len)
{
	struct pos_name_entry *name_entry;
	int index;
	

	if (strlen(name) >= POS_NAME_LENGTH)
		return ;

	//라이브러리에서 관리하는 name table 먼저 확인
	index = pos_name_table_index(name);
	name_entry = name_table[index];
	
	while (name_entry) {
		if (strcmp(name, name_entry->name) == 0) {

			//sys_pos_seg_free() 시스템 콜 호출
			if (syscall(388, name, addr, len) ==0) {
				debug_printf("pos_seg_free() error!\n");
			} else {
#if DEBUG==1
				printf("pos_seg_free() success.\n");
#endif
			}
			
			return ;
		} else {
			name_entry = name_entry->next;
		}
	}

	debug_printf("Target object storage has not mapped\n");
}

////////////////////////////////////////////////////////////////////////////////

int
pos_is_mapped(char *name)
{
	void *prime_seg;


	if (strlen(name) >= POS_NAME_LENGTH)
		//return NULL;
		return 0;

	//sys_pos_is_mapped() 시스템 콜 호출
	prime_seg = (void *)syscall(389, name);
	if (prime_seg == (void *)0) {
		//printf("sys_pos_is_mapped() returns NULL\n");
		//return NULL;
		return 0;
	} else {
		//printf("sys_pos_is_mapped() returns 0x%lX\n", (unsigned long)prime_seg);
		//return (void *)prime_seg;
		return 1;
	}
}


////////////////////////////////////////////////////////////////////////////////
int register_node_info(char *name, void *node, void *ptr, unsigned long size)
{
	struct malloc_state *av;
	int i;

	av = (struct malloc_state *)pos_lookup_mstate(name);
	if(av == NULL)
		printf("Not Allocate Memory\n");

	av -> node_obj.size = size;
	for(i = 0 ; i < 50 ; i++)
	{
		if(av -> node_obj.ptr_offset[i] == 0)
		{
			av -> node_obj.ptr_offset[i] = (unsigned long)(ptr - node);
			break;
		}		
	}
}


