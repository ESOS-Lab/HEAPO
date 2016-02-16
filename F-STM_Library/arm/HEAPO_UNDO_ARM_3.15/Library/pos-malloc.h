/*
   Persistent Object Store
   
   Author: Taeho Hwang (htaeh@hanyang.ac.kr)
   Embedded Software Systems Laboratory, Hanyang University
*/

#ifndef _LINUX_POS_MALLOC_H
#define _LINUX_POS_MALLOC_H


#define CONSISTENCY		0

#define POS_WRITE_VAUE		pos_write_value_noflush


/*
  __STD_C should be nonzero if using ANSI-standard C compiler, a C++
  compiler, or a C compiler sufficiently close to ANSI to get away
  with it.
*/

#ifndef __STD_C
#if defined(__STDC__) || defined(__cplusplus)
#define __STD_C     1
#else
#define __STD_C     0
#endif
#endif /*__STD_C*/


/*
  Void_t* is the pointer type that malloc should say it returns
*/

#ifndef Void_t
#if (__STD_C || defined(WIN32))
#define Void_t      void
#else
#define Void_t      char
#endif
#endif /*Void_t*/

#if __STD_C
#include <stddef.h>   /* for size_t */
#include <stdlib.h>   /* for getenv(), abort() */
#else
#include <sys/types.h>
#endif

#include "pos-lib.h"
// To Modify malloc mutex
#include <pthread.h> 

//#include <malloc-machine.h>
/* The mutex functions used to do absolutely nothing, i.e. lock,
   trylock and unlock would always just return 0.  However, even
   without any concurrently active threads, a mutex can be used
   legitimately as an `in use' flag.  To make the code that is
   protected by a mutex async-signal safe, these macros would have to
   be based on atomic test-and-set operations, for example. */
//#define mutex_init(m)              (*(m) = 0)
//#define mutex_lock(m)              ((*(m) = 1), 0)
//#define mutex_trylock(m)           (*(m) ? 1 : ((*(m) = 1), 0))
//#define mutex_unlock(m)            (*(m) = 0)




#ifdef _LIBC
#ifdef ATOMIC_FASTBINS
#include <atomic.h>
#endif
#include <stdio-common/_itoa.h>
#include <bits/wordsize.h>
#include <sys/sysinfo.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* define LACKS_UNISTD_H if your system does not have a <unistd.h>. */

/* #define  LACKS_UNISTD_H */

#ifndef LACKS_UNISTD_H
#include <unistd.h>
#endif

/* define LACKS_SYS_PARAM_H if your system does not have a <sys/param.h>. */

/* #define  LACKS_SYS_PARAM_H */


#include <stdio.h>    /* needed for malloc_stats */
#include <errno.h>    /* needed for optional MALLOC_FAILURE_ACTION */

/* For uintptr_t.  */
//#include <stdint.h>

/* For va_arg, va_start, va_end.  */
#include <stdarg.h>

/* For writev and struct iovec.  */
#include <sys/uio.h>
/* For syslog.  */
#include <sys/syslog.h>

/* For various dynamic linking things.  */
#include <dlfcn.h>



/* We need `size_t' for the following definitions.  */
#ifndef __size_t
# if defined __GNUC__ && __GNUC__ >= 2
typedef __SIZE_TYPE__ __size_t;
#  ifdef __USE_XOPEN
typedef __SIZE_TYPE__ size_t;
#  endif
# else
#  include <stddef.h>
#  ifndef __size_t
#   define __size_t size_t
#  endif
# endif
#else
/* The GNU CC stddef.h version defines __size_t as empty.  We need a real
   definition.  */
# undef __size_t
# define __size_t size_t
#endif


/*
  INTERNAL_SIZE_T is the word-size used for internal bookkeeping
  of chunk sizes.

  The default version is the same as size_t.

  While not strictly necessary, it is best to define this as an
  unsigned type, even if size_t is a signed type. This may avoid some
  artificial size limitations on some systems.

  On a 64-bit machine, you may be able to reduce malloc overhead by
  defining INTERNAL_SIZE_T to be a 32 bit `unsigned int' at the
  expense of not being able to handle more than 2^32 of malloced
  space. If this limitation is acceptable, you are encouraged to set
  this unless you are on a platform requiring 16byte alignments. In
  this case the alignment requirements turn out to negate any
  potential advantages of decreasing size_t word size.

  Implementors: Beware of the possible combinations of:
     - INTERNAL_SIZE_T might be signed or unsigned, might be 32 or 64 bits,
       and might be the same width as int or as long
     - size_t might have different width and signedness as INTERNAL_SIZE_T
     - int and long might be 32 or 64 bits, and might be the same width
  To deal with this, most comparisons and difference computations
  among INTERNAL_SIZE_Ts should cast them to unsigned long, being
  aware of the fact that casting an unsigned int to a wider long does
  not sign-extend. (This also makes checking for negative numbers
  awkward.) Some of these casts result in harmless compiler warnings
  on some systems.
*/

#ifndef INTERNAL_SIZE_T
#define INTERNAL_SIZE_T size_t
#endif

/* The corresponding word size */
#define SIZE_SZ                (sizeof(INTERNAL_SIZE_T)) // 8(64bit), 4(32bit)


/*
  MALLOC_ALIGNMENT is the minimum alignment for malloc'ed chunks.
  It must be a power of two at least 2 * SIZE_SZ, even on machines
  for which smaller alignments would suffice. It may be defined as
  larger than this though. Note however that code and data structures
  are optimized for the case of 8-byte alignment.
*/


