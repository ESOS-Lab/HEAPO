/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/


/*
# Makefile
all : malloc_free

malloc_free : pos-lib.o pos-malloc.o
	gcc -o malloc_free malloc_free.c  pos-lib.o pos-malloc.o -lrt

pos-lib.o :
	gcc -c -o pos-lib.o pos-lib.c

pos-malloc.o : 
	gcc -c -o pos-malloc.o pos-malloc.c

clean : 
	rm *.o malloc_free

*/


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <pos-lib.h>


struct pos_list
{
	unsigned long data[127];
	struct pos_list *next;
};

struct pos_list1
{
	unsigned long data[3];
	struct pos_list *next;
};
struct pos_list2
{
	unsigned long data[6];
	struct pos_list *next;
};



void default_test(void)
{

}


void persistency_test(void)
{
	struct pos_list *head, *node;


	srand((int)time(NULL));

	// Object 1
	pos_map("object_1");

	head = pos_get_prime_object("object_1");

	printf("  Before pos_malloc()\n");
	printf("    1) Free objects");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse objects\n");
	node = head;
	while (node) {
		printf("      object = 0x%lX, object's data = %lu\n", (unsigned long)node, node->data[0]);
		node = node->next;
	}
	printf("\n");

	node = (struct pos_list *)pos_malloc("object_1", sizeof(struct pos_list));
	node->data[0] = rand()%100;
	node->next = head;
	head = node;
	pos_set_prime_object("object_1", head);

	printf("  After pos_malloc()\n");
	printf("    1) Free objects");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse objects\n");
	node = head;
	while (node) {
		printf("      object = 0x%lX, object's data = %lu\n", (unsigned long)node, node->data[0]);
		node = node->next;
	}
	printf("\n");

	pos_unmap("object_1");
}

void realloc_test(void)
{
	struct pos_list1 *node1;
	struct pos_list2 *node2;


	pos_map("object_1");

	node1 = (struct pos_list1 *)pos_malloc("object_1", sizeof(struct pos_list1));
	node1->data[0] = 10;
	node1->data[1] = 20;
	node1->data[2] = 30;

	node2 = (struct pos_list2 *)pos_realloc("object_1", node1, sizeof(struct pos_list2));
	printf("%d %d %d\n", (int)node2->data[0], (int)node2->data[1], (int)node2->data[2]);

	printf("0x%lX 0x%lX\n", (unsigned long)node1, (unsigned long)node2);

	pos_unmap("object_1");
}


// 1-1
void victimF_freeL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	
	
	printf("Test case : 1-1. (victim First)-(free Last)\n\n");
	
	pos_map("object_1");

	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 2024);
	printf("  After chunk3=pos_malloc(object1, 2024)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	pos_unmap("object_1");
}

