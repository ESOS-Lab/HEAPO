/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/


/* Malloc implementation for multiple threads without lock contention.
   Copyright (C) 1996-2006, 2007, 2008, 2009 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Wolfram Gloger <wg@malloc.de>
   and Doug Lea <dl@cs.oswego.edu>, 2001.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public License as
   published by the Free Software Foundation; either version 2.1 of the
   License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; see the file COPYING.LIB.  If not,
   write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/*
  160311
  1. allocation tree insertion routine added.
     => address(nv object chunk's start address) will be inserted to allocation tree(rb-tree) 
 */

/*160315
  1. previous allocation tree insertion routine deleted
  2. rb-tree insert/search function added
  3. gc_node structure added
  4. rb-tree initialization routine added
*/
/*
#include <pos-malloc.h>
#include <stdio.h>
#include <unistd.h>
#include <syscall.h>
#include <stdint.h>
#include <time.h>

#include "KV/alloc_list/alloc_list.h"
#include "KV/list/pos-list.h"
#include "KV/hashtable/pos-hashtable.h"
#include "KV/btree/pos-btree.h"
*/
#include "pos-malloc.h"
#include <stdio.h>
#include <unistd.h>
#include <syscall.h>
//#include <stdint.h>
#include <time.h>
//sb s
#include "KV/alloc_list/alloc_list.h"
#include "KV/list/pos-list.h"
#include "KV/hashtable/pos-hashtable.h"
#include "KV/btree/pos-btree.h"
//sb e

INTERNAL_SIZE_T global_max_fast = 144;

#define POS_GC_DEBUG	1
#define DK_DEBUG	0
#define SB_DEBUG	0
#define	BILLION 1000000000L

#define pos_public_fREe		pos_free
#define pos_public_mALLOc	pos_malloc
#define pos_public_rEALLOc	pos_realloc

//#if POS_GC_DEBUG == 1
unsigned long total_chunks_size=0;
unsigned long garbage_count = 0;

unsigned long listCnt=0;
#define MAXSIZE 10   // max size of List

typedef struct __list {
	struct __listnode *head;
	struct __listnode *tail;
} linkedList;
typedef struct __listnode {
	unsigned long addr;
	struct __listnode *prev;
	struct __listnode *next;
} listnode;

linkedList gc_list;
//#endif

pthread_mutex_t gc_mutex = PTHREAD_MUTEX_INITIALIZER;

static void pos_malloc_consolidate(char *,mstate);
static Void_t* pos_int_malloc(char *, mstate, size_t);
void pos_int_free(char *, mstate, mchunkptr, int);
void pos_malloc_init_state(char *, mstate);
Void_t* pos_public_mALLOc(char *, unsigned long);
void pos_public_fREe(char *, Void_t *);
Void_t* pos_public_rEALLOc(char *, Void_t*, unsigned long);

void pos_print_free_chunks(char *);

void pos_print_seg(mstate av);

Void_t* lookup_pointer(mchunkptr p , unsigned long offset);
int check_valid_address(struct seg_info *head, Void_t *ptr);
void pos_check_unsafe_segment(char *name, mstate av, struct seg_info *head, Void_t *first_chunk);
Void_t* pos_unsafe_region_relocate(char *name, mstate av, Void_t *p);
void pos_check_unsafe_region(char *name, mstate av, struct seg_info *head, mchunkptr chunk_ptr);
void chunk_change_pointer(mchunkptr chunk_ptr, Void_t *p , unsigned long offset);




void insertNode(unsigned long addr) {
	listnode *tmp;
	listnode *newNode = (listnode *)malloc(sizeof(listnode));
	newNode->addr = addr;
	newNode->prev = NULL;
	newNode->next = NULL;
	if(gc_list.head == NULL && gc_list.tail == NULL)
		gc_list.head = gc_list.tail = newNode;	
	else {
		newNode->next = gc_list.head;
		gc_list.head->prev = newNode;
		gc_list.head = newNode;
		if (listCnt > 10) {
			tmp = gc_list.tail;
			tmp->prev->next = NULL;
			gc_list.tail = tmp->prev;
			free(tmp);
		}
	}
}

int searchNode(unsigned long addr) {
	listnode *p = gc_list.head;
	int ret = 0;

	while (p != NULL) {
		if (p->addr == addr) {
			ret = 1;
			break;
		}
		p = p->next;
	}

	return ret;
}

int searchNode2(unsigned long addr, unsigned int cnt) {
	listnode *p = gc_list.head;
	int ret = 0, i;

#if SB_DEBUG
	printf("[sb debug : %s] addr : 0x%lx, cnt : %u\n", __func__, addr, cnt);
#endif
	for (i=0; i<cnt; i++) {
#if SB_DEBUG
	printf("current addr : 0x%lx\n", p->addr);
#endif
		if (p->addr == addr) {
			ret = 1;
			break;
		}
		p = p->next;
	}

	return ret;
}

void printNodes() {
	listnode *p = gc_list.head;	
	printf("\n");
	putchar('[');
	while(p != NULL) {
		printf("0x%lx, ", p->addr);
		p = p->next;
	}
	putchar(']');
	putchar('\n');
}







//기능 : GC 수행 시간 출력 함수(Allocation List 구성 시간, 가비지 회수 시간, 전체 시간)
//입력 값
//      T1, T2 : GC 수행 시작과 종료 시간
//      alloc_T1, alloc_T2 : Allocation List 구성 시작과 종료 시간
//      free_T : 총 가비지 수집 시간(가비지 free 시간)
void print_gc_time(struct timespec T1 , struct timespec T2, struct timespec alloc_T1, struct timespec alloc_T2, struct timespec free_T)
{
  	long sec,usec;
  	long sec2, usec2;
  	double time;
  	double time2;
  	double rate;

	//uint64_t diff, diff2, diff3;
	unsigned long diff, diff2, diff3;
	
	diff = BILLION * (T2.tv_sec - T1.tv_sec) + T2.tv_nsec - T1.tv_nsec;
	diff2 = BILLION * (alloc_T2.tv_sec - alloc_T1.tv_sec) + alloc_T2.tv_nsec - alloc_T1.tv_nsec;
	diff3 = BILLION * (free_T.tv_sec) + free_T.tv_nsec;
	
	printf("\tAlloc list make time : %llu ns (%llu us, %llu ms, %llu sec)\n", (long long unsigned int)diff2, (long long unsigned int)diff2/1000, (long long unsigned int)diff2/(1000*1000), (long long unsigned int)diff2/(1000*1000*1000));
	printf("\tTotal free time : %llu ns (%llu us, %llu ms, %llu sec)\n", (long long unsigned int)diff3, (long long unsigned int)diff3/1000, (long long unsigned int)diff3/(1000*1000), (long long unsigned int)diff3/(1000*1000*1000));
	printf("\tExecution Time : %llu ns (%llu us, %llu ms, %llu sec)\n\n", (long long unsigned int)diff, (long long unsigned int)diff/1000, (long long unsigned int)diff/(1000*1000), (long long unsigned int)diff/(1000*1000*1000));
}