#ifndef MALLOC_ALIGNMENT
/* XXX This is the correct definition.  It differs from 2*SIZE_SZ only on
   powerpc32.  For the time being, changing this is causing more
   compatibility problems due to malloc_get_state/malloc_set_state than
   will returning blocks not adequately aligned for long double objects
   under -mlong-double-128.

#define MALLOC_ALIGNMENT       (2 * SIZE_SZ < __alignof__ (long double) \
				? __alignof__ (long double) : 2 * SIZE_SZ)
*/
#define MALLOC_ALIGNMENT       (2 * SIZE_SZ) // 16(0x10000)(64bit), 8(0x1000)(32bit)
#endif

/* The corresponding bit mask value */
#define MALLOC_ALIGN_MASK      (MALLOC_ALIGNMENT - 1) //15(0x01111)(64bit), 7 (0x0111)(32bit)





/* mallopt tuning options */

/*
  M_MXFAST is the maximum request size used for "fastbins", special bins
  that hold returned chunks without consolidating their spaces. This
  enables future requests for chunks of the same size to be handled
  very quickly, but can increase fragmentation, and thus increase the
  overall memory footprint of a program.

  This malloc manages fastbins very conservatively yet still
  efficiently, so fragmentation is rarely a problem for values less
  than or equal to the default.  The maximum supported value of MXFAST
  is 80. You wouldn't want it any higher than this anyway.  Fastbins
  are designed especially for use with many small structs, objects or
  strings -- the default handles structs/objects/arrays with sizes up
  to 8 4byte fields, or small strings representing words, tokens,
  etc. Using fastbins for larger objects normally worsens
  fragmentation without improving speed.

  M_MXFAST is set in REQUEST size units. It is internally used in
  chunksize units, which adds padding and alignment.  You can reduce
  M_MXFAST to 0 to disable all use of fastbins.  This causes the malloc
  algorithm to be a closer approximation of fifo-best-fit in all cases,
  not just for larger requests, but will generally cause it to be
  slower.
*/


/* M_MXFAST is a standard SVID/XPG tuning option, usually listed in malloc.h */
#ifndef M_MXFAST
#define M_MXFAST            1
#endif

#ifndef DEFAULT_MXFAST
#define DEFAULT_MXFAST     (64 * SIZE_SZ / 4)	// 128(64bit), 64(32bit)
#endif




/*
  M_TOP_PAD is the amount of extra `padding' space to allocate or
  retain whenever sbrk is called. It is used in two ways internally:

  * When sbrk is called to extend the top of the arena to satisfy
  a new malloc request, this much padding is added to the sbrk
  request.

  * When malloc_trim is called automatically from free(),
  it is used as the `pad' argument.

  In both cases, the actual amount of padding is rounded
  so that the end of the arena is always a system page boundary.

  The main reason for using padding is to avoid calling sbrk so
  often. Having even a small pad greatly reduces the likelihood
  that nearly every malloc request during program start-up (or
  after trimming) will invoke sbrk, which needlessly wastes
  time.

  Automatic rounding-up to page-size units is normally sufficient
  to avoid measurable overhead, so the default is 0.  However, in
  systems where sbrk is relatively slow, it can pay to increase
  this value, at the expense of carrying around more memory than
  the program needs.
*/

#define M_TOP_PAD              -2

#ifndef DEFAULT_TOP_PAD
#define DEFAULT_TOP_PAD        (0)
#endif

/*
  MMAP_THRESHOLD_MAX and _MIN are the bounds on the dynamically
  adjusted MMAP_THRESHOLD.
*/

#ifndef DEFAULT_MMAP_THRESHOLD_MIN
#define DEFAULT_MMAP_THRESHOLD_MIN (128 * 1024)
#endif

#ifndef DEFAULT_MMAP_THRESHOLD_MAX
  /* For 32-bit platforms we cannot increase the maximum mmap
     threshold much because it is also the minimum value for the
     maximum heap size and its alignment.  Going above 512k (i.e., 1M
     for new heaps) wastes too much address space.  */
# if __WORDSIZE == 32
#  define DEFAULT_MMAP_THRESHOLD_MAX (512 * 1024)
# else
#  define DEFAULT_MMAP_THRESHOLD_MAX (4 * 1024 * 1024 * sizeof(long))
# endif
#endif