// 1-2
void victimF_inuseL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	
	
	printf("Test case : 1-2. (victim First)-(inuse Last)\n\n");
	
	pos_map("object_1");

	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	
	chunk3 = (char *)pos_malloc("object_1", 2024);
	printf("  After chunk3=pos_malloc(object1, 2024)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 2024);
	printf("  After chunk4=pos_malloc(object2, 2024)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_unmap("object_1");
}

// 1-3
void victimF_freeM(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	
	
	printf("Test case : 1-3. (victim First)-(free Middle)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk3=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk4=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk5=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_unmap("object_1");
}

// 1-4
void victimF_inuseM(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	
	
	printf("Test case : 1-4. (victim First)-(inuse Middle)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk3=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk4=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk5=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_unmap("object_1");
}

// 2-1
void freeF_victimL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	
	
	printf("Test case : 2-1. (free First)-(victim Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 2024);
	printf("  After chunk3=pos_malloc(object1, 2024)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 2024);
	printf("  After chunk4=pos_malloc(object1, 2024)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	pos_unmap("object_1");
}

// 2-2
void inuseF_victimL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	
	
	printf("Test case : 2-2. (inuse First)-(victim Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 2024);
	printf("  After chunk3=pos_malloc(object1, 2024)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 2024);
	printf("  After chunk4=pos_malloc(object1, 2024)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	pos_unmap("object_1");
}

// 2-3
void freeM_victimL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	
	
	printf("Test case : 2-3. (free Middle)-(victim Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk3=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk4=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk5=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	pos_unmap("object_1");
}

// 2-4
void inuseM_victimL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	
	
	printf("Test case : 1-4. (inuse Middle)-(victim Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk3=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk4=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk5=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_unmap("object_1");
}

// 3-1
void freeF_victimM_freeL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	
	
	printf("Test case : 3-1. (free First)-(victim Middle)-(free Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk3=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk4=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk5=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	pos_unmap("object_1");
}

// 3-2
void inuseF_victimM_freeL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	
	
	printf("Test case : 3-2. (inuse First)-(victim Middle)-(free Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk3=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk4=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk5=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	pos_unmap("object_1");
}

// 3-3
void freeF_victimM_inuseL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	
	
	printf("Test case : 3-3. (free First)-(victim Middle)-(inuse Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk3=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk4=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 1344);
	printf("  After chunk5=pos_malloc(object1, 1344)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	pos_unmap("object_1");
}

// 3-4
void freeF_victimM_freeM(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	char *chunk6;
	char *chunk7;
	
	
	printf("Test case : 3-4. (free First)-(victim Middle)-(free Middle)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk3=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk4=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk5=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	chunk6 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk6=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n\n", (unsigned long int)chunk6, (unsigned long int)chunk6);

	chunk7 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk7=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk3);
	printf("  After pos_free(object1, chunk3)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_unmap("object_1");
}

// 3-5
void freeM_victimM_freeL(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	char *chunk6;
	char *chunk7;
	
	
	printf("Test case : 3-5. (free Middle)-(victim Middle)-(free Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk3=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk4=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk5=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	chunk6 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk6=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n\n", (unsigned long int)chunk6, (unsigned long int)chunk6);

	chunk7 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk7=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk7);
	printf("  After pos_free(object1, chunk7)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n\n", (unsigned long int)chunk6, (unsigned long int)chunk6);

	pos_free("object_1", chunk6);
	printf("  After pos_free(object1, chunk6)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	pos_unmap("object_1");
}

// 3-6
void freeM_victimM_freeM(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	char *chunk6;
	char *chunk7;
	
	
	printf("Test case : 3-6. (free Middle)-(victim Middle)-(free Middle)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk3=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk4=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk5=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	chunk6 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk6=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n\n", (unsigned long int)chunk6, (unsigned long int)chunk6);

	chunk7 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk7=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk6);
	printf("  After pos_free(object1, chunk6)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_unmap("object_1");
}

// 3-7
void inuseM_victimM_freeM(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	char *chunk6;
	char *chunk7;
	
	
	printf("Test case : 3-7. (inuse Middle)-(victim Middle)-(free Middle)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk3=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk4=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk5=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	chunk6 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk6=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n\n", (unsigned long int)chunk6, (unsigned long int)chunk6);

	chunk7 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk7=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk6);
	printf("  After pos_free(object1, chunk6)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_unmap("object_1");
}

// 3-8
void freeM_victimM_inuseM(void)
{
	char *chunk1;
	char *chunk2;
	char *chunk3;
	char *chunk4;
	char *chunk5;
	char *chunk6;
	char *chunk7;
	
	
	printf("Test case : 3-5. (free Middle)-(victim Middle)-(inuse Last)\n\n");
	
	pos_map("object_1");
	
	printf("  Before chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	
	chunk1 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk1=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n\n", (unsigned long int)chunk1, (unsigned long int)chunk1);

	chunk2 = (char *)pos_malloc("object_1", 944);
	printf("  After chunk2=pos_malloc(object1, 944)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n\n", (unsigned long int)chunk2, (unsigned long int)chunk2);

	chunk3 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk3=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n\n", (unsigned long int)chunk3, (unsigned long int)chunk3);

	chunk4 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk4=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n\n", (unsigned long int)chunk4, (unsigned long int)chunk4);

	chunk5 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk5=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n\n", (unsigned long int)chunk5, (unsigned long int)chunk5);

	chunk6 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk6=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n\n", (unsigned long int)chunk6, (unsigned long int)chunk6);

	chunk7 = (char *)pos_malloc("object_1", 800);
	printf("  After chunk7=pos_malloc(object1, 800)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk4 = 0x%lX (%lu)\n", (unsigned long int)chunk4, (unsigned long int)chunk4);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk4);
	printf("  After pos_free(object1, chunk4)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk5 = 0x%lX (%lu)\n", (unsigned long int)chunk5, (unsigned long int)chunk5);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_free("object_1", chunk5);
	printf("  After pos_free(object1, chunk5)\n");
	printf("    1) Free chunks");
	pos_print_free_chunks("object_1");
	printf("    2) Inuse chunks\n");
	printf("      Allocated location of chunk1 = 0x%lX (%lu)\n", (unsigned long int)chunk1, (unsigned long int)chunk1);
	printf("      Allocated location of chunk2 = 0x%lX (%lu)\n", (unsigned long int)chunk2, (unsigned long int)chunk2);
	printf("      Allocated location of chunk3 = 0x%lX (%lu)\n", (unsigned long int)chunk3, (unsigned long int)chunk3);
	printf("      Allocated location of chunk6 = 0x%lX (%lu)\n", (unsigned long int)chunk6, (unsigned long int)chunk6);
	printf("      Allocated location of chunk7 = 0x%lX (%lu)\n\n", (unsigned long int)chunk7, (unsigned long int)chunk7);

	pos_unmap("object_1");
}

// self test
void self_test(void)
{

}

int main(int argc, char *argv[])
{
	printf("\nPOS test start\n\n");

	if (argc == 1) {
		default_test();
		return 0;
	}

	if (strcmp(argv[1], "create") == 0) {
		pos_create("object_1");
		pos_create("object_2");
		pos_unmap("object_1");
		pos_unmap("object_2");
	} else if (strcmp(argv[1], "delete") ==0) {
		pos_map("object_1");
		pos_delete("object_1");
		pos_map("object_2");
		pos_delete("object_2");
	} else if (strcmp(argv[1], "persistency") ==0) {
		persistency_test();
	} else if (strcmp(argv[1], "realloc") == 0) {
		realloc_test();
	} else if (strcmp(argv[1], "1-1") == 0) {
		victimF_freeL();
	} else if (strcmp(argv[1], "1-2") == 0 ) {
		victimF_inuseL();
	} else if (strcmp(argv[1], "1-3") == 0 ) {
		victimF_freeM();
	} else if (strcmp(argv[1], "1-4") == 0 ) {
		victimF_inuseM();
	} else if (strcmp(argv[1], "2-1") == 0 ) {
		freeF_victimL();
	} else if (strcmp(argv[1], "2-2") == 0 ) {
		inuseF_victimL();
	} else if (strcmp(argv[1], "2-3") == 0 ) {
		freeM_victimL();
	} else if (strcmp(argv[1], "2-4") == 0 ) {
		inuseM_victimL();
	} else if (strcmp(argv[1], "3-1") == 0 ) {
		freeF_victimM_freeL();
	} else if (strcmp(argv[1], "3-2") == 0 ) {
		inuseF_victimM_freeL();
	} else if (strcmp(argv[1], "3-3") == 0 ) {
		freeF_victimM_inuseL();
	} else if (strcmp(argv[1], "3-4") == 0 ) {
		freeF_victimM_freeM();
	} else if (strcmp(argv[1], "3-5") == 0 ) {
		freeM_victimM_freeL();
	} else if (strcmp(argv[1], "3-6") == 0 ) {
		freeM_victimM_freeM();
	} else if (strcmp(argv[1], "3-7") == 0 ) {
		inuseM_victimM_freeM();
	} else if (strcmp(argv[1], "3-8") == 0 ) {
		freeM_victimM_inuseM();
	} else {
		printf("Invalid test case\n");
	}
	

	printf("\n");

	return 0;
}