//기능 : HEAPO Local GC 수행 함수, Allocation List와 객체저장소의 청크 리스트
//      (HEAPO 라이브러리에서 관리)의 1:1 비교를 통해 가비지 탐색 및 회수
//입력 값 : name은 Local GC를 수행할 객체 저장소 이름
int pos_local_gc(char* name)
{
	mchunkptr ptr, nextchunk, next_seg_ptr;
	void *mem_ptr;
	void *p;
	short obj_type = 0;
	int type;
	int size;
	int key_count;
	int val_count;
	Node *alloc_list_head = NULL;
	Node *cur_node = NULL;
	mstate ms_ptr;
	unsigned int list_state=0;
	struct timespec T_1, T_2;
	struct timespec alloc_list_T1, alloc_list_T2;
	struct timespec total_free_T;
	long long unsigned int diff;
	long long unsigned int alloc_list_diff;
	int alloc_cnt;
	int free_cnt;

//printf("[SSB DEBUG : %s] start test!\n", __func__);

#if POS_GC_DEBUG == 1	
	total_free_T.tv_sec = 0;
	total_free_T.tv_nsec = 0;
	clock_gettime(CLOCK_MONOTONIC, &T_1);
#endif

	ms_ptr = (struct malloc_state *)pos_lookup_mstate(name);  
	p = pos_get_prime_object(name);
	ptr = mem2chunk(p);

	//obj_type = pos_get_object_type(name);
	syscall(403, name, &obj_type);

	type = obj_type & 0xF; //1111
	size = obj_type & 0xF0; //11110000
	key_count = obj_type & 0xF00; //111100000000
	val_count = obj_type & 0XF000; //1111000000000000

#if POS_GC_DEBUG == 1
    	clock_gettime(CLOCK_MONOTONIC, &alloc_list_T1);
#endif
	alloc_list_head = NULL;
#if SB_DEBUG
	printf("[SB DEBUG: %s] data structure selection start\n", __func__);
#endif
	if(type == 1) // linked list
	{
		int list_ret = 0; //for debugging
		list_ret = make_list_for_list((struct list_head *)p, &alloc_list_head);
		if(list_ret == -1)
		{
			return;
		}
	}
	else if(type == 2) //b-tree
	{
		int btree_ret = 0;
		btree_ret = make_list_for_btree((struct btree_head *)p, &alloc_list_head);
		if(btree_ret == -1)
		{
			printf("make_list_for_btree ERRO\n");
		}
	}
	else if(type == 3) //hash
	{
		int hash_ret = 0;
		hash_ret = make_list_for_hashtable((struct hashtable *)p, &alloc_list_head);
		if(hash_ret == -1)
		{
			printf("make_list_for_hash ERROR\n");
			return;
		}
	}
	else
	{
		return -1;
	}

	if(alloc_list_head == NULL) 
    	{
		return -1;
	}

	//printf("first list print\n");
	//display(alloc_list_head);

#if POS_GC_DEBUG == 1
	clock_gettime(CLOCK_MONOTONIC, &alloc_list_T2);
	alloc_list_diff = BILLION * (alloc_list_T2.tv_sec - alloc_list_T1.tv_sec) + alloc_list_T2.tv_nsec - alloc_list_T1.tv_nsec;
	//printf("allocation list creation time = %llu ns\n", (long long unsigned int)alloc_list_diff);
#endif

	cur_node = alloc_list_head;
#if SB_DEBUG
	printf("[SB DEBUG : %s] garbage detection start\n", __func__);
#endif
before_while:
	while(ptr != ms_ptr->last_chunk_pointer)
	{
	while_first:
		//printf("	check1\n");
		mem_ptr = chunk2mem(ptr);
	//printf("[sb debug : %s] c node : 0x%lx, c chunk : %p\n", __func__, cur_node->addr, mem_ptr);
	#if SB_DEBUG
	printf("[sb debug : %s] c node : %p, ", __func__, cur_node);
	if (cur_node != NULL)
		printf("node addr : 0x%lx, ", cur_node->addr);
	printf("mem_ptr : %p\n", mem_ptr);
	#endif
		//printf("	check2\n");
		/* deleted for multi-thread
		switch(type)
		{
			case 1 : list_state = get_list_state(); break;
			case 2 : list_state = get_btree_state(); break;
			case 3 : list_state = get_hash_state(); break;
			default : printf("[local gc] wrong type!\n"); return;
		}
		*/
		// SSB for btree
		if (cur_node == NULL) {
		#if SB_DEBUG
			printNodes();
		#endif
			alloc_cnt = get_btree_alloc_cnt();
			if (alloc_cnt) {
				if (searchNode2((unsigned long)mem_ptr, alloc_cnt)) {
				#if SB_DEBUG
					printf("\tmem_ptr : %p in gc_list\n", mem_ptr);
				#endif
					ptr = next_chunk(ptr);
					//goto while_first;
					goto before_while;
				}
			}
		}

		while(inuse(ptr) != 0x1) //if a chunk is free, pass free chunks
		{
			if(chunk_is_last(ptr) == 0x4)
			{
				next_seg_ptr = next_seg(ptr, chunksize(ptr));
				if(chunksize(next_seg_ptr) != 0) //there is a next segment 
				{
				#if DK_DEBUG
				        printf("__[DEBUG] pos_local_gc() : there is a next segment\n");
				#endif
				#if SB_DEBUG
					printf("[debug sb : %s] free chunk1 : %p\n", __func__, ptr);
				#endif
					ptr = (mchunkptr)(chunksize(next_seg_ptr));
					goto while_first;
				}
				else
				{
				#if DK_DEBUG
				        printf("__[DEBUG] pos_local_gc() : there is no next segment\n");
				#endif
				#if SB_DEBUG
					printf("[debug sb : %s] free chunk2 : %p\n", __func__, ptr);
				#endif
					break;
				}
			}
			else
			{
			#if DK_DEBUG
			        printf("__[DEBUG] pos_local_gc() : free chunk is detected\n");
			#endif
			#if SB_DEBUG
				printf("[debug sb : %s] free chunk3 : %p\n", __func__, ptr);
			#endif
				ptr = next_chunk(ptr);
			}
		}
       		
     		//nextchunk = next_chunk(ptr);
				
		/*
		if(type == 1 || type == 3)
		{
			if(chunk_is_last(ptr) == 0x4 && ptr == ms_ptr->last_allocated_chunk)
			{
				break;
			}
			else if(chunk_is_last(nextchunk) == 0x4 && ptr == ms_ptr->last_allocated_chunk)
			{
				break;
			}
		}
		else if(type == 2)
		{		
			if(list_state == 3 && cur_node == NULL)
			{
				break;
			}
		}
		*/
		//printf("check5\n");

		mem_ptr = chunk2mem(ptr);
		if((void *)cur_node->addr == mem_ptr) //Chunk is not a garbage
		{
//	       	        printf("__[DEBUG] pos_local_gc() : garbage is not detected\n");
			if(chunk_is_last(ptr) == 0x4)
			{
				next_seg_ptr = next_seg(ptr, chunksize(ptr));
				if(chunksize(next_seg_ptr) != 0) //there is a next segment
				{
					ptr = (mchunkptr)(chunksize(next_seg_ptr));
					cur_node = cur_node->next;
				}
				else
				{
					break;
				}
			}
			else 
			{
				ptr = next_chunk(ptr);
				cur_node = cur_node->next;
			}
		}
		else //Chunk is expected as a garbage
		{
		#if DK_DEBUG
		        printf("__[DEBUG] pos_local_gc() : garbage is detected\n");
		#endif
		        mem_ptr = chunk2mem(ptr);

			struct timespec temp_T1, temp_T2;
			long long unsigned int temp_diff;	

			memset(mem_ptr, 0, chunksize(ptr)-16);
			
#if POS_GC_DEBUG
			clock_gettime(CLOCK_MONOTONIC, &temp_T1);
#endif

		        //printf("__[DEBUG] pos_local_gc() : garbage = %p\n", mem_ptr );
			//				pos_free(name, mem_ptr);
			pos_int_free(name, ms_ptr, mem2chunk(mem_ptr), 1);
#if POS_GC_DEBUG

			clock_gettime(CLOCK_MONOTONIC, &temp_T2);
			total_free_T.tv_sec += (temp_T2.tv_sec - temp_T1.tv_sec);
			total_free_T.tv_nsec += (temp_T2.tv_nsec - temp_T1.tv_nsec);
			garbage_count++;
if (garbage_count == 1)
printf("[FREE NODES' POINTERS]\n");

printf("[%d] 0x%lx ", garbage_count, (unsigned int)mem_ptr);
#endif

			if(chunk_is_last(ptr) == 0x4)
			{

			        next_seg_ptr = next_seg(ptr, chunksize(ptr));
				if(chunksize(next_seg_ptr) != 0) //there is a next segment
				{
				#if DK_DEBUG
				        printf("__[DEBUG] pos_local_gc() : garbage and there is a next segment\n");
				#endif
					ptr = (mchunkptr)(chunksize(next_seg_ptr));
					}
					else
					{
					#if DK_DEBUG
					        printf("__[DEBUG] pos_local_gc() : garbage and there is no next segment\n");
					#endif
						break;
					}
				}
				else
				{
				#if DK_DEBUG
				        printf("__[DEBUG] pos_local_gc() : garbage and go to next chunk\n");
				#endif
					ptr = next_chunk(ptr);
				}
		        /*
			if(list_state == 1 && ptr == ms_ptr->last_allocated_chunk) //partial allocated case
			{
				next_seg_ptr = next_seg(ptr, chunksize(ptr));
				if(chunk_is_last(ptr) == 0x4)
				{
					if(chunksize(next_seg_ptr) != 0) //there is a next segment
					{
						ptr = (mchunkptr)(chunksize(next_seg_ptr));
					}
					else
					{
						break;
					}
				}
				else
				{
					ptr = next_chunk(ptr);
				}
			}
			else //chunk is a garbage
			{
			        printf("__[DEBUG] pos_local_gc() : garbage is detected\n");
				mem_ptr = chunk2mem(ptr);
				struct timespec temp_T1, temp_T2;
				long long unsigned int temp_diff;	

				memset(mem_ptr, 0, chunksize(ptr)-16);
			
#if POS_GC_DEBUG
				clock_gettime(CLOCK_MONOTONIC, &temp_T1);
#endif
				printf("__[DEBUG] pos_local_gc() : garbage = %p\n", mem_ptr );
				//				pos_free(name, mem_ptr);
				pos_int_free(name, ms_ptr, mem2chunk(mem_ptr), 1);
#if POS_GC_DEBUG
				clock_gettime(CLOCK_MONOTONIC, &temp_T2);
				total_free_T.tv_sec += (temp_T2.tv_sec - temp_T1.tv_sec);
				total_free_T.tv_nsec += (temp_T2.tv_nsec - temp_T1.tv_nsec);
				garbage_count++;
#endif

				if(chunk_is_last(ptr) == 0x4)
				{
					next_seg_ptr = next_seg(ptr, chunksize(ptr));
					if(chunksize(next_seg_ptr) != 0) //there is a next segment
					{
		     			        printf("__[DEBUG] pos_local_gc() : garbage and there is a next segment\n");
						ptr = (mchunkptr)(chunksize(next_seg_ptr));
					}
					else
					{
					  printf("__[DEBUG] pos_local_gc() : garbage and there is no next segment\n");
						break;
					}
				}
				else
				{
  				        printf("__[DEBUG] pos_local_gc() : garbage and go to next chunk\n");
					ptr = next_chunk(ptr);
				}
				}*/
		        }

	        }
	
        //for debug
//	display(alloc_list_head);

	//Free the Allocation List 
	remove_list(alloc_list_head);
//printf("[SSB DEBUG : %s] end test, garbage_count : %d\n", __func__, garbage_count);
#if POS_GC_DEBUG == 1
	clock_gettime(CLOCK_MONOTONIC, &T_2);
	if(garbage_count) {
		printf("\n\n\tTotal garbage count : %lu\n", garbage_count);
		print_gc_time(T_1, T_2, alloc_list_T1, alloc_list_T2, total_free_T);
		garbage_count = 0;
	}
#endif

	return garbage_count;
}

/*
  ------------------------------ pos_malloc_consolidate ------------------------------
*/