/*
  M_MMAP_THRESHOLD is the request size threshold for using mmap()
  to service a request. Requests of at least this size that cannot
  be allocated using already-existing space will be serviced via mmap.
  (If enough normal freed space already exists it is used instead.)

  Using mmap segregates relatively large chunks of memory so that
  they can be individually obtained and released from the host
  system. A request serviced through mmap is never reused by any
  other request (at least not directly; the system may just so
  happen to remap successive requests to the same locations).

  Segregating space in this way has the benefits that:

   1. Mmapped space can ALWAYS be individually released back
      to the system, which helps keep the system level memory
      demands of a long-lived program low.
   2. Mapped memory can never become `locked' between
      other chunks, as can happen with normally allocated chunks, which
      means that even trimming via malloc_trim would not release them.
   3. On some systems with "holes" in address spaces, mmap can obtain
      memory that sbrk cannot.

  However, it has the disadvantages that:

   1. The space cannot be reclaimed, consolidated, and then
      used to service later requests, as happens with normal chunks.
   2. It can lead to more wastage because of mmap page alignment
      requirements
   3. It causes malloc performance to be more dependent on host
      system memory management support routines which may vary in
      implementation quality and may impose arbitrary
      limitations. Generally, servicing a request via normal
      malloc steps is faster than going through a system's mmap.

  The advantages of mmap nearly always outweigh disadvantages for
  "large" chunks, but the value of "large" varies across systems.  The
  default is an empirically derived value that works well in most
  systems.


  Update in 2006:
  The above was written in 2001. Since then the world has changed a lot.
  Memory got bigger. Applications got bigger. The virtual address space
  layout in 32 bit linux changed.

  In the new situation, brk() and mmap space is shared and there are no
  artificial limits on brk size imposed by the kernel. What is more,
  applications have started using transient allocations larger than the
  128Kb as was imagined in 2001.

  The price for mmap is also high now; each time glibc mmaps from the
  kernel, the kernel is forced to zero out the memory it gives to the
  application. Zeroing memory is expensive and eats a lot of cache and
  memory bandwidth. This has nothing to do with the efficiency of the
  virtual memory system, by doing mmap the kernel just has no choice but
  to zero.

  In 2001, the kernel had a maximum size for brk() which was about 800
  megabytes on 32 bit x86, at that point brk() would hit the first
  mmaped shared libaries and couldn't expand anymore. With current 2.6
  kernels, the VA space layout is different and brk() and mmap
  both can span the entire heap at will.

  Rather than using a static threshold for the brk/mmap tradeoff,
  we are now using a simple dynamic one. The goal is still to avoid
  fragmentation. The old goals we kept are
  1) try to get the long lived large allocations to use mmap()
  2) really large allocations should always use mmap()
  and we're adding now:
  3) transient allocations should use brk() to avoid forcing the kernel
     having to zero memory over and over again

  The implementation works with a sliding threshold, which is by default
  limited to go between 128Kb and 32Mb (64Mb for 64 bitmachines) and starts
  out at 128Kb as per the 2001 default.

  This allows us to satisfy requirement 1) under the assumption that long
  lived allocations are made early in the process' lifespan, before it has
  started doing dynamic allocations of the same size (which will
  increase the threshold).

  The upperbound on the threshold satisfies requirement 2)

  The threshold goes up in value when the application frees memory that was
  allocated with the mmap allocator. The idea is that once the application
  starts freeing memory of a certain size, it's highly probable that this is
  a size the application uses for transient allocations. This estimator
  is there to satisfy the new third requirement.

*/

#define M_MMAP_THRESHOLD      -3

#ifndef DEFAULT_MMAP_THRESHOLD
#define DEFAULT_MMAP_THRESHOLD DEFAULT_MMAP_THRESHOLD_MIN
#endif

/*
  M_MMAP_MAX is the maximum number of requests to simultaneously
  service using mmap. This parameter exists because
  some systems have a limited number of internal tables for
  use by mmap, and using more than a few of them may degrade
  performance.

  The default is set to a value that serves only as a safeguard.
  Setting to 0 disables use of mmap for servicing large requests.  If
  HAVE_MMAP is not set, the default value is 0, and attempts to set it
  to non-zero values in mallopt will fail.
*/

#define M_MMAP_MAX             -4

#ifndef DEFAULT_MMAP_MAX
#if HAVE_MMAP
#define DEFAULT_MMAP_MAX       (65536)
#else
#define DEFAULT_MMAP_MAX       (0)
#endif
#endif

#ifdef __cplusplus
} /* end of extern "C" */
#endif

#include <malloc.h>


/*
  ---------- Size and alignment checks and conversions ----------
*/

/* conversion from malloc headers to user pointers, and back */

#define chunk2mem(p)   ((Void_t*)((char*)(p) + 2*SIZE_SZ))
#define mem2chunk(mem) ((mchunkptr)((char*)(mem) - 2*SIZE_SZ))

/* The smallest possible chunk */
#define MIN_CHUNK_SIZE        (offsetof(struct malloc_chunk, fd_nextsize)) //32(64bit), 16(32bit)

/* The smallest size we can malloc is an aligned minimal chunk */

#define MINSIZE  \
  (unsigned long)(((MIN_CHUNK_SIZE+MALLOC_ALIGN_MASK) & ~MALLOC_ALIGN_MASK)) //32(64bit), 16(32bit)

/* Check if m has acceptable alignment */

#define aligned_OK(m)  (((unsigned long)(m) & MALLOC_ALIGN_MASK) == 0)

#define misaligned_chunk(p) \
  ((uintptr_t)(MALLOC_ALIGNMENT == 2 * SIZE_SZ ? (p) : chunk2mem (p)) \
   & MALLOC_ALIGN_MASK)


/*
   Check if a request is so large that it would wrap around zero when
   padded and aligned. To simplify some other code, the bound is made
   low enough so that adding MINSIZE will also not wrap around zero.
*/

#define REQUEST_OUT_OF_RANGE(req)                                 \
  ((unsigned long)(req) >=                                        \
   (unsigned long)(INTERNAL_SIZE_T)(-2 * MINSIZE))

