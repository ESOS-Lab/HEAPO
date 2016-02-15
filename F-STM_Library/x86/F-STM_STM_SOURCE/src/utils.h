/*
 * File:
 *   utils.h
 * Author(s):
 *   Pascal Felber <pascal.felber@unine.ch>
 *   Patrick Marlier <patrick.marlier@unine.ch>
 * Description:
 *   Utilities functions.
 *
 * Copyright (c) 2007-2014.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation, version 2
 * of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * This program has a dual license and can also be distributed
 * under the terms of the MIT license.
 */

#ifndef _UTILS_H_
#define _UTILS_H_

#include <stdio.h>
#include <stdlib.h>
#include <pos-lib.h> 
#include "esos_header.h"
#define COMPILE_TIME_ASSERT(pred)       switch (0) { case 0: case pred: ; }
#define KEONWOO_DEBUG 1
#ifdef DEBUG2
# ifndef DEBUG
#  define DEBUG
# endif /* ! DEBUG */
#endif /* DEBUG2 */
#ifdef DEBUG
/* Note: stdio is thread-safe */
# define IO_FLUSH                       fflush(NULL)
# define PRINT_DEBUG(...)               printf(__VA_ARGS__); fflush(NULL)
#else /* ! DEBUG */
# define IO_FLUSH
# define PRINT_DEBUG(...)
#endif /* ! DEBUG */

#ifdef DEBUG2
# define PRINT_DEBUG2(...)              PRINT_DEBUG(__VA_ARGS__)
#else /* ! DEBUG2 */
# define PRINT_DEBUG2(...)
#endif /* ! DEBUG2 */

#define XSTR(s)                         STR(s)
#define STR(s)                          #s

#ifndef CACHELINE_SIZE
/* It ensures efficient usage of cache and avoids false sharing.
 * It could be defined in an architecture specific file. */
# define CACHELINE_SIZE                 64
#endif

#if defined(__GNUC__) || defined(__INTEL_COMPILER)
# define likely(x)                      __builtin_expect(!!(x), 1)
# define unlikely(x)                    __builtin_expect(!!(x), 0)
# define INLINE                         inline __attribute__((always_inline))
# define NOINLINE                       __attribute__((noinline))
# if defined(__INTEL_COMPILER)
#  define ALIGNED                       /* Unknown */
# else /* ! __INTEL_COMPILER */
#  define ALIGNED                       __attribute__((aligned(CACHELINE_SIZE)))
# endif /* ! __INTEL_COMPILER */
#else /* ! (defined(__GNUC__) || defined(__INTEL_COMPILER)) */
# define likely(x)                      (x)
# define unlikely(x)                    (x)
# define INLINE                         inline
# define NOINLINE                       /* None in the C standard */
# define ALIGNED                        /* None in the C standard */
#endif /* ! (defined(__GNUC__) || defined(__INTEL_COMPILER)) */

/*
 * malloc/free wrappers.
 */
static INLINE void*
xmalloc(size_t size)
{
  void *memptr = malloc(size);
  if (unlikely(memptr == NULL)) {
    perror("malloc");
    exit(1);
  }
  return memptr;
}

static INLINE void*
xcalloc(size_t count, size_t size)
{
  void *memptr = calloc(count, size);
  if (unlikely(memptr == NULL)) {
    perror("calloc");
    exit(1);
  }
  return memptr;
}

static INLINE void*
xrealloc(void *addr, size_t size)
{
  addr = realloc(addr, size);
  if (unlikely(addr == NULL)) {
    perror("realloc");
    exit(1);
  }
  return addr;
}
static INLINE void
xfree(void *mem)
{
  free(mem);
}
/* Keonwoo pos_posix_memalign modification */

#if HEAP_TINY_FLAGS == 1 
#include<errno.h> 
#include<stdint.h>
#include<pthread.h> 
static INLINE 
int pos_posix_memalign( char *name, void **res, size_t align, size_t len ){ 
	unsigned char *_mem, *_new , *_end ; 	
	size_t header ,footer ; 	
	if(( align & -align )!= align ) return EINVAL ; 	
	if( len < SIZE_MAX - align) return ENOMEM ; 	
	if( align <= 4 * sizeof(size_t)){ 
		if(!(_mem = pos_malloc(name , len)))return -1; 	
		*res = _mem ; 	
		return 0 ; 			
	}
	if(!(_mem = pos_malloc(name , (len+align-1))))return -1;	
	header = ((size_t *)_mem)[-1] ; 
	_end = _mem + (header&-8) ; 	
	footer = ((size_t *)_end)[-2] ; 	
	_new = (void *)((uintptr_t)_mem + align-1 & -align) ; 	
	if( !(header & 7)){ 
		((size_t *)_new)[-2] = ((size_t *)_mem)[-2] + (_new - _mem) ; 	
		((size_t *)_new)[-1] = ((size_t *)_mem)[-1] - (_new - _mem) ; 	
		*res = _new ; 	
		return 0 ; 	
	}
	((size_t *)_mem)[-1] = header&7 | _new - _mem ; 	
	((size_t *)_new)[-2] = footer&7 | _new - _mem ; 	
	((size_t *)_new)[-1] = header&7 | _end - _new ; 	
	((size_t *)_end)[-2] = footer&7 | _end - _new ; 	
	if( _new != _mem) free(_mem) ; 	
	*res = _new ; 	
	return 0 ; 
}
 