static void 
pos_malloc_consolidate(char *name, mstate av)
{
	mfastbinptr*    fb;
	mfastbinptr*    maxfb;
	mchunkptr       p;
	mchunkptr       nextp;

#if CONSISTENCY == 1
	clear_fastchunks_log(name, av);
#else
	clear_fastchunks(av);
#endif

	maxfb = &fastbin (av, NFASTBINS - 1);

	fb = &fastbin (av, 0);
	do {
		p = *fb;
		if (p != 0) {
#if CONSISTENCY == 1
			POS_WRITE_VAUE(name, (unsigned long *)fb, (unsigned long)0);
#else
			*fb = 0;
#endif
			do {
				nextp = p->fd;
#if CONSISTENCY == 1
				clear_inuse_log(name, p);
#else
				clear_inuse(p);
#endif
				pos_int_free(name, av, p, 0);
			} while ( (p = nextp) != 0);
		}
	} while (fb++ != maxfb);

}


/*
  ------------------------------ pos_malloc ------------------------------
*/


static Void_t*
pos_int_malloc(char *name, mstate av, size_t bytes)
{
	INTERNAL_SIZE_T nb;
	unsigned int idx;
	mbinptr bin;

	mchunkptr victim;
	INTERNAL_SIZE_T size;
	int victim_index;

	mchunkptr remainder;
	unsigned long remainder_size;

	unsigned int block;
	unsigned int bit;
	unsigned int map;

	mchunkptr fwd;
	mchunkptr bck;

	int gc_result = 0;
	mchunkptr present_last_chunk = NULL;	//현재 세크먼트에서 마지막 청크 기록용 메타데이터
	size_t pagemask  = PAGESIZE - 1;

 first:
	//16바이트 단위로 정렬
	checked_request2size(bytes, nb);


	// 1. fast bin (<=144)
	if ((unsigned long)(nb) <= (unsigned long)(get_max_fast())) {
	      	idx = fastbin_index(nb);
		mfastbinptr* fb = &fastbin(av, idx);

		victim = *fb;

		if (victim != 0) {

#if CONSISTENCY == 1
			POS_WRITE_VAUE(name, (unsigned long *)fb, (unsigned long)victim->fd);
#else
			*fb = victim->fd;
#endif
			void *p = chunk2mem(victim);
			//마지막 할당된 청크를 기록
			av->last_allocated_chunk = victim;
			//dk s
			set_inuse_bit_at_offset(victim, chunksize(victim));
			//printf("pos_malloc(): fastbin\n");
			//dk e
			return p;
		}
	}

	// 2. small bin (<=1008)
	//printf("[DEBUG] small bin start\n");
	if (in_smallbin_range(nb)) {
		idx = smallbin_index(nb);
		bin = bin_at(av,idx);
		if ( (victim = last(bin)) != bin) {
			bck = victim->bk;
#if CONSISTENCY == 1
			set_inuse_bit_at_offset_log(name, victim, nb);
			POS_WRITE_VAUE(name, (unsigned long *)&bin->bk, (unsigned long)bck);
			POS_WRITE_VAUE(name, (unsigned long *)&bin->fd, (unsigned long)bin);
#else
			set_inuse_bit_at_offset(victim, chunksize(victim));
			bin->bk = bck;
			bck->fd = bin;
#endif
			void *p = chunk2mem(victim);
			//마지막 할당된 청크를 기록
			av->last_allocated_chunk = victim;
			return p;
		}
	}
	else {
		idx = largebin_index(nb);
		if (have_fastchunks(av)) {
			pos_malloc_consolidate(name, av);
		}
	}

	for(;;) {

		int iters = 0;

		// 3. unsorted bin
		//printf("[DEBUG] unsorted bin start\n");
		while ((victim = unsorted_chunks(av)->bk) != unsorted_chunks(av)) {
			bck = victim->bk;
			size = chunksize(victim);

			if (in_smallbin_range(nb) &&
			   bck == unsorted_chunks(av) &&
			   victim == av->last_remainder &&
				(unsigned long)(size) > (unsigned long)(nb + MINSIZE)) { //initial state 
			        //printf("[DEBUG] in unsorted bin : victim is small bin range\n");
				remainder_size = size - nb;
				remainder = chunk_at_offset(victim, nb);
#if CONSISTENCY == 1
				POS_WRITE_VAUE(name, (unsigned long *)&unsorted_chunks(av)->bk, (unsigned long)remainder);
				POS_WRITE_VAUE(name, (unsigned long *)&unsorted_chunks(av)->fd, (unsigned long)remainder);
				POS_WRITE_VAUE(name, (unsigned long *)&av->last_remainder, (unsigned long)remainder);
#else
				unsorted_chunks(av)->bk = unsorted_chunks(av)->fd = remainder;
				av->last_remainder = remainder;
#endif
				remainder->bk = remainder->fd = unsorted_chunks(av);
				if (!in_smallbin_range(remainder_size)) {
					remainder->fd_nextsize = NULL;
					remainder->bk_nextsize = NULL;
				}

// Remainder dosen't need logging...
				if (chunk_is_last(victim))
				{
			     	       //printf("victim chunk is last\n");
					set_head(remainder, remainder_size | LAST_CHUNK | PREV_INUSE);
					//마지막 청크에서 할당한 후 나머지 부분을 마지막 청크로 기록
					if((unsigned long)av->last_chunk_pointer < (unsigned long)remainder)
					{
					  //printf("reminder setting\n");
						av->last_chunk_pointer = remainder;
					}
				}
				else
				{
					set_head(remainder, remainder_size | PREV_INUSE);
				}

				// set PREV_INUSE flag..
#if CONSISTENCY == 1
				if (chunk_is_first(victim))
			        {
					set_head_log(name, victim, nb | FIRST_CHUNK | PREV_INUSE);
				}
				else
			        {
					set_head_log(name, victim, nb | PREV_INUSE);
				}
				
				set_foot_log(name, remainder, remainder_size);
#else
				if (chunk_is_first(victim))
				{
				        //printf("victim chunk is first\n");
					set_head(victim, nb | FIRST_CHUNK | PREV_INUSE);
				}
				else
				{
					set_head(victim, nb | PREV_INUSE);
				}

				set_foot(remainder, remainder_size);
#endif
				void *p = chunk2mem(victim);

				//가장 최근에 할당된 청크를 기록
				av->last_allocated_chunk = victim;
				return p;
			}

#if CONSISTENCY == 1
			POS_WRITE_VAUE(name, (unsigned long *)&unsorted_chunks(av)->bk, (unsigned long)bck);
			POS_WRITE_VAUE(name, (unsigned long *)&bck->fd, (unsigned long)unsorted_chunks(av));
#else
			unsorted_chunks(av)->bk = bck;
			bck->fd = unsorted_chunks(av);
#endif

			if (size == nb) {
#if CONSISTENCY == 1
				set_inuse_bit_at_offset_log(name, victim, size);
#else
				set_inuse_bit_at_offset(victim, size);
#endif
				void *p = chunk2mem(victim);

				//가장 최근에 할당된 청크를 기록
				av->last_allocated_chunk = victim;

				return p;
			}

			if (in_smallbin_range(size)) {
				victim_index = smallbin_index(size);
				bck = bin_at(av, victim_index);
				fwd = bck->fd;
			}
			else {
				victim_index = largebin_index(size);
				bck = bin_at(av, victim_index);
				fwd = bck->fd;

				if (fwd != bck) {
					size |= PREV_INUSE; //In order not to use chunksize()
					if ((unsigned long)(size) < (unsigned long)(bck->bk->size)) {
						fwd = bck;
						bck = bck->bk;

// Current victim was in the unsorted bin that fd_nextsize dosen't need.. so, we don't leave log.. (We don't leave log for fd_nextsize below..)
						victim->fd_nextsize = fwd->fd;
						victim->bk_nextsize = fwd->fd->bk_nextsize;
#if CONSISTENCY == 1
						POS_WRITE_VAUE(name, (unsigned long *)&fwd->fd->bk_nextsize, (unsigned long)victim);
						POS_WRITE_VAUE(name, (unsigned long *)&victim->bk_nextsize->fd_nextsize, (unsigned long)victim);
#else
						fwd->fd->bk_nextsize = victim->bk_nextsize->fd_nextsize = victim;
#endif
					}
					else {
						while ((unsigned long) size < fwd->size) {
							fwd = fwd->fd_nextsize;
						}

						if ((unsigned long) size == (unsigned long) fwd->size)
							fwd = fwd->fd;
						else {
							victim->fd_nextsize = fwd;
							victim->bk_nextsize = fwd->bk_nextsize;
#if CONSISTENCY == 1
							POS_WRITE_VAUE(name, (unsigned long *)&fwd->bk_nextsize, (unsigned long)victim);
							POS_WRITE_VAUE(name, (unsigned long *)&victim->bk_nextsize->fd_nextsize, (unsigned long)victim);
#else
							fwd->bk_nextsize = victim;
							victim->bk_nextsize->fd_nextsize = victim;
#endif
						}
						bck = fwd->bk;
					}
				} 
				else
					victim->fd_nextsize = victim->bk_nextsize = victim;
			}

#if CONSISTENCY == 1
			mark_bin_log(name, av, victim_index);
			POS_WRITE_VAUE(name, (unsigned long *)&victim->bk, (unsigned long)bck);
			POS_WRITE_VAUE(name, (unsigned long *)&victim->fd, (unsigned long)fwd);
			POS_WRITE_VAUE(name, (unsigned long *)&fwd->bk, (unsigned long)victim);
			POS_WRITE_VAUE(name, (unsigned long *)&bck->fd, (unsigned long)victim);
#else
			mark_bin(av, victim_index);
			victim->bk = bck;
			victim->fd = fwd;
			fwd->bk = victim;
			bck->fd = victim;
#endif

#define MAX_ITERS	10000
			if (++iters >= MAX_ITERS)
				break;
		}

		// 4. large bin (1024<=)
		//printf("[DEBUG] large bin start\n");
		if (!in_smallbin_range(nb)) {

			bin = bin_at(av, idx);

			if ((victim = first(bin)) != bin &&
			   (unsigned long)(victim->size) >= (unsigned long)(nb)) {

				victim = victim->bk_nextsize;
				while (((unsigned long)(size = chunksize(victim)) < (unsigned long)(nb)))
					victim = victim->bk_nextsize;

				if (victim != last(bin) && chunksize(victim) == chunksize(victim->fd))
					victim = victim->fd;

				remainder_size = size - nb;
#if CONSISTENCY == 1
				unlink_log(name, victim, bck, fwd);
#else
				unlink(victim, bck, fwd);
#endif

				if (remainder_size < MINSIZE)  {
#if CONSISTENCY == 1
					set_inuse_bit_at_offset_log(name, victim, size);
#else
					set_inuse_bit_at_offset(victim, size);
#endif
				}
				else {
					remainder = chunk_at_offset(victim, nb);

#if CONSISTENCY == 1
					insert_to_unsorted_log(name, av, remainder, bck, fwd, remainder_size);
#else
					insert_to_unsorted(av, remainder, bck, fwd, remainder_size);
#endif

// Remainder dosen't need logging...
					if (chunk_is_last(victim))
					{
						set_head(remainder, remainder_size | LAST_CHUNK | PREV_INUSE);
						//마지막 청크에서 할당 후 나머지 부분을 마지막 청크로 기록
						if((unsigned long)av->last_chunk_pointer < (unsigned long)remainder)
						{
							av->last_chunk_pointer = remainder;
						}
					}
					else
						set_head(remainder, remainder_size | PREV_INUSE);

					// set PREV_INUSE flag..
#if CONSISTENCY == 1
					if (chunk_is_first(victim)) {
						set_head_log(name, victim, nb | FIRST_CHUNK | PREV_INUSE);
					} else {
						set_head_log(name, victim, nb | PREV_INUSE);
					}
					
					set_foot_log(name, remainder, remainder_size);
#else
					if (chunk_is_first(victim))
						set_head(victim, nb | FIRST_CHUNK | PREV_INUSE);
					else
						set_head(victim, nb | PREV_INUSE);

					set_foot(remainder, remainder_size);
#endif
				}

				void *p = chunk2mem(victim);
				//가장 최근에 할당된 청크를 기록
				av->last_allocated_chunk = victim;
				return p;
			}
		}

		// 5. large bin in next size
		//printf("[DEBUG] large bin in next size start\n");		
		++idx;
		bin = bin_at(av,idx);
		block = idx2block(idx);
		map = av->binmap[block];
	 	bit = idx2bit(idx);

		for (;;) {

			if (bit > map || bit == 0) {
				do {
					if (++block >= BINMAPSIZE)
						goto new_alloc;
				} while ( (map = av->binmap[block]) == 0);

				bin = bin_at(av, (block << BINMAPSHIFT));
				bit = 1;
			}

			while ((bit & map) == 0) {
				bin = next_bin(bin);
				bit <<= 1;
			}

			victim = last(bin);

			if (victim == bin) {

#if CONSISTENCY == 1
				POS_WRITE_VAUE(name, (unsigned long *)&av->binmap[block], (unsigned long)(map &~bit));
#else
				av->binmap[block] = map &= ~bit;
#endif
				bin = next_bin(bin);
		        	bit <<= 1;
			}
			else {
				size = chunksize(victim);

				remainder_size = size - nb;

#if CONSISTENCY == 1
				unlink_log(name, victim, bck, fwd);
#else
				unlink(victim, bck, fwd);
#endif

				if (remainder_size < MINSIZE) {
#if CONSISTENCY == 1
					set_inuse_bit_at_offset_log(name, victim, size);
#else
					set_inuse_bit_at_offset(victim, size);
#endif
				}
				else {
					remainder = chunk_at_offset(victim, nb);

#if CONSISTENCY == 1
					insert_to_unsorted_log(name, av, remainder, bck, fwd, remainder_size);
#else
					insert_to_unsorted(av, remainder, bck, fwd, remainder_size);
#endif

					if (in_smallbin_range(nb)) {
#if CONSISTENCY == 1
						POS_WRITE_VAUE(name, (unsigned long *)&av->last_remainder, (unsigned long)remainder);
#else
						av->last_remainder = remainder;
#endif
					}
					//printf("[DEBUG] victim address = %p\n", victim);
					if (chunk_is_last(victim))
					{
					        //printf("[DEBUG] victim chunk is last(large bin)\n");
						set_head(remainder, remainder_size | LAST_CHUNK | PREV_INUSE);
						//마지막 청크에서 할당 후 나머지 부분을 마지막 청크로 기록
						if((unsigned long)av->last_chunk_pointer < (unsigned long)remainder)
						{
							av->last_chunk_pointer = remainder;
						}
					}
					else
						set_head(remainder, remainder_size | PREV_INUSE);

					// set PREV_INUSE flag..
#if CONSISTENCY == 1
					if (chunk_is_first(victim)) {
						set_head_log(name, victim, nb | FIRST_CHUNK | PREV_INUSE);
					} else {
						set_head_log(name, victim, nb | PREV_INUSE);
					}
					
					set_foot_log(name, remainder, remainder_size);
#else
					if (chunk_is_first(victim))
					{
					        //printf("[DEBUG] victim chunk is first(large bin)\n");
						set_head(victim, nb | FIRST_CHUNK | PREV_INUSE);
					}	
					else
				        {
						set_head(victim, nb | PREV_INUSE);
					}

					set_foot(remainder, remainder_size);
#endif
				}
				//가장 최근에 할당된 청크를 기록
				av->last_allocated_chunk = victim;
				void *p = chunk2mem(victim);
				//printf("[DEBUG] pos_malloc(): victim address(large bin) : %p\n", victim);
				return p;
			}
		}

new_alloc:
		//printf("[DEBUG] new alloc start\n");
		//새로운 세그먼트 할당 전에 한 번 Local GC 수행
		//if(gc_result < 1 && ((av->segment_counter)%1000 == 0) && av->segment_counter > 1000)
		if(gc_result < 1)
		//if (!gc_result)
		{
			struct timeval T1, T2;
			struct timespec T_1, T_2;
		#if SB_DEBUG
			printf("[DEBUG] pos_local_gc() is calling\n");
		#endif
			(void)mutex_lock(&gc_mutex);
			pos_local_gc(name);
			(void)mutex_unlock(&gc_mutex);
		#if SB_DEBUG
			printf("[DEBUG] pos_local_gc() is ended\n");
		#endif
		}
		//한 번 이상 GC가 trigger 되는 것을 방지
		if (gc_result == 1)
		//if(!gc_result)
		{
			gc_result++;
			goto first;
		}

		size = (nb + MINSIZE +4*SIZE_SZ + pagemask) & ~pagemask;
		char *mm = (char *)pos_seg_alloc(name, size);
		//printf("__[DEBUG] pos_seg_alloc is finished\n");
		memset(mm , 0 , size);
		total_chunks_size = 0;

#if CONSISTENCY == 1
		pos_log_insert_malloc_free(name, (unsigned long)mm, size);
#endif
		if (mm != (char *)0) {
#if CONSISTENCY == 1
			POS_WRITE_VAUE(name, (unsigned long *)&av->system_mem, (unsigned long)(av->system_mem+size));
#else
			av->system_mem += size;
#endif

			mchunkptr p;

			p = (mchunkptr)mm;

			//remainder_size 재 조정
			remainder_size = size - nb - 4*SIZE_SZ;
			remainder = chunk_at_offset(p, nb);
			//printf("__[DEBUG] reminder size adjust in finished\n");

#if CONSISTENCY == 1
			insert_to_unsorted_log(name, av, remainder, bck, fwd, remainder_size);
#else
			insert_to_unsorted(av, remainder, bck, fwd, remainder_size);
#endif

			set_head(p, nb | FIRST_CHUNK | PREV_INUSE);
			set_head(remainder, remainder_size | LAST_CHUNK | PREV_INUSE);

			set_foot(remainder, remainder_size);
			clear_inuse_bit_at_offset(remainder, remainder_size);
			
			//다음 세그먼트까지 청크 순회를 위하여 메타데이터 세팅
			present_last_chunk = av->last_chunk_pointer;
			mchunkptr p_tmp;
			p_tmp = next_seg(present_last_chunk, chunksize(present_last_chunk));
			memcpy((mchunkptr)((char *)p_tmp+SIZE_SZ), &p, sizeof(unsigned long));
			set_next_seg_pointer(remainder, remainder_size, 0); //initialize next seg pointer field
			av->last_chunk_pointer = remainder;
			av->last_allocated_chunk = chunk2mem(p);

			/* Dokeu Lee(161223) : Segment counter increase */
	                av->segment_counter++;
		#if DK_DEBUG
			printf("segment_counter : %d\n", av->segment_counter);
		#endif
			return chunk2mem(p);
		} 
		else
			return 0;
  
	}
}