/* pad request bytes into a usable size -- internal version */
//32bit ex) req:0~12 -> nb:16, req:13~20 -> nb:24, req:21~28 -> nb:32, ...
//64bit ex) req:0~24 -> nb:32, req:25~30 -> nb:48, req:41~56 -> nb:64, ...
#define request2size(req)                                         \
  (((req) + SIZE_SZ + MALLOC_ALIGN_MASK < MINSIZE)  ?             \
   MINSIZE :                                                      \
   ((req) + SIZE_SZ + MALLOC_ALIGN_MASK) & ~MALLOC_ALIGN_MASK)

/*  Same, except also perform argument check */

#define checked_request2size(req, sz)                             \
  if (REQUEST_OUT_OF_RANGE(req)) {                                \
    return 0;                                                     \
  }                                                               \
  (sz) = request2size(req);

/*
  --------------- Physical chunk operations ---------------
*/


/* size field is or'ed with PREV_INUSE when previous adjacent chunk in use */
#define PREV_INUSE 0x1

/* extract inuse bit of previous chunk */
#define prev_inuse(p)       ((p)->size & PREV_INUSE)


#define FIRST_CHUNK 0x2
#define chunk_is_first(p) ((p)->size & FIRST_CHUNK)

#define LAST_CHUNK 0x4
#define chunk_is_last(p) ((p)->size & LAST_CHUNK)


/* size field is or'ed with IS_MMAPPED if the chunk was obtained with mmap() */
//#define IS_MMAPPED 0x2

/* check for mmap()'ed chunk */
//#define chunk_is_mmapped(p) ((p)->size & IS_MMAPPED)


/* size field is or'ed with NON_MAIN_ARENA if the chunk was obtained
   from a non-main arena.  This is only set immediately before handing
   the chunk to the user, if necessary.  */
//#define NON_MAIN_ARENA 0x4

/* check for chunk from non-main arena */
//#define chunk_non_main_arena(p) ((p)->size & NON_MAIN_ARENA)


/*
  Bits to mask off when extracting size

  Note: IS_MMAPPED is intentionally not masked off from size field in
  macros for which mmapped chunks should never be seen. This should
  cause helpful core dumps to occur if it is tried by accident by
  people extending or adapting this malloc.
*/
#define SIZE_BITS (PREV_INUSE|FIRST_CHUNK|LAST_CHUNK)

/* Get size, ignoring use bits */
#define chunksize(p)         ((p)->size & ~(SIZE_BITS))


/* Ptr to next physical malloc_chunk. */
#define next_chunk(p) ((mchunkptr)( ((char*)(p)) + ((p)->size & ~SIZE_BITS) ))

/* Ptr to previous physical malloc_chunk */
#define prev_chunk(p) ((mchunkptr)( ((char*)(p)) - ((p)->prev_size) ))

/* Treat space at ptr + offset as a chunk */
#define chunk_at_offset(p, s)  ((mchunkptr)(((char*)(p)) + (s)))

/* extract p's inuse bit */
#define inuse(p)\
((((mchunkptr)(((char*)(p))+((p)->size & ~SIZE_BITS)))->size) & PREV_INUSE)

/* set/clear chunk as being inuse without otherwise disturbing */
#define set_inuse(p)\
((mchunkptr)(((char*)(p)) + ((p)->size & ~SIZE_BITS)))->size |= PREV_INUSE

#define clear_inuse(p)\
((mchunkptr)(((char*)(p)) + ((p)->size & ~SIZE_BITS)))->size &= ~(PREV_INUSE)

#if CONSISTENCY == 1
#define set_inuse_log(name, p)   \
POS_WRITE_VAUE(name, (unsigned long *)&((mchunkptr)(((char*)(p)) + ((p)->size & ~SIZE_BITS)))->size, \
						(unsigned long)(((mchunkptr)(((char*)(p)) + ((p)->size & ~SIZE_BITS)))->size |PREV_INUSE))
#define clear_inuse_log(name, p)   \
POS_WRITE_VAUE(name, (unsigned long *)&((mchunkptr)(((char*)(p)) + ((p)->size & ~SIZE_BITS)))->size, \
						(unsigned long)(((mchunkptr)(((char*)(p)) + ((p)->size & ~SIZE_BITS)))->size &~(PREV_INUSE)))
#endif


/* check/set/clear inuse bits in known places */
#define inuse_bit_at_offset(p, s)\
 (((mchunkptr)(((char*)(p)) + (s)))->size & PREV_INUSE)

#define set_inuse_bit_at_offset(p, s)\
 (((mchunkptr)(((char*)(p)) + (s)))->size |= PREV_INUSE)

#define clear_inuse_bit_at_offset(p, s)\
 (((mchunkptr)(((char*)(p)) + (s)))->size &= ~(PREV_INUSE))

#if CONSISTENCY == 1
#define set_inuse_bit_at_offset_log(name, p, s)   \
POS_WRITE_VAUE(name, (unsigned long *)&((mchunkptr)(((char*)(p)) + (s)))->size, \
						(unsigned long)(((mchunkptr)(((char*)(p)) + (s)))->size |PREV_INUSE))
#define clear_inuse_bit_at_offset_log(name, p, s)   \
POS_WRITE_VAUE(name, (unsigned long *)&((mchunkptr)(((char*)(p)) + (s)))->size, \
						(unsigned long)(((mchunkptr)(((char*)(p)) + (s)))->size &~(PREV_INUSE)))
#endif


/* Set size at head, without disturbing its use bit */
#define set_head_size(p, s)  ((p)->size = (((p)->size & SIZE_BITS) | (s)))

/* Set size/use field */
#define set_head(p, s)       ((p)->size = (s))