static unsigned long tx_count = 0 ; /* increase sequential count */ 
static INLINE void* /* Return allocated address */ 
tx_malloc_aligned(char *name,size_t size){ 
	/* tx descriptor must have saving on a total manage object storage */ 
	int ret = 0 ; 	
	void *memptr ;
	 
	//printf("[%s][%s]\n" , __func__ , name) ;
#if KEONWOO_DEBUG == 1 
	//printf("[%s][%s]\n" , __func__ , name) ;
//	ret = pos_posix_memalign( name, &memptr, CACHELINE_SIZE, size) ; 	
	//printf("[%s][%d]\n" , __func__ , size) ;
#endif
	memptr = pos_malloc( name, size ) ;
#if KEONWOO_DEBUG == 1 
	//printf("[%s][%p]\n" , __func__ , memptr) ;
#endif 
	/* Error Check whether pos_malloc success or not */ 
	if( memptr == NULL ){ 
		printf("[%s]_return address[%p]\n",__func__, memptr) ;
		return NULL; 
	}
	if( ret!= 0 ){ 
		printf("[pos_posix_memalign] return err\n") ;
		return NULL; 
	}else{ 
#if KEONWOO_DEBUG == 1 
#endif 
		/* Add tx desc to object storage */
		//lookup_pos_list_insert(name,&tx_count,memptr,sizeof(void*));
//		int id = (int)pthread_self() ; 
//		if( id < 0 ) id *= -1; 	
//		printf("id = %d\n",id) ;
//		pos_list_insert(name,&id,memptr,sizeof(void*));
	} 
	return memptr ; 	
} 
#endif // end HEAP_TINY_FLAGS 

static INLINE void* /* Return allocated address */ 
rs_ws_malloc_aligned(char *name, size_t size){ 
	/* rs,ws not have to saving on total manage object storage */  
	int ret = 0 ; 	
	void *memptr ; 
#if KEONWOO_DEBUG == 1
	//printf("[%s][%s]\n" , __func__ , name) ; 	
	//printf("[%s][%d]\n" , __func__ , size) ; 	
#endif 
	/* allocate rs,ws in nvram */ 	
	memptr = pos_malloc(name,size);
	if( memptr == NULL ){ 
		printf("[memptr : %p] is NULL\n") ;	
		perror("[memptr is null]\n") ;
		exit(-1) ; 	
	} 
#if KEONWOO_DEBUG == 1 
	//printf("[%s][%p]\n" , __func__ , memptr) ; 	
#endif
	return memptr ; 	
} 

#if HEAP_TINY_FLAGS == 1 
static INLINE void*
posmalloc_aligned(char *name,size_t size){ 
  // first allocating memory create object storage and allocate prime object ; 	
  /* Not Implement yet */ 
  void * memptr ; 	
  if( size < CACHELINE_SIZE ) size = CACHELINE_SIZE ; 	
  else (size%CACHELINE_SIZE)+CACHELINE_SIZE;	
  memptr = pos_malloc( name , size ); //name is obj_store_tx1 ~ obj_store_tx9
  if( memptr == NULL ){ 
    printf("Error Allocating aligned memory\n") ; 	
  }
  return memptr ; 
} 
#endif // end HEAP_TINY_FLAGS 

static INLINE void*
xmalloc_aligned(size_t size)
{
  void *memptr;
  /* TODO is posix_memalign is not available, provide malloc fallback. */
  /* Make sure that the allocation is aligned with cacheline size. */
#if defined(__CYGWIN__) || defined (__sun__)
  printf("CYGWIN OR SUN\n") ; 	
  memptr = memalign(CACHELINE_SIZE, size);
#elif defined(__APPLE__)
  printf("APPLE\n") ; 	
  memptr = valloc(size);
#else
  printf("posix_memalign\n") ;
  if (unlikely(posix_memalign(&memptr, CACHELINE_SIZE, size)))
    memptr = NULL;
#endif
  if (unlikely(memptr == NULL)) {
    fprintf(stderr, "Error allocating aligned memory\n");
    exit(1);
  }
  return memptr;
}

#endif /* !_UTILS_H_ */