/*
  ------------------------------ pos_free ------------------------------
*/
//static void 
void
pos_int_free(char *name, mstate av, mchunkptr p, int flag)
{
	INTERNAL_SIZE_T size;
	mfastbinptr* fb;
	mchunkptr prevchunk;
	INTERNAL_SIZE_T prevsize;
	mchunkptr nextchunk;
	INTERNAL_SIZE_T nextsize;
	int nextinuse;
	mchunkptr bck;
	mchunkptr fwd;

	//const char *errstr = NULL;

	//printf("pos_int_free() : %p\n", p);
	size = chunksize(p);
	/*if ((uintptr_t) p > (uintptr_t) -size || misaligned_chunk (p)) {
		errstr = "free(): invalid pointer";
errout:
		//malloc_printerr (check_action, errstr, chunk2mem(p));
		return;
	}*/
	/*if (size < MINSIZE) {
		errstr = "free(): invalid size";
		goto errout;
	}*/

	//check_inuse_chunk(av, p);


	// fastbin
	if (flag==1 && (unsigned long)(size) <= (unsigned long)(get_max_fast ())) {
		//printf("pos_int_free() : fastbin\n");
		/*if (chunk_at_offset (p, size)->size <= 2 * SIZE_SZ
		   || chunksize (chunk_at_offset (p, size)) >= av->system_mem) {
			errstr = "free(): invalid next size (fast)";
			goto errout;
		}*/
#if CONSISTENCY == 1
		set_fastchunks_log(name, av);
#else
		set_fastchunks(av);
#endif
		fb = &fastbin(av, fastbin_index(size));

		if (*fb == p) {
			//errstr = "double free or corruption (fasttop)";
			//goto errout;
			return ;
		}

#if CONSISTENCY == 1
		POS_WRITE_VAUE(name, (unsigned long *)&p->fd, (unsigned long)*fb);
		POS_WRITE_VAUE(name, (unsigned long *)fb, (unsigned long)p);
#else
		p->fd = *fb;
		*fb = p;
#endif
		clear_inuse_bit_at_offset(p, size);
		return ;
	}

	// 1. First chunk
	if (chunk_is_first(p)) {
		//printf("pos_int_free() : 1\n");
		nextchunk = next_chunk(p);
		nextsize = chunksize(nextchunk);

		// 1-1. (free F), free L
		if (chunk_is_last(nextchunk) && !inuse(nextchunk)) {
			//printf("pos_int_free() : 1-1\n");
			//if (av < p && p < (char *)(av+PAGESIZE)){
			if ((char*)av+sizeof(struct malloc_state) == (char*)p) {
#if CONSISTENCY == 1
				insert_to_unsorted_log(name, av, p, bck, fwd, size);

				set_foot_log(name, p, size);
				clear_inuse_bit_at_offset_log(name, p, size);
#else
				insert_to_unsorted(av, p, bck, fwd, size);

				set_foot(p, size);
				clear_inuse_bit_at_offset(p, size);
#endif

				goto out;
			}
			else {
#if CONSISTENCY == 1
				unlink_log(name, nextchunk, bck, fwd);
				size = size + nextsize + 2*SIZE_SZ;

				pos_log_insert_malloc_free(name, (unsigned long)p, size);
				//pos_seg_free(name, (void *)p, size); // Delayed pos_seg_free
				POS_WRITE_VAUE(name, (unsigned long *)&av->system_mem, (unsigned long)(av->system_mem-size));
#else
				unlink(nextchunk, bck, fwd);
				size = size + nextsize + 2*SIZE_SZ;
				/*if (size%PAGESIZE != 0) {
					errstr = "free(): unmmap size is not page size";
					goto errout;
				}*/
				//FREE((char*)p, size);

				pos_seg_free(name, (void *)p, size);
				av->system_mem -= size;

                                /* Dokeu Lee(161223) : Segment counter initialization */
				av->segment_counter--;
			#if DK_DEBUG
				printf("pos_seg_free called, segment_counter = %d\n", av->segment_counter);
			#endif

#endif

				goto out;
			}

		}

		// 1-3. (free F), free M
		else if (!inuse(nextchunk)) {
			//printf("pos_int_free() : 1-3\n");
#if CONSISTENCY == 1
			unlink_log(name, nextchunk, bck, fwd);
			size += nextsize;

			insert_to_unsorted_log(name, av, p, bck, fwd, size);

			set_head_log(name, p, size | FIRST_CHUNK | PREV_INUSE);
			set_foot_log(name, p, size);
#else
			unlink(nextchunk, bck, fwd);
			size += nextsize;

			insert_to_unsorted(av, p, bck, fwd, size);

			set_head(p, size | FIRST_CHUNK | PREV_INUSE);
			set_foot(p, size);
#endif

			goto out;
		}

		// 1-2. (free F), inuse L & 1-4. (free F), inuse M
		else {
			//printf("pos_int_free() : 1-2\n");
#if CONSISTENCY == 1
			insert_to_unsorted_log(name, av, p, bck, fwd, size);

			set_foot_log(name, p, size);
			clear_inuse_bit_at_offset_log(name, p, size);
#else
			insert_to_unsorted(av, p, bck, fwd, size);

			set_foot(p, size);
			clear_inuse_bit_at_offset(p, size);
#endif

			goto out;
		}

	}

	// 2. Last chunk
	else if (chunk_is_last(p)) {
		//printf("pos_int_free() : 2\n");
		if (!prev_inuse(p)) {
			prevchunk = prev_chunk(p);
			prevsize = chunksize(prevchunk);

			// 2-1. free F, (free L)
			if (chunk_is_first(prevchunk)) {
				printf("pos_int_free() : 2-1\n");
				//if (av < prevchunk && prevchunk < av+PAGESIZE){
				if((char*)av+sizeof(struct malloc_state) == (char*)prevchunk) {
#if CONSISTENCY == 1
					insert_to_unsorted_log(name, av, p, bck, fwd, size);
  
					set_foot_log(name, p, size);
					clear_inuse_bit_at_offset_log(name, p, size);
#else
					insert_to_unsorted(av, p, bck, fwd, size);
  
					set_foot(p, size);
					clear_inuse_bit_at_offset(p, size);
#endif

					goto out;
				}
				else {
#if CONSISTENCY == 1
					unlink_log(name, prevchunk, bck, fwd);
					size = prevsize+size+2*SIZE_SZ;
					//pos_seg_free(name, (void *)p, size);
					pos_log_insert_malloc_free(name, (unsigned long)p, size);
					POS_WRITE_VAUE(name, (unsigned long *)&av->system_mem, (unsigned long)(av->system_mem-size));
#else
					unlink(prevchunk, bck, fwd);
					size = prevsize+size+2*SIZE_SZ;
					/*if (size%PAGESIZE != 0) {
						errstr = "free(): unmmap size is not page size";
						goto errout;
					}*/
					//FREE((char*)p, size);
					pos_seg_free(name, (void *)p, size);
					/* Dokeu Lee(161223) : Segment counter initialization */
	                                av->segment_counter--;
				#if DK_DEBUG
					printf("pos_seg_free called, segment_counter = %d\n", av->segment_counter);
				#endif
					av->system_mem -= size;
#endif

					goto out;
				}

			}

			// 2-3. free M, (free L)
			else {
				//printf("pos_int_free() : 2-3\n");
#if CONSISTENCY == 1
				unlink_log(name, prevchunk, bck, fwd);
				size += prevsize;
				p = chunk_at_offset(p, -((long) prevsize));
  
				insert_to_unsorted_log(name, av, p, bck, fwd, size);

				set_head_log(name, p, size | LAST_CHUNK | PREV_INUSE);
				set_foot_log(name, p, size);
				clear_inuse_bit_at_offset_log(name, p, size);
#else
				unlink(prevchunk, bck, fwd);
				size += prevsize;
				p = chunk_at_offset(p, -((long) prevsize));
  
				insert_to_unsorted(av, p, bck, fwd, size);

				set_head(p, size | LAST_CHUNK | PREV_INUSE);
				//새로운 세그먼트에서 나머지 부분을 마지막 청크로 기록
				if((unsigned long)av->last_chunk_pointer < (unsigned long)p)
				{
					av->last_chunk_pointer = p;
				}
				set_foot(p, size);
				clear_inuse_bit_at_offset(p, size);
#endif
				goto out;
			}

		}

		// 2-2. inuse F, (free L) & 2-4. inuse M, (free L)
		else {
			//printf("pos_int_free() : 2-2\n");
#if CONSISTENCY == 1
			insert_to_unsorted_log(name, av, p, bck, fwd, size);
  
			set_foot_log(name, p, size);
			clear_inuse_bit_at_offset_log(name, p, size);
#else
			insert_to_unsorted(av, p, bck, fwd, size);
  
			set_foot(p, size);
			clear_inuse_bit_at_offset(p, size);
#endif

			goto out;
		}

	}

	// 3. Middle chunk
	else {
		//printf("pos_int_free() : 3\n");
		nextchunk = next_chunk(p);
		nextsize = chunksize(nextchunk);

		if (!prev_inuse(p)) {
			prevchunk = prev_chunk(p);
			prevsize = chunksize(prevchunk);

			// 3-1. free F, (free M), free L
			if (chunk_is_first(prevchunk) && chunk_is_last(nextchunk) && !inuse(nextchunk) ) {
				//printf("pos_int_free() : 3-1\n");
				//if (av < prevchunk && prevchunk < av+PAGESIZE){
				if((char*)av+sizeof(struct malloc_state) == (char*)prevchunk) {
#if CONSISTENCY == 1
					unlink_log(name, prevchunk, bck, fwd);
					size += prevsize;
					p = chunk_at_offset(p, -((long) prevsize));

					insert_to_unsorted_log(name, av, p, bck, fwd, size);
  
					set_head_log(name, p, size | FIRST_CHUNK | PREV_INUSE);
					set_foot_log(name, p, size);
					clear_inuse_bit_at_offset_log(name, p, size);
#else
					unlink(prevchunk, bck, fwd);
					size += prevsize;
					p = chunk_at_offset(p, -((long) prevsize));

					insert_to_unsorted(av, p, bck, fwd, size);
  
					set_head(p, size | FIRST_CHUNK | PREV_INUSE);
					set_foot(p, size);
					clear_inuse_bit_at_offset(p, size);
  #endif
  
					goto out;
				}

				else {
#if CONSISTENCY == 1
					unlink_log(name, prevchunk, bck, fwd);
					unlink_log(name, nextchunk, bck, fwd);
					p = chunk_at_offset(p, -((long) prevsize));
					size = prevsize+size+nextsize+2*SIZE_SZ;

					pos_log_insert_malloc_free(name, (unsigned long)p, size);
					//pos_seg_free(name, (void *)p, size);
					POS_WRITE_VAUE(name, (unsigned long *)&av->system_mem, (unsigned long)(av->system_mem-size));
#else
					unlink(prevchunk, bck, fwd);
					unlink(nextchunk, bck, fwd);
					p = chunk_at_offset(p, -((long) prevsize));
					size = prevsize+size+nextsize+2*SIZE_SZ;
					/*if (size%PAGESIZE != 0) {
						errstr = "free(): unmmap size is not page size";
						goto errout;
					}*/
					//FREE((char*)p, size);
					pos_seg_free(name, (void *)p, size);
					/* Dokeu Lee(161223) : Segment counter initialization */
	                                av->segment_counter--;
				#if DK_DEBUG
					printf("pos_seg_free called, segment_counter = %d\n", av->segment_counter);
				#endif
					av->system_mem -= size;
  #endif
  
					goto out;
				}
			}

#if CONSISTENCY == 1
			unlink_log(name, prevchunk, bck, fwd);
#else
			unlink(prevchunk, bck, fwd);
#endif
			size += prevsize;
			p = chunk_at_offset(p, -((long) prevsize));

			if (chunk_is_first(prevchunk)) {
#if CONSISTENCY == 1
				set_head_log(name, p, size | FIRST_CHUNK | PREV_INUSE);
#else
				set_head(p, size | FIRST_CHUNK | PREV_INUSE);
				//set_foot(p, size);
				//clear_inuse_bit_at_offset(p, size);
#endif
			}

		}

		nextinuse = inuse_bit_at_offset(nextchunk, nextsize);

		if (!nextinuse) {
#if CONSISTENCY == 1
			unlink_log(name, nextchunk, bck, fwd);
#else
			unlink(nextchunk, bck, fwd);
#endif
			size += nextsize;
		}

#if CONSISTENCY == 1
		insert_to_unsorted_log(name, av, p, bck, fwd, size);

		if (chunk_is_first(p)) {
			set_head_log(name, p, size | FIRST_CHUNK | PREV_INUSE);
		} else if (chunk_is_last(nextchunk)&&!nextinuse) {
			set_head_log(name, p, size | LAST_CHUNK | PREV_INUSE);
		} else {
			set_head_log(name, p, size | PREV_INUSE);
		}
		set_foot_log(name, p, size);
		clear_inuse_bit_at_offset_log(name, p, size);
#else
		//else
		//clear_inuse_bit_at_offset(nextchunk, 0);

		insert_to_unsorted(av, p, bck, fwd, size);

		if (chunk_is_first(p)) {
			set_head(p, size | FIRST_CHUNK | PREV_INUSE);
		} else if (chunk_is_last(nextchunk)&&!nextinuse) {
			set_head(p, size | LAST_CHUNK | PREV_INUSE);
			//새로운 세그먼트에서 나머지 청크를 마지막 청크로 기록
			if((unsigned long)av->last_chunk_pointer < (unsigned long)p)
			{
				av->last_chunk_pointer = p;
			}
		} else {
			set_head(p, size | PREV_INUSE);
		}
		set_foot(p, size);
		clear_inuse_bit_at_offset(p, size);

		//check_free_chunk(av, p);
 #endif
	}

out: 
	if ((unsigned long)(size) >= FASTBIN_CONSOLIDATION_THRESHOLD && have_fastchunks(av)) {
		pos_malloc_consolidate(name, av);
	}
}