/* Set size at footer (only when chunk is not in use) */
#define set_foot(p, s)       (((mchunkptr)((char*)(p) + (s)))->prev_size = (s))

#if CONSISTENCY == 1
#define set_head_size_log(name, p, s)   \
POS_WRITE_VAUE(name, (unsigned long *)&(p)->size, (unsigned long)(((p)->size & SIZE_BITS) | (s)))

#define set_head_log(name, p, s)   \
POS_WRITE_VAUE(name, (unsigned long *)&(p)->size, (unsigned long)(s))

#define set_foot_log(name, p, s)   \
POS_WRITE_VAUE(name, (unsigned long *)&((mchunkptr)((char*)(p) + (s)))->prev_size, (unsigned long)(s))
#endif

/*
  -------------------- Internal data structures --------------------

   All internal state is held in an instance of malloc_state defined
   below. There are no other static variables, except in two optional
   cases:
   * If USE_MALLOC_LOCK is defined, the mALLOC_MUTEx declared above.
   * If HAVE_MMAP is true, but mmap doesn't support
     MAP_ANONYMOUS, a dummy file descriptor for mmap.

   Beware of lots of tricks that minimize the total bookkeeping space
   requirements. The result is a little over 1K bytes (for 4byte
   pointers and size_t.)
*/

/*
  Bins

    An array of bin headers for free chunks. Each bin is doubly
    linked.  The bins are approximately proportionally (log) spaced.
    There are a lot of these bins (128). This may look excessive, but
    works very well in practice.  Most bins hold sizes that are
    unusual as malloc request sizes, but are more usual for fragments
    and consolidated sets of chunks, which is what these bins hold, so
    they can be found quickly.  All procedures maintain the invariant
    that no consolidated chunk physically borders another one, so each
    chunk in a list is known to be preceeded and followed by either
    inuse chunks or the ends of memory.

    Chunks in bins are kept in size order, with ties going to the
    approximately least recently used chunk. Ordering isn't needed
    for the small bins, which all contain the same-sized chunks, but
    facilitates best-fit allocation for larger chunks. These lists
    are just sequential. Keeping them in order almost never requires
    enough traversal to warrant using fancier ordered data
    structures.

    Chunks of the same size are linked with the most
    recently freed at the front, and allocations are taken from the
    back.  This results in LRU (FIFO) allocation order, which tends
    to give each chunk an equal opportunity to be consolidated with
    adjacent freed chunks, resulting in larger free chunks and less
    fragmentation.

    To simplify use in double-linked lists, each bin header acts
    as a malloc_chunk. This avoids special-casing for headers.
    But to conserve space and improve locality, we allocate
    only the fd/bk pointers of bins, and then use repositioning tricks
    to treat these as the fields of a malloc_chunk*.
*/

/* Some compilers, like SunOS4 cc, don't have offsetof in <stddef.h>.  */
#ifndef offsetof
# define offsetof(type,ident) ((size_t)&(((type*)0)->ident))
#endif



/* addressing -- note that bin_at(0) does not exist */
#define bin_at(m, i) \
  (mbinptr) (((char *) &((m)->bins[((i) - 1) * 2]))			      \
	     - offsetof (struct malloc_chunk, fd))
/* analog of ++bin */
#define next_bin(b)  ((mbinptr)((char*)(b) + (sizeof(mchunkptr)<<1)))

/* Reminders about list directionality within bins */
#define first(b)     ((b)->fd)
#define last(b)      ((b)->bk)