/*
  ------------------------------ pos_realloc ------------------------------
*/

////////////////////////////////////////
// WARNING!: pos_realloc has error!. FIX UP!
////////////////////////////////////////
Void_t*
pos_int_realloc(char *name, mstate av, mchunkptr oldp, INTERNAL_SIZE_T oldsize,
	     INTERNAL_SIZE_T nb)
{
	mchunkptr newp;				/* chunk to return */
	INTERNAL_SIZE_T newsize;		/* its size */
	Void_t* newmem;				/* corresponding user mem */

	mchunkptr next;				/* next contiguous chunk after oldp */

	mchunkptr remainder;			/* extra space at end of newp */
	unsigned long remainder_size;	/* its size */

	mchunkptr bck;				/* misc temp for linking */
	mchunkptr fwd;				/* misc temp for linking */

	unsigned long copysize;		/* bytes to copy */
	unsigned int ncopies;			/* INTERNAL_SIZE_T words to copy */
	INTERNAL_SIZE_T* s;			/* copy source */
	INTERNAL_SIZE_T* d;			/* copy destination */

	const char *errstr = NULL;


	/* oldmem size */
	/*if (oldp->size <= 2 * SIZE_SZ || oldsize >= av->system_mem) {
		errstr = "realloc(): invalid old size";
errout:
		malloc_printerr (check_action, errstr, chunk2mem(oldp));
		return NULL;
	}*/

	next = chunk_at_offset(oldp, oldsize);
	INTERNAL_SIZE_T nextsize = chunksize(next);
	/*if (next->size <= 2 * SIZE_SZ || nextsize >= av->system_mem) {
		errstr = "realloc(): invalid next size";
			goto errout;
	}*/

	//old size 보다 작을 경우
	if ((unsigned long)(oldsize) >= (unsigned long)(nb)) {
		/* already big enough; split below */
		newp = oldp;
		newsize = oldsize;
	}

	//old size 보다 클 경우
	else {

		/* Try to expand forward into next chunk;  split off remainder below */
		if (!inuse(next) &&
			(unsigned long)(newsize = oldsize + nextsize) >= (unsigned long)(nb)) {
			newp = oldp;
			unlink(next, bck, fwd);
		}

		/* allocate, copy, free */
		else {
			newmem = pos_int_malloc(name, av, nb - MALLOC_ALIGN_MASK);
			if (newmem == 0)
				return 0; /* propagate failure */

			newp = mem2chunk(newmem);
			newsize = chunksize(newp);

			/*
			  Avoid copy if newp is next chunk after oldp.
			*/
			if (newp == next) {
				newsize += oldsize;
				newp = oldp;
			}
			else {
				/*
				  Unroll copy of <= 36 bytes (72 if 8byte sizes)
				  We know that contents have an odd number of
				  INTERNAL_SIZE_T-sized words; minimally 3.
				*/

				copysize = oldsize - SIZE_SZ;
				s = (INTERNAL_SIZE_T*)(chunk2mem(oldp));
				d = (INTERNAL_SIZE_T*)(newmem);
				ncopies = copysize / sizeof(INTERNAL_SIZE_T);

				if (ncopies > 9)
					memcpy(d, s, copysize);
				else {
					*(d+0) = *(s+0);
					*(d+1) = *(s+1);
					*(d+2) = *(s+2);
					if (ncopies > 4) {
						*(d+3) = *(s+3);
						*(d+4) = *(s+4);
						if (ncopies > 6) {
							*(d+5) = *(s+5);
							*(d+6) = *(s+6);
							if (ncopies > 8) {
								*(d+7) = *(s+7);
								*(d+8) = *(s+8);
							}
						}
					}
				}

				pos_int_free(name, av, oldp, 1);

				return chunk2mem(newp);
			}
		}
	}

	/* If possible, free extra space in old or extended chunk */

	remainder_size = newsize - nb;

	if (remainder_size < MINSIZE) { /* not enough extra to split off */
		set_head_size(newp, newsize);
		set_inuse_bit_at_offset(newp, newsize);
	}
	else { /* split remainder */
		remainder = chunk_at_offset(newp, nb);

		if (chunk_is_last(newp))
		{
			set_head(remainder, remainder_size | LAST_CHUNK | PREV_INUSE);
			//remainder를 마지막 청크로 기록
			if((unsigned long)av->last_chunk_pointer < (unsigned long)remainder)
			{
				av->last_chunk_pointer = remainder;
			}
		}
		else
			set_head(remainder, remainder_size | PREV_INUSE);

		// set PREV_INUSE flag..
		if (chunk_is_first(newp))
			set_head(newp, nb | FIRST_CHUNK | PREV_INUSE);
		else
			set_head(newp, nb | PREV_INUSE);
		
		//set_head_size(newp, nb);
		//set_head(remainder, remainder_size | PREV_INUSE |(av != &main_arena ? NON_MAIN_ARENA : 0));

		/* Mark remainder as inuse so free() won't complain */
		set_inuse_bit_at_offset(remainder, remainder_size);
		pos_int_free(name, av, remainder, 1);
	}

	return chunk2mem(newp);
}