/* Take a chunk off a bin list */
/*#define unlink(P, BK, FD) {                                            \
  FD = P->fd;                                                          \
  BK = P->bk;                                                          \
  if (FD->bk != P || BK->fd != P)                \
    malloc_printerr (check_action, "corrupted double-linked list", P); \
  else {                                                               \
    FD->bk = BK;                                                       \
    BK->fd = FD;                                                       \
    if (!in_smallbin_range (P->size)				       \
	&& P->fd_nextsize != NULL) {	       \
      if (FD->fd_nextsize == NULL) {				       \
	if (P->fd_nextsize == P)				       \
	  FD->fd_nextsize = FD->bk_nextsize = FD;		       \
	else {							       \
	  FD->fd_nextsize = P->fd_nextsize;			       \
	  FD->bk_nextsize = P->bk_nextsize;			       \
	  P->fd_nextsize->bk_nextsize = FD;			       \
	  P->bk_nextsize->fd_nextsize = FD;			       \
	}							       \
      }	else {							       \
	P->fd_nextsize->bk_nextsize = P->bk_nextsize;		       \
	P->bk_nextsize->fd_nextsize = P->fd_nextsize;		       \
      }								       \
    }								       \
  }                                                                    \
}*/
#define unlink(P, BK, FD) {                                            \
	FD = P->fd;                                                          \
	BK = P->bk;                                                          \
	FD->bk = BK;                                                       \
	BK->fd = FD;                                                       \
	if (!in_smallbin_range (P->size)				       \
	   && P->fd_nextsize != NULL) {	       \
		if (FD->fd_nextsize == NULL) {				       \
			if (P->fd_nextsize == P)				       \
				FD->fd_nextsize = FD->bk_nextsize = FD;		       \
			else {							       \
				FD->fd_nextsize = P->fd_nextsize;			       \
				FD->bk_nextsize = P->bk_nextsize;			       \
				P->fd_nextsize->bk_nextsize = FD;			       \
				P->bk_nextsize->fd_nextsize = FD;			       \
			}							       \
		} else {							       \
			P->fd_nextsize->bk_nextsize = P->bk_nextsize;		       \
			P->bk_nextsize->fd_nextsize = P->fd_nextsize;		       \
		}								       \
	}								       \
}
#if CONSISTENCY == 1
#define  unlink_log(NAME, P, BK, FD) {                                            \
	FD = P->fd;                                                          \
	BK = P->bk;                                                          \
	POS_WRITE_VAUE(NAME, (unsigned long *)&FD->bk, (unsigned long)BK);             \
	POS_WRITE_VAUE(NAME, (unsigned long *)&BK->fd, (unsigned long)FD);             \
	if (!in_smallbin_range (P->size)				       \
	   && P->fd_nextsize != NULL) {	       \
		if (FD->fd_nextsize == NULL) {				       \
			if (P->fd_nextsize == P) {				       \
				POS_WRITE_VAUE(NAME, (unsigned long *)&FD->fd_nextsize, (unsigned long)FD);             \
				POS_WRITE_VAUE(NAME, (unsigned long *)&FD->bk_nextsize, (unsigned long)FD);             \
			} else {							       \
				POS_WRITE_VAUE(NAME, (unsigned long *)&FD->fd_nextsize, (unsigned long)P->fd_nextsize);             \
				POS_WRITE_VAUE(NAME, (unsigned long *)&FD->bk_nextsize, (unsigned long)P->bk_nextsize);             \
				POS_WRITE_VAUE(NAME, (unsigned long *)&P->fd_nextsize->bk_nextsize, (unsigned long)FD);             \
				POS_WRITE_VAUE(NAME, (unsigned long *)&P->bk_nextsize->fd_nextsize, (unsigned long)FD);             \
			}							       \
		} else {							       \
			POS_WRITE_VAUE(NAME, (unsigned long *)&P->fd_nextsize->bk_nextsize, (unsigned long)P->bk_nextsize);             \
			POS_WRITE_VAUE(NAME, (unsigned long *)&P->bk_nextsize->fd_nextsize, (unsigned long)P->fd_nextsize);             \
		}								       \
	}	 \
}
#endif

#define insert_to_unsorted(AV, P, BK, FD, SIZE) {        \
	BK = unsorted_chunks(AV);            \
	FD = BK->fd;                         \
	P->bk = BK;                          \
	P->fd = FD;                          \
	if (!in_smallbin_range(SIZE)) {      \
		P->fd_nextsize = NULL;             \
		P->bk_nextsize = NULL;             \
	}                                    \
	BK->fd = P;                          \
	FD->bk = P;                          \
}
#if CONSISTENCY == 1
#define insert_to_unsorted_log(NAME, AV, P, BK, FD, SIZE) {        \
	BK = unsorted_chunks(AV);            \
	FD = BK->fd;                         \
	POS_WRITE_VAUE(NAME, (unsigned long *)&P->bk, (unsigned long)BK);             \
	POS_WRITE_VAUE(NAME, (unsigned long *)&P->fd, (unsigned long)FD);             \
	if (!in_smallbin_range(SIZE)) {      \
		POS_WRITE_VAUE(NAME, (unsigned long *)&P->fd_nextsize, (unsigned long)NULL);             \
		POS_WRITE_VAUE(NAME, (unsigned long *)&P->bk_nextsize, (unsigned long)NULL);             \
	}                                    \
	POS_WRITE_VAUE(NAME, (unsigned long *)&BK->fd, (unsigned long)P);             \
	POS_WRITE_VAUE(NAME, (unsigned long *)&FD->bk, (unsigned long)P);             \
}
#endif

/*
  Indexing

    Bins for sizes < 512 bytes contain chunks of all the same size, spaced
    8 bytes apart. Larger bins are approximately logarithmically spaced:

    64 bins of size       8
    32 bins of size      64
    16 bins of size     512
     8 bins of size    4096
     4 bins of size   32768
     2 bins of size  262144
     1 bin  of size what's left

    There is actually a little bit of slop in the numbers in bin_index
    for the sake of speed. This makes no difference elsewhere.

    The bins top out around 1MB because we expect to service large
    requests via mmap.
*/

#define NBINS             128
#define NSMALLBINS         64
#define SMALLBIN_WIDTH    MALLOC_ALIGNMENT	// 16(64bit), 8(32bit)
#define MIN_LARGE_SIZE    (NSMALLBINS * SMALLBIN_WIDTH)	// 1024(64bit), 512(32bit)

#define in_smallbin_range(sz)  \
  ((unsigned long)(sz) < (unsigned long)MIN_LARGE_SIZE)

#define smallbin_index(sz) \
  (SMALLBIN_WIDTH == 16 ? (((unsigned)(sz)) >> 4) : (((unsigned)(sz)) >> 3))

#define largebin_index_32(sz)                                                \
(((((unsigned long)(sz)) >>  6) <= 38)?  56 + (((unsigned long)(sz)) >>  6): \
 ((((unsigned long)(sz)) >>  9) <= 20)?  91 + (((unsigned long)(sz)) >>  9): \
 ((((unsigned long)(sz)) >> 12) <= 10)? 110 + (((unsigned long)(sz)) >> 12): \
 ((((unsigned long)(sz)) >> 15) <=  4)? 119 + (((unsigned long)(sz)) >> 15): \
 ((((unsigned long)(sz)) >> 18) <=  2)? 124 + (((unsigned long)(sz)) >> 18): \
					126)

// XXX It remains to be seen whether it is good to keep the widths of
// XXX the buckets the same or whether it should be scaled by a factor
// XXX of two as well.
#define largebin_index_64(sz)                                                \
(((((unsigned long)(sz)) >>  6) <= 48)?  48 + (((unsigned long)(sz)) >>  6): \
 ((((unsigned long)(sz)) >>  9) <= 20)?  91 + (((unsigned long)(sz)) >>  9): \
 ((((unsigned long)(sz)) >> 12) <= 10)? 110 + (((unsigned long)(sz)) >> 12): \
 ((((unsigned long)(sz)) >> 15) <=  4)? 119 + (((unsigned long)(sz)) >> 15): \
 ((((unsigned long)(sz)) >> 18) <=  2)? 124 + (((unsigned long)(sz)) >> 18): \
					126)

#define largebin_index(sz) \
  (SIZE_SZ == 8 ? largebin_index_64 (sz) : largebin_index_32 (sz))

#define bin_index(sz) \
 ((in_smallbin_range(sz)) ? smallbin_index(sz) : largebin_index(sz))


/*
  Unsorted chunks

    All remainders from chunk splits, as well as all returned chunks,
    are first placed in the "unsorted" bin. They are then placed
    in regular bins after malloc gives them ONE chance to be used before
    binning. So, basically, the unsorted_chunks list acts as a queue,
    with chunks being placed on it in free (and malloc_consolidate),
    and taken off (to be either used or placed in bins) in malloc.

    The NON_MAIN_ARENA flag is never set for unsorted chunks, so it
    does not have to be taken into account in size comparisons.
*/

/* The otherwise unindexable 1-bin is used to hold unsorted chunks. */
#define unsorted_chunks(M)          (bin_at(M, 1))


/*
  Binmap

    To help compensate for the large number of bins, a one-level index
    structure is used for bin-by-bin searching.  `binmap' is a
    bitvector recording whether bins are definitely empty so they can
    be skipped over during during traversals.  The bits are NOT always
    cleared as soon as bins are empty, but instead only
    when they are noticed to be empty during traversal in malloc.
*/

/* Conservatively use 32 bits per map word, even if on 64bit system */
#define BINMAPSHIFT      5
#define BITSPERMAP       (1U << BINMAPSHIFT) // 32 (0x100000)
#define BINMAPSIZE       (NBINS / BITSPERMAP) // 4

#define idx2block(i)     ((i) >> BINMAPSHIFT)
#define idx2bit(i)       ((1U << ((i) & ((1U << BINMAPSHIFT)-1))))

#define mark_bin(m,i)    ((m)->binmap[idx2block(i)] |=  idx2bit(i))
#define unmark_bin(m,i)  ((m)->binmap[idx2block(i)] &= ~(idx2bit(i)))
#define get_binmap(m,i)  ((m)->binmap[idx2block(i)] &   idx2bit(i))

#if CONSISTENCY == 1
#define mark_bin_log(name, m,i)   \
POS_WRITE_VAUE(name, (unsigned long *)&(m)->binmap[idx2block(i)], (unsigned long)((m)->binmap[idx2block(i)] |idx2bit(i)))
#define unmark_bin_log(name, m,i)   \
POS_WRITE_VAUE(name, (unsigned long *)&(m)->binmap[idx2block(i)], (unsigned long)((m)->binmap[idx2block(i)] & ~(idx2bit(i))))
#endif

/*
  Fastbins

    An array of lists holding recently freed small chunks.  Fastbins
    are not doubly linked.  It is faster to single-link them, and
    since chunks are never removed from the middles of these lists,
    double linking is not necessary. Also, unlike regular bins, they
    are not even processed in FIFO order (they use faster LIFO) since
    ordering doesn't much matter in the transient contexts in which
    fastbins are normally used.

    Chunks in fastbins keep their inuse bit set, so they cannot
    be consolidated with other free chunks. malloc_consolidate
    releases all chunks in fastbins and consolidates them with
    other free chunks.
*/

typedef struct malloc_chunk* mfastbinptr;
#define fastbin(ar_ptr, idx) ((ar_ptr)->fastbinsY[idx])

/* offset 2 to use otherwise unindexable first 2 bins */
#define fastbin_index(sz) \
  ((((unsigned int)(sz)) >> (SIZE_SZ == 8 ? 4 : 3)) - 2)


/* The maximum fastbin request size we support */
#define MAX_FAST_SIZE     (80 * SIZE_SZ / 4) // 160(64bit), 80(32bit)

#define NFASTBINS  (fastbin_index(request2size(MAX_FAST_SIZE))+1) //10

/*
  FASTBIN_CONSOLIDATION_THRESHOLD is the size of a chunk in free()
  that triggers automatic consolidation of possibly-surrounding
  fastbin chunks. This is a heuristic, so the exact value should not
  matter too much. It is defined at half the default trim threshold as a
  compromise heuristic to only attempt consolidation if it is likely
  to lead to trimming. However, it is not dynamically tunable, since
  consolidation reduces fragmentation surrounding large chunks even
  if trimming is not used.
*/

#define FASTBIN_CONSOLIDATION_THRESHOLD  (65536UL)

/*
  Since the lowest 2 bits in max_fast don't matter in size comparisons,
  they are used as flags.
*/