/*
  ------------------------------ pos_malloc_init_state ------------------------------
*/

//static void
/*
void
pos_malloc_init_state(char *name, mstate av)
{
	mchunkptr	first_chunk;
	unsigned long	first_size;
	mchunkptr	last_chunk;
	unsigned long	last_size;

	mchunkptr       bck;
	mchunkptr       fwd;

	int	i;
	mbinptr	bin;


	// initialize malloc_state
#if CONSISTENCY == 1
	set_init_key_log(name, av);
#else
	set_init_key(av);
#endif

// Below codes don't need logging.

	//for test
	//printf("======================= FOR TEST ========================\n");
	//printf("size of malloc_state =%lu\n", sizeof(struct malloc_state));
	//printf("=========================================================\n");


	//mutex init
	mutex_init(&av->mutex);
		   
	for (i=1; i < NBINS; i++) {
		bin = bin_at(av,i);
		bin->fd = bin->bk = bin;
	}

	//set_max_fast(DEFAULT_MXFAST);
	clear_fastchunks(av);
	for (i=0; i< NFASTBINS ; i++) {
		av->fastbinsY[i] = 0;
	}

	// first chunk
	first_chunk = chunk_at_offset(av, sizeof(struct malloc_state));
//170908
//	first_size = (PAGESIZE - sizeof(struct malloc_state) - 4*SIZE_SZ)/2;
first_size = (PAGESIZE - sizeof(struct malloc_state) - 4*SIZE_SZ)/2;
	//printf("first chunk size = %d\n", first_size);
	//printf("size_sz =%d\n", SIZE_SZ);
       
	//first_size = 0;
//#endif
//170907
//insert_to_unsorted(av, first_chunk, bck, fwd, first_size);

    	set_head(first_chunk, first_size | FIRST_CHUNK | PREV_INUSE);
	//set_head(first_chunk, first_size | FIRST_CHUNK);
	set_foot(first_chunk, first_size);
	clear_inuse_bit_at_offset(first_chunk, first_size);
	//printf("[DEBUG] pos_malloc_init_state(): first address = %p\n", first_chunk);
	//printf("[DEBUG] first : chunk_is_first? : %d\n", chunk_is_first(first_chunk));
	//printf("[DEBUG] first : chunk_is_last? : %d\n", chunk_is_last(first_chunk));
	//printf("[DEBUG] first : value = %d\n", first_size|FIRST_CHUNK|PREV_INUSE);

	// last_chunk
	last_chunk = chunk_at_offset(first_chunk, first_size);
	//last_size = first_size;
//#if CONSISTENCY == 1
	////last_size = (128*1024)*4096 + 944; // 536867760
	//last_size = (256*1024)*4096 - first_size - 2*SIZE_SZ;
	//last_size = request2size(last_size); // 536874032
//#else
//	last_size = 988;
//	last_size = 1480;
     	last_size = first_size;

#if SB_DEBUG
	printf("[sb debug : %s] first chunk : %p\n", __func__, first_chunk);
	printf("[sb debug : %s] last chunk : %p\n", __func__, last_chunk);
#endif
//#endif
#if SB_DEBUG
	printf("[sb debug : %s] 1 bck : %p, fwd : %p\n", __func__, bck, fwd);
	usleep(10);
#endif
	insert_to_unsorted(av, last_chunk, bck, fwd, last_size);
//170907
#if SB_DEBUG
	printf("[sb debug : %s] 2 bck : %p, fwd : %p\n", __func__, bck, fwd);
	usleep(10);
#endif
	insert_to_unsorted(av, first_chunk, bck, fwd, first_size);

	set_head(last_chunk, last_size | LAST_CHUNK | PREV_INUSE);
	//마지막 청크 초기화
	av->last_chunk_pointer = last_chunk;
	set_foot(last_chunk, last_size);
	clear_inuse_bit_at_offset(last_chunk, last_size);
	//printf("[DEBUG] pos_malloc_init_state(): last address = %p\n", last_chunk);
	//printf("[DEBUG] last : chunk_is_first? : %d\n", chunk_is_first(last_chunk));
	//printf("[DEBUG] last : chunk_is_last? : %d\n", chunk_is_last(last_chunk));

	//다음 세그먼트 관리를 위한 메타데이터 초기화
	set_next_seg_pointer(last_chunk, last_size, 0);
	mchunkptr temp_p;
	temp_p = next_seg(last_chunk, last_size);
	temp_p = (mchunkptr)((char*)last_chunk + chunksize(last_chunk)+SIZE_SZ);
	
	av->last_remainder = 0;
	for (i=0; i<BINMAPSIZE; i++) {
		av->binmap[i] = 0;
	}
	av->system_mem = PAGESIZE;

	av->prime_obj = NULL;
	
	// Dokeu Lee(161223) : Segment counter initialization
	av->segment_counter = 0;

	// SSB for gc_list
	gc_list.head = gc_list.tail = NULL;
}
*/
//static void 