/*
  FASTCHUNKS_BIT held in max_fast indicates that there are probably
  some fastbin chunks. It is set true on entering a chunk into any
  fastbin, and cleared only in malloc_consolidate.

  The truth value is inverted so that have_fastchunks will be true
  upon startup (since statics are zero-filled), simplifying
  initialization checks.
*/

#define FASTCHUNKS_BIT        (1U)

/*#define have_fastchunks(M)     (((M)->flags &  FASTCHUNKS_BIT) == 0)
#define clear_fastchunks(M)    ((M)->flags |=  FASTCHUNKS_BIT)
#define set_fastchunks(M)      ((M)->flags &= ~FASTCHUNKS_BIT)*/
#define have_fastchunks(M)     ((M)->flags &  FASTCHUNKS_BIT)
#define set_fastchunks(M)    ((M)->flags |=  FASTCHUNKS_BIT)
#define clear_fastchunks(M)      ((M)->flags &= ~FASTCHUNKS_BIT)
#if CONSISTENCY == 1
#define set_fastchunks_log(NAME, M)   \
POS_WRITE_VAUE(NAME, (unsigned long *)&(M)->flags, (unsigned long)((M)->flags |FASTCHUNKS_BIT))
#define clear_fastchunks_log(NAME, M)   \
POS_WRITE_VAUE(NAME, (unsigned long *)&(M)->flags, (unsigned long)((M)->flags &~FASTCHUNKS_BIT))
#endif


#define INIT_KEY		(0x1C30DFD0542DA91E) // doesn't contain FASTCHUNKS_BIT

#define have_init_key(M)     (((M)->flags & ~FASTCHUNKS_BIT) &  INIT_KEY)
#define set_init_key(M)    ((M)->flags |=  INIT_KEY)
#define clear_init_key(M)      ((M)->flags &= ~INIT_KEY)

#if CONSISTENCY == 1
#define set_init_key_log(NAME, M)  \
POS_WRITE_VAUE(NAME, (unsigned long *)&(M)->flags, (unsigned long)((M)->flags |INIT_KEY))
#define clear_init_key_log(NAME, M)   \
POS_WRITE_VAUE(NAME, (unsigned long *)&(M)->flags, (unsigned long)((M)->flags &~INIT_KEY))
#endif

/*
   Set value of max_fast.
   Use impossibly small value if 0.
   Precondition: there are no existing fastbin chunks.
   Setting the value clears fastchunk bit but preserves noncontiguous bit.
*/

#define set_max_fast(s) \
  global_max_fast = ((s) == 0)? SMALLBIN_WIDTH: request2size(s)
#define get_max_fast() global_max_fast




/* ------------------ MMAP support ------------------  */


/*#include <fcntl.h>
#ifndef LACKS_SYS_MMAN_H
#include <sys/mman.h>
#endif

#if !defined(MAP_ANONYMOUS) && defined(MAP_ANON)
# define MAP_ANONYMOUS MAP_ANON
#endif
#if !defined(MAP_FAILED)
# define MAP_FAILED ((char*)-1)
#endif
*/

//#define SEG_ALLOC(addr, size, prot, flags) \
// (mmap((addr), (size), (prot), (flags)|MAP_ANONYMOUS, -1, 0))

//#define FREE(addr, size) \
// (munmap(addr, size))



/* There is only one instance of the malloc parameters.  */

//static struct malloc_par mp_;
#define PAGESIZE 4*1024 //getpagesize()


/* Maximum size of memory handled in fastbins.  */
extern INTERNAL_SIZE_T global_max_fast;


typedef unsigned long int uintptr_t;


#include <string.h>

//#include <unistd.h> //getpagesize()


struct malloc_chunk {

	INTERNAL_SIZE_T      prev_size;  /* Size of previous chunk (if free).  */
	INTERNAL_SIZE_T      size;       /* Size in bytes, including overhead. */

	struct malloc_chunk* fd;         /* double links -- used only if free. */
	struct malloc_chunk* bk;

	/* Only used for large blocks: pointer to next larger size.  */
	struct malloc_chunk* fd_nextsize; /* double links -- used only if free. */
	struct malloc_chunk* bk_nextsize;
};


struct malloc_chunk;
typedef struct malloc_chunk* mchunkptr;
typedef struct malloc_chunk* mbinptr;



/*
   ----------- Internal state representation and initialization -----------
*/
// 2168Bytes

struct malloc_state {
	/* Serialize access.  */
//	mutex_t mutex;
	pthread_mutex_t mutex ; 

	/* Flags (formerly in max_fast).  */
	int flags;

	/* Fastbins */
	mfastbinptr      fastbinsY[NFASTBINS];	// 10  <-default로는 8개만 사용됨

	/* The remainder from the most recent split of a small request */
	mchunkptr        last_remainder;

	/* Normal bins packed as described above */
	mchunkptr        bins[NBINS * 2 - 2];	// 254

	/* Bitmap of bins */
	unsigned int     binmap[BINMAPSIZE];	// 4개*64bit=256개    // 4개*32bit = 128개 

	/* Memory allocated from the system in this arena.  */
	INTERNAL_SIZE_T system_mem;
	INTERNAL_SIZE_T max_system_mem;

	Void_t *prime_obj;
	struct node_info node_obj;
};

struct malloc_state;
typedef struct malloc_state * mstate;

#define DEFAULT_PAD 131072	//128KB

//#include <pos-lib.h>


#endif /* _LINUX_POS_MALLOC_H */