//170908
void
pos_malloc_init_state(char *name, mstate av)
{
	mchunkptr	first_chunk;
	unsigned long	first_size;
	mchunkptr	last_chunk;
	unsigned long	last_size;

	mchunkptr       bck;
	mchunkptr       fwd;

	int	i;
	mbinptr	bin;


	// init mutex key

	// initialize malloc_state
#if CONSISTENCY == 1
	set_init_key_log(name, av);
#else
	set_init_key(av);
#endif

// Below codes don't need logging.

	for (i=1; i < NBINS; i++) {
		bin = bin_at(av,i);
		bin->fd = bin->bk = bin;
	}

	//set_max_fast(DEFAULT_MXFAST);
	clear_fastchunks(av);
	for (i=0; i< NFASTBINS ; i++) {
		av->fastbinsY[i] = 0;
	}

	// first chunk
	first_chunk = chunk_at_offset(av, sizeof(struct malloc_state));
	//first_size = (PAGESIZE - sizeof(struct malloc_state) - 2*SIZE_SZ)/2;	// 956
	//dk s
	first_size = (PAGESIZE - sizeof(struct malloc_state) - 4*SIZE_SZ)/2;	// 4kb - 2172 - 16
	first_size = 0;
	//printf("mstate size = %lu\n", sizeof(struct malloc_state));
	//printf("page size = %d\n", PAGESIZE);
	//printf("first chunk size = %lu\n", first_size);
	//printf("SIZE_SZ size = %lu\n", SIZE_SZ);
	//dk e
   

//#if CONSISTENCY == 1
	//first_size = (128*1024-1)*4096 + 960; //536867776
	//first_size = request2size(first_size); // 536867792
//#else
	//dk s
//	first_size = 0;
	//dk e
//#endif
//insert_to_unsorted(av, first_chunk, bck, fwd, first_size);

	set_head(first_chunk, first_size | FIRST_CHUNK | PREV_INUSE);
	set_foot(first_chunk, first_size);
	clear_inuse_bit_at_offset(first_chunk, first_size);
	//dk s
	//insert_to_unsorted(av, first_chunk, bck, fwd, first_size);
	//dk e

	// last_chunk
	last_chunk = chunk_at_offset(first_chunk, first_size);
	//last_size = first_size;
//#if CONSISTENCY == 1
	////last_size = (128*1024)*4096 + 944; // 536867760
	//last_size = (256*1024)*4096 - first_size - 2*SIZE_SZ;
	//last_size = request2size(last_size); // 536874032
//#else
//	last_size = 988;
	//dk s
	//last_size = 1456;
	//last_size = first_size;
	last_size = 1480;
	//dk e
//#endif
	insert_to_unsorted(av, last_chunk, bck, fwd, last_size);

	set_head(last_chunk, last_size | LAST_CHUNK | PREV_INUSE);
	//dk s
	//av->last_chunk_pointer = last_chunk;
	//if((unsigned long)av->last_chunk_pointer < (unsigned long)last_chunk)
	//{
	//	printf("remainder : %p, is_last : %lu\n", last_chunk, chunk_is_last(last_chunk));
	av->last_chunk_pointer = last_chunk;
	//}
	//dk e
	set_foot(last_chunk, last_size);
	clear_inuse_bit_at_offset(last_chunk, last_size);

	//dk s
	set_next_seg_pointer(last_chunk, last_size, 0);
	mchunkptr temp_p;
	temp_p = next_seg(last_chunk, last_size);
	//printf("temp_p : %p\n", temp_p);
	temp_p = (mchunkptr)((char*)last_chunk + chunksize(last_chunk)+SIZE_SZ);
	//printf("next seg : %lu\n", chunksize(temp_p));
	
	//dk e
	av->last_remainder = 0;
	for (i=0; i<BINMAPSIZE; i++) {
		av->binmap[i] = 0;
	}
	av->system_mem = PAGESIZE;

	av->prime_obj = NULL;

	av->segment_counter = 0;
	gc_list.head = gc_list.tail = NULL;
	//sb s
	//av->total_alloc_size = 0;
	//sb e
}

/*
  ------------------------------ pos_malloc_wrapper ------------------------------
*/

Void_t*
pos_public_mALLOc(char *name, unsigned long _bytes) 
{
	struct malloc_state *ar_ptr;
	Void_t *victim = NULL;
	size_t bytes = _bytes;

	/*if (pos_is_mapped(name) == 0) {
		//printf("Not mapped\n");
		return NULL;
	}*/
	

	ar_ptr = (struct malloc_state *)pos_lookup_mstate(name);
	if (ar_ptr == NULL) {
		return NULL;
	}
	
	//if(*((size_t *)ar_ptr) == POS_MAGIC)
	if (!have_init_key(ar_ptr)) {
		pos_malloc_init_state(name, ar_ptr);
	}

	(void)mutex_lock(&ar_ptr->mutex);
	victim = pos_int_malloc(name, ar_ptr, bytes);
	// SSB for btree
	insertNode((unsigned long)victim);
	if (listCnt < 100)
		listCnt++;
	//printNodes();
	//end
	#if SB_DEBUG
	printf("new chunk %p is allocated\n", victim);
	#endif
	(void)mutex_unlock(&ar_ptr->mutex);

#if POS_GC_DEBUG == 1
	total_chunks_size += chunksize(mem2chunk(victim));
#endif

	return victim;
}

/*
  ------------------------------ pos_free_wrapper ------------------------------
*/

void
pos_public_fREe(char *name, Void_t *mem)
{
	struct malloc_state * ar_ptr;
	mchunkptr p;


	/*if (pos_is_mapped(name) == 0) {
		//printf("Not mapped\n");
		return ;
	}*/

	if (mem == (Void_t *)0)
		return;

	p = mem2chunk(mem);

	ar_ptr = (struct malloc_state *)pos_lookup_mstate(name);
	if (ar_ptr == NULL) {
		return;
	}

	(void)mutex_lock(&ar_ptr->mutex);
	pos_int_free(name, ar_ptr, p, 1);
	(void)mutex_unlock(&ar_ptr->mutex);
}


/*
  ------------------------------ pos_realloc_wrapper ------------------------------
*/

Void_t*
pos_public_rEALLOc(char *name, Void_t *oldmem, unsigned long _bytes)
{
	mstate ar_ptr;
	INTERNAL_SIZE_T nb;      /* padded request size */

	Void_t* newp;             /* chunk to return */

	size_t bytes = _bytes;

	/*if (bytes == 0 && oldmem != NULL) {
		pos_public_fREe(name, oldmem);
		return NULL;
	}*/

	/* realloc of null is supposed to be same as malloc */
	if (oldmem == 0)
		return pos_public_mALLOc(name, bytes);


	/* chunk corresponding to oldmem */
	const mchunkptr oldp = mem2chunk(oldmem);
	/* its size */
	const INTERNAL_SIZE_T oldsize = chunksize(oldp);

	/* Little security check which won't hurt performance: the
	    allocator never wrapps around at the end of the address space.
	    Therefore we can exclude some size values which might appear
	    here by accident or by "design" from some intruder. */
	/*if (__builtin_expect ((uintptr_t) oldp > (uintptr_t) -oldsize, 0)
		|| __builtin_expect (misaligned_chunk (oldp), 0))
	{
		malloc_printerr (check_action, "realloc(): invalid pointer", oldmem);
		return NULL;
	}*/

	checked_request2size(bytes, nb);

	ar_ptr = (struct malloc_state *)pos_lookup_mstate(name);
	if (ar_ptr == NULL) {
		return NULL;
	}

	(void)mutex_lock(&ar_ptr->mutex);
	newp = pos_int_realloc(name, ar_ptr, oldp, oldsize, nb);
	(void)mutex_unlock(&ar_ptr->mutex);

	if (newp == NULL) {
		/* Try harder to allocate memory in other arenas.  */
		newp = pos_public_mALLOc(name, bytes);
		if (newp != NULL) {
			memcpy (newp, oldmem, oldsize - SIZE_SZ);
			
			(void)mutex_lock(&ar_ptr->mutex);
			pos_int_free(name, ar_ptr, oldp, 1);
			(void)mutex_unlock(&ar_ptr->mutex);
		}
	}

	return newp;
}


/*
  ------------------------------ pos_set_prime_object ------------------------------
*/

void
pos_set_prime_object(char *name, void *obj)
{
	struct malloc_state *ar_ptr;

	ar_ptr = (struct malloc_state *)pos_lookup_mstate(name);
#if SB_DEBUG
	usleep(10);
	printf("[sb debug : %s] name : %s, ar_ptr : %p, obj : %p\n", __func__, name, ar_ptr, obj);
	usleep(10);
#endif
	if (ar_ptr == NULL) {
#if SB_DEBUG
	printf("[sb debug : %s] returned!\n", __func__);
	usleep(10);
#endif
		return;
	}

	ar_ptr->prime_obj = obj;

#if SB_DEBUG
	printf("[sb debug : %s] name : %s, ar_ptr->prime_obj : %p, obj : %p\n", __func__, name, ar_ptr->prime_obj, obj);
	usleep(10);
#endif
/*#if CONSISTENCY == 1
	POS_WRITE_VAUE(name, (unsigned long *)&ar_ptr->prime_obj, (unsigned long)obj);
#else
	ar_ptr->prime_obj = obj;
#endif*/ 
}


void *
pos_get_prime_object(char *name)
{
	struct malloc_state *ar_ptr;

	ar_ptr = (struct malloc_state *)pos_lookup_mstate(name);
	if (ar_ptr == NULL) {
		return NULL;
	}

	return ar_ptr->prime_obj;
}


/*
  ------------------------------ pos_test_function ------------------------------
*/
void
pos_print_free_chunks(char *name)
{
	struct malloc_state * av;
	mbinptr	bin;
	mchunkptr p;
	int i;


	av = (struct malloc_state *)pos_lookup_mstate(name);
	if (av == NULL || !have_init_key(av)) {
		printf("\n     Can't print free chunks.\n");
		return;
	}

	printf("\n      ******************** Free chunks of `%s` ************************\n", name);

	printf("      *  1. Fast bins(0~7)\n");
	for (i=0; i< NFASTBINS ; i++) {
		p = (mchunkptr)fastbin(av, i);
		while (p!=0) {
			printf("      *    [%3d] addr=0x%lX, size=%lu", i, (unsigned long int)p, (unsigned long int)chunksize(p));
			if (chunk_is_first(p)) printf("(F)\n");
			else if (chunk_is_last(p)) printf("(L)\n");
			else printf("(M)\n");
			p = p->fd;
		}
	}

	printf("      *  2. Unsorted(1) / Small(2~63) / Large(64~128) bins\n");
	for (i=1; i < NBINS; i++) {
		bin = bin_at(av,i);
		p = bin->fd;
		while (p != bin) {
			printf("      *    [%3d] addr=0x%lX, size=%lu", i, (unsigned long int)p, (unsigned long int)chunksize(p));
			if (chunk_is_first(p)) printf("(F)\n");
			else if (chunk_is_last(p)) printf("(L)\n");
			else printf("(M)\n");
			p = p->fd;
		}
	}

	printf("      ***********************************************************************\n");
}

/*

  ------------------------------ pos_unsafe_pointer_function ------------------------------
*/

/* HEAPO (Cheolhee Lee) */

// Call unsafe Pointer Check
void pos_check_unsafe_pointer(char *name)
{
    struct malloc_state * av;
    struct pos_name_entry *name_entry;
    mchunkptr chunk_ptr;
    struct seg_info *head;
    int i = 1;

    av = (struct malloc_state *)pos_lookup_mstate(name);	
    if(av == NULL)   
        printf("Not Allocate Memory\n");

    name_entry = pos_lookup_name_entry(name);
    name_entry->seg_head = (struct seg_info *)malloc(sizeof(struct seg_info) * 1024);
    memset(name_entry -> seg_head, 0, sizeof(struct seg_info) * 1024);

    //Search Seg_info System call
    syscall(306 , name , name_entry -> seg_head);
    head = name_entry -> seg_head;	

    // First Segment
    chunk_ptr = chunk_at_offset(av, sizeof(struct malloc_state));
    pos_check_unsafe_segment(name, av, head, chunk_ptr);

    // Other Segment
    while(head[i].addr != 0)
    {
        pos_check_unsafe_segment(name, av, head, (Void_t *)head[i].addr);
	i++;
    }
}

void pos_check_unsafe_segment(char *name, mstate av, struct seg_info *head, Void_t *first_chunk)
{
    mchunkptr chunk_ptr;

    chunk_ptr = (mchunkptr)first_chunk;
    while(1)
    {
        //inuse Chunk
	if(inuse(chunk_ptr)){
	    printf("Node Address : %p" , chunk2mem(chunk_ptr));
	    pos_check_unsafe_region(name, av, head, chunk_ptr);
	    printf("\n");
	}
	if(chunk_is_last(chunk_ptr))
	    break;

	chunk_ptr = next_chunk(chunk_ptr);		
    }
}

// pointer detection
Void_t* lookup_pointer(mchunkptr p , unsigned long offset)
{
    Void_t *node;	
	
    node = chunk2mem(p);
    return *(void **)(node + offset);	
}

// Persistent Region address check
int check_valid_address(struct seg_info *head, Void_t *ptr)
{
    int i = 0;

    while(head[i].addr != 0)
    {
        if((ptr >= (void *)head[i].addr) && (ptr < (void *)(head[i].addr + head[i].size)))
            return 1;
        i++;
    }
    return 0;
}

// Chunk_Check 
void pos_check_unsafe_region(char *name, mstate av, struct seg_info *head, mchunkptr chunk_ptr)
{
    int i;
    Void_t *ptr;
    Void_t *new_ptr;
	
    for(i = 0; i < 50; i++)
    {
        if(av -> node_obj.ptr_offset[i] == 0)
	    break;

	ptr = lookup_pointer(chunk_ptr, av->node_obj.ptr_offset[i]);
	if((!check_valid_address(head, ptr)) && ptr != NULL)
	{	
	    new_ptr = pos_unsafe_region_relocate(name, av, ptr);
	    chunk_change_pointer(chunk_ptr, new_ptr, av->node_obj.ptr_offset[i]);
	}		
    }	
}

// Change Pointer
void chunk_change_pointer(mchunkptr chunk_ptr, Void_t *p , unsigned long offset)
{
    Void_t *mem_ptr;

    mem_ptr = chunk2mem(chunk_ptr) + offset;
    memcpy(mem_ptr, &p, sizeof(Void_t *));
}


// unsafe(Volatile) -> safe(Non-Volatile)
Void_t* pos_unsafe_region_relocate(char *name, mstate av, Void_t *p)
{
    mchunkptr chunk_ptr;
    mchunkptr next_chunk_ptr;
    Void_t *new_addr;
    Void_t *mem_ptr;
    Void_t *next_mem_ptr;
    int i,j;

    chunk_ptr = mem2chunk(p);
    new_addr = pos_malloc(name , av -> node_obj.size);
    memcpy(new_addr , p , av -> node_obj.size);	    
    printf(" --->     NodePtr : %p" , p);
    printf(" --->     NewPtr : %p" , new_addr);

    for(i = 0; i < 50; i++)
    {
        if(av->node_obj.ptr_offset[i] == 0)
	    break;

	mem_ptr = lookup_pointer(mem2chunk(new_addr), av->node_obj.ptr_offset[i]);
	if(mem_ptr == NULL)
	    break;

	for(j = 0; j < 50; j++)
	{
	    if(av->node_obj.ptr_offset[j] == 0)
	        break;

	    next_mem_ptr = lookup_pointer(mem2chunk(mem_ptr), av->node_obj.ptr_offset[j]);
	    if(next_mem_ptr == NULL)
  	        break;

	    if(next_mem_ptr == p){
	        chunk_change_pointer(mem2chunk(mem_ptr), new_addr, av->node_obj.ptr_offset[j]);   
		}
	}	
    }
    return new_addr;
}
