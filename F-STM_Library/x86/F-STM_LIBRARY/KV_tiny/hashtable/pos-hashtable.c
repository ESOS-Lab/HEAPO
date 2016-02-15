/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/


/* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */

#include "pos-hashtable.h"
#include "pos-hashtable_private.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#include "../pos-lib.h"


#define MODE			1	// 1: absolute addressing, 2: offset addressing
#define OFFSET_BASE		(0x3FFEF8000000)

#define CONSISTENCY		1				
// For None Logging vs Undo Logging
#define UNDO_CONSISTENCY 	0	


#define pos_write_value	pos_write_value_kv
#define LOG_CNT_ON		0


/*
Credit for primes table: Aaron Krowne
 http://br.endernet.org/~akrowne/
 http://planetmath.org/encyclopedia/GoodHashTablePrimes.html
*/
//static const unsigned int primes[] = {
const unsigned int primes[] = {
53, 97, 193, 389,
769, 1543, 3079, 6151,
12289, 24593, 49157, 98317,
196613, 393241, 786433, 1572869,
3145739, 6291469, 12582917, 25165843,
50331653, 100663319, 201326611, 402653189,
805306457, 1610612741
};
const unsigned int prime_table_length = sizeof(primes)/sizeof(primes[0]);	// 26
const float max_load_factor = 0.65;

/*****************************************************************************/

unsigned long default_hashfunction(unsigned long *key)
{
	unsigned long hash;
	int i;
	hash = 0;
	for (i=0; i<KEY_SIZE; i++) {
//		int a = key[i]; 
//		hash += a ; 	
		hash += (unsigned long)key[i];
//		PR_DEBUG(" hash : %d\nkey[%d]" , hash, i ) ; 	
//		hash +=(a >> sizeof( int )) ; 
		hash += (unsigned long)(key[i]>>sizeof(unsigned long));
//		PR_DEBUG(" hash : %d\n", hash) ;
	}
//	PR_DEBUG(" return hash : %ld\n" , hash); 
	return hash;
}

int default_key_eq_fn(unsigned long *key1, unsigned long *key2)
{
	int i;
	for (i=0; i<KEY_SIZE; i++) {
		if (key1[i] != key2[i])
			return 0;
	}
	return 1;
}

/*****************************************************************************/
//struct hashtable *
//create_hashtable(unsigned int minsize,
//                 unsigned int (*hashf) (void*),
//                 int (*eqf) (void*,void*))
int 
create_hashtable(char *name, unsigned int minsize,
                 unsigned long (*hashfunction) (unsigned long*),
                 int (*key_eq_fn) (unsigned long*,unsigned long*))
{
    struct hashtable *h;
    unsigned long pindex, size = (unsigned long)primes[0];

    /* Check requested hashtable isn't too large */
    //if (minsize > (1u << 30)) return NULL;
    if (minsize > (1u << 30)) return -1;

    /* Enforce size as prime */
    for (pindex=0; pindex < (unsigned long)prime_table_length; pindex++) {
        if (primes[pindex] > minsize) { size = (unsigned long)primes[pindex]; break; }
    }

    //h = (struct hashtable *)malloc(sizeof(struct hashtable));
    //if (NULL == h) return NULL; /*oom*/
    h = (struct hashtable *)pos_malloc(name, sizeof(struct hashtable));
    if (NULL == h) return -1; /*oom*/

    pos_set_prime_object(name, h);

    //h->table = (struct entry **)malloc(sizeof(struct entry*) * size);
    //if (NULL == h->table) { free(h); return NULL; } /*oom*/
    h->table = (struct entry **)pos_malloc(name, sizeof(struct entry*) * size);
    //if (NULL == h->table) { pos_free(name, h); return -1; } /*oom*/
    
    memset(h->table, 0, size * sizeof(struct entry *));
    h->tablelength  = size;
    h->primeindex   = pindex;
    h->entrycount   = 0;
    //h->hashfn       = hashf;
    //h->eqfn         = eqf;
    h->hashfn       = hashfunction;
    h->eqfn         = key_eq_fn;
    h->loadlimit    = (unsigned int) ceil(size * max_load_factor);
    //return h;
    return 0;
}

int 
pos_create_hashtable(char *name, unsigned int minsize,
                 unsigned long (*hashfunction) (unsigned long*),
                 int (*key_eq_fn) (unsigned long*,unsigned long*))
{
	int rval;
	
	if (pos_create(name) == 0)
		return -1;
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 
	pos_log_create(name);
	pos_transaction_start(name, POS_TS_INSERT);
	#endif
#endif
	if (hashfunction == NULL && key_eq_fn == NULL) {
		//PR_DEBUG("key_rq_fn : %lu\n" , default_key_eq_fn );
		rval = create_hashtable(name, minsize, default_hashfunction, default_key_eq_fn);
	} else {
		rval = create_hashtable(name, minsize, hashfunction, key_eq_fn);
	}
	
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
	pos_transaction_end(name);
	pos_log_unmap(name);
	#endif
#endif
	pos_unmap(name);

	return rval;
}

/*****************************************************************************/

int pos_hashtable_open(char *name)
{
	if (pos_map(name) == 1) {
#if CONSISTENCY == 1
		#if UNDO_CONSISTENCY == 1 
		pos_log_map(name);

		// If transaction was ended abnormally.
		// Recovery is executed.
		pos_recovery(name);
		#endif
#endif
		return 0;
	} else
		return -1;
}

void pos_hashtable_close(char *name)
{
#if LOG_CNT_ON == 1
	print_log_cnt();
	clear_log_cnt();
#endif

#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
	pos_log_unmap(name);
	#endif 
#endif
	pos_unmap(name);
}

/*****************************************************************************/
//unsigned int
//hash(struct hashtable *h, void *k)
unsigned long
hash(struct hashtable *h, unsigned long *k)
{
    /* Aim to protect against poor hash functions by adding logic here
     * - logic taken from java 1.4 hashtable source */
//    unsigned long i = h->hashfn(k);
    unsigned long i = default_hashfunction( k ) ; 
    
    //PR_DEBUG(" i = %ld\n" , i) ; 	
    i += ~(i << 9);
    i ^=  ((i >> 14) | (i << 18)); /* >>> */
    i +=  (i << 4);
    i ^=  ((i >> 10) | (i << 22)); /* >>> */
   //PR_DEBUG("return : %ld\n" , i) ;
    return i;
}

/*****************************************************************************/
//static int
//hashtable_expand(struct hashtable *h)
//static int
int
hashtable_expand(char *name, struct hashtable *h)
{
    /* Double the size of the table to accomodate more entries */
    struct entry **newtable;
    struct entry *e;
    struct entry **pE;
    unsigned int newsize, i, index;

    /* Check we're not hitting max capacity */
    if (h->primeindex == (prime_table_length - 1)) return 0;
    newsize = primes[++(h->primeindex)];

    //newtable = (struct entry **)malloc(sizeof(struct entry*) * newsize);
    newtable = (struct entry **)pos_malloc(name, sizeof(struct entry*) * newsize);
    if (NULL != newtable)
    {
        memset(newtable, 0, newsize * sizeof(struct entry *));
#if CONSISTENCY == 1
        pos_clflush_cache_range(newtable, newsize * sizeof(struct entry *));
#endif
        /* This algorithm is not 'stable'. ie. it reverses the list
         * when it transfers entries between the tables */
        for (i = 0; i < h->tablelength; i++) {
            while (NULL != (e = h->table[i])) {
#if MODE == 2
                if (e != NULL)
                   e += OFFSET_BASE;
#endif

#if CONSISTENCY == 1
		#if UNDO_CONSISTENCY == 1
                pos_write_value(name, (unsigned long *)&h->table[i], (unsigned long)e->next);
		#else
		h->table[i] = e->next ; 	
		// adding clflush
		pos_clflush_cache_range(&h->table[i] , sizeof(unsigned long)) ;		
		#endif
#else
                h->table[i] = e->next;
#endif
                index = indexFor(newsize,e->h);
#if CONSISTENCY == 1
		#if UNDO_CONSISTENCY == 1
                pos_write_value(name, (unsigned long *)&e->next, (unsigned long)newtable[index]);
		#else
		e->next = newtable[index]; 
		//adding clflush
		pos_clflush_cache_range(&e->next , sizeof(unsigned long)); 
		#endif
#else
                e->next = newtable[index];
#endif
                newtable[index] = e;
            }
        }
        //free(h->table);
#if CONSISTENCY != 1
        pos_free(name, h->table);////////////////////////////////// 
#endif
        h->table = newtable;
    }
    /* Plan B: realloc instead */
    /*else 
    {
        //newtable = (struct entry **)
        //           realloc(h->table, newsize * sizeof(struct entry *));
        newtable = (struct entry **)
                   pos_realloc(name, h->table, newsize * sizeof(struct entry *));
        if (NULL == newtable) { (h->primeindex)--; return 0; }
        h->table = newtable;
        memset(newtable[h->tablelength], 0, newsize - h->tablelength);
        for (i = 0; i < h->tablelength; i++) {
            for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
                index = indexFor(newsize,e->h);
                if (index == i)
                {
                    pE = &(e->next);
                }
                else
                {
                    *pE = e->next;
                    e->next = newtable[index];
                    newtable[index] = e;
                }
            }
        }
    }*/
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
	  pos_write_value(name, (unsigned long *)&h->tablelength, (unsigned long)newsize);
  	  pos_write_value(name, (unsigned long *)&h->loadlimit, (unsigned long)newtable[index]);
    // Delayed flush...
	#else
	  h->tablelength = newsize ; 	
	  pos_clflush_cache_range( &h->tablelength , sizeof(unsigned long));  
	  h->loadlimit = (unsigned int)ceil(newsize * max_load_factor); 
	  pos_clflush_cache_range( &h->loadlimit , sizeof(unsigned long)) ; 	
	#endif
#else
    h->tablelength = newsize;
    h->loadlimit   = (unsigned int) ceil(newsize * max_load_factor);
#endif
    return -1;
}

/*****************************************************************************/
/*unsigned int
hashtable_count(struct hashtable *h)
{
    return h->entrycount;
}*/

/*****************************************************************************/
//int
//hashtable_insert(struct hashtable *h, void *k, void *v)
int
hashtable_insert(char *name, struct hashtable *h, unsigned long *k, unsigned long *v, 
		unsigned long v_size)
{
    /* This method allows duplicate keys - but they shouldn't be used */

    unsigned int index;
    struct entry *e;
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
	//PR_DEBUG("Undo Logging because UNDO_CONESISTENCY is 1\n") ; 	
	pos_transaction_start(name, POS_TS_INSERT);
	#endif
#endif

    if (++(h->entrycount) > h->loadlimit)
    {
        /* Ignore the return value. If expand fails, we should
         * still try cramming just this value into the existing table
         * -- we may not have memory for a larger table, but one more
         * element may be ok. Next time we insert, we'll try expanding again.*/
        //hashtable_expand(h);
//        hashtable_expand(name, h);
    }

    //e = (struct entry *)malloc(sizeof(struct entry));
    //if (NULL == e) { --(h->entrycount); return 0; } /*oom*/
    e = (struct entry *)pos_malloc(name, sizeof(struct entry));
    if (NULL == e) { --(h->entrycount); return -1; } /*oom*/

    e->h = hash(h,k);
//#if CONSISTENCY == 1
    //pos_clflush_cache_range(&e->h, sizeof(e->h));
//#endif
    index = indexFor(h->tablelength,e->h);

    //e->k = k;
    //e->v = v;
    memcpy(e->k, k, sizeof(unsigned long)*KEY_SIZE);
//#if CONSISTENCY == 1
//   pos_clflush_cache_range(e->k, sizeof(unsigned long)*KEY_SIZE);
//#endif
    e->v = (unsigned long *)pos_malloc(name, v_size);
    memcpy(e->v, v, v_size);
#if CONSISTENCY == 1
   //pos_clflush_cache_range(&e->v, sizeof(e->v));
   pos_clflush_cache_range(e->v, v_size);
#endif

    e->next = h->table[index];

#if CONSISTENCY == 1
    //pos_clflush_cache_range(&e->next, sizeof(e->next));
    pos_clflush_cache_range(e, sizeof(struct entry)); // Delayed flush
#endif

#if MODE == 1
#if CONSISTENCY == 1
    #if UNDO_CONSISTENCY == 1 
//    PR_DEBUG("Undo CONSISTENCY is 1 so pos_write_value\n") ; 	
    pos_write_value(name, (unsigned long *)&h->table[index], (unsigned long)e);
    #else
    h->table[index] = e; 	
    pos_clflush_cache_range(&h->table[index] , sizeof(unsigned long)) ; 	

    #endif

#else
    h->table[index] = e;
#endif
#elif MODE == 2
    h->table[index] = e - OFFSET_BASE;
#endif

#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
	pos_transaction_end(name);
	#endif
#endif
    //return -1;
    
    return 0;
}

int 
pos_hashtable_insert(char *name, void *_k, void *_v, unsigned long v_size)
{
	struct hashtable *h;
	unsigned long *k, *v;
	
	if (name==NULL || _k==NULL || _v==NULL)
		return -1;

	k = (unsigned long *)_k;
	v = (unsigned long *)_v;

	h = (struct hashtable *)pos_get_prime_object(name);
	return hashtable_insert(name, h, k, v, v_size);
}

/*****************************************************************************/
//void * /* returns value associated with key */
//hashtable_search(struct hashtable *h, void *k)
void * /* returns value associated with key */
hashtable_search(struct hashtable *h, unsigned long *k)
{
    struct entry *e;
    unsigned long hashvalue, index;

    hashvalue = hash(h,k);
    index = indexFor(h->tablelength,hashvalue);
    e = h->table[index];
    while (NULL != e)
    {
#if MODE == 2
        e += OFFSET_BASE;
#endif
        /* Check hash value to short circuit heavier comparison */
        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e->v;
        e = e->next;
    }
    return NULL;
}

void *
pos_hashtable_search(char *name, void *_k)
{
	struct hashtable *h;
	unsigned long *k;
	
	if (name==NULL || _k==NULL)
		return NULL;

	k = (unsigned long *)_k;
	h = (struct hashtable *)pos_get_prime_object(name);

	return hashtable_search(h, k);
}

/*****************************************************************************/
//void * /* returns value associated with key */
//hashtable_remove(struct hashtable *h, void *k)
int
hashtable_remove(char *name, struct hashtable *h, unsigned long *k)
{
    /* TODO: consider compacting the table when the load factor drops enough,
     *       or provide a 'compact' method. */

    struct entry *e;
    struct entry **pE;
    //void *v;
    unsigned long hashvalue, index;
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 
	pos_transaction_start(name, POS_TS_REMOVE);	
	#endif
#endif

    hashvalue = hash(h,k);
    index = indexFor(h->tablelength,hash(h,k));
    pE = &(h->table[index]);
    e = *pE;
    while (NULL != e)
    {
#if MODE == 2
        e += OFFSET_BASE;
#endif
        /* Check hash value to short circuit heavier comparison */
        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
        {
#if CONSISTENCY == 1
	    #if UNDO_CONSISTENCY == 1 	
            pos_write_value(name, (unsigned long *)pE , (unsigned long)e->next);
            pos_write_value(name, (unsigned long *)&h->entrycount, (unsigned long)(h->entrycount-1));
	    #else
	    *pE = e->next ; 	
	    pos_clflush_cache_range( pE , sizeof(struct entry)) ; 	
	    h->entrycount-- ; 	
	    pos_clflush_cache_range(&h->entrycount , sizeof(unsigned long)) ; 	
	    #endif
#else
            *pE = e->next;
            h->entrycount--;
            //v = e->v;
#endif

            //freekey(e->k);
            //free(e);
            pos_free(name, e->v);
            pos_free(name, e);

#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1
		pos_transaction_end(name);	
	#endif 
#endif
            //return v;
            return 0;
        }
        pE = &(e->next);
        e = e->next;
    }
#if CONSISTENCY == 1
	#if UNDO_CONSISTENCY == 1 
	pos_transaction_end(name);
	#endif 
#endif

    //return NULL;
    return -1;
}

int
pos_hashtable_remove(char *name, void *_k)
{
	struct hashtable *h;
	unsigned long *k;
		
	if (name==NULL || _k==NULL)
		return -1;

	k = (unsigned long *)_k;
	h = (struct hashtable *)pos_get_prime_object(name);

	return hashtable_remove(name, h, k);
}

/*****************************************************************************/
/* destroy */
//void
//hashtable_destroy(struct hashtable *h, int free_values)
void
hashtable_destroy(char *name)
{
    unsigned int i;
    struct entry *e, *f;
    //struct entry **table = h->table;
    struct entry **table;
    struct hashtable *h;

    h = (struct hashtable *)pos_get_prime_object(name);
    table = h->table;

    //if (free_values)
    //{
        for (i = 0; i < h->tablelength; i++)
        {
            e = table[i];
#if MODE == 2
            if (e != NULL)
               e += OFFSET_BASE;
#endif
            while (NULL != e)
            //{ f = e; e = e->next; freekey(f->k); free(f->v); free(f); }
		{
			f = e;
			e = e->next;
#if MODE == 2
	              if (e != NULL)
	                 e += OFFSET_BASE;
#endif
			pos_free(name, f->k); pos_free(name, f->v); pos_free(name, f);
		}
        }
    //}
    /*else
    {
        for (i = 0; i < h->tablelength; i++)
        {
            e = table[i];
            while (NULL != e)
            { f = e; e = e->next; freekey(f->k); free(f); }
        }
    }*/

    //free(h->table);
    //free(h);
    pos_free(name, h->table);
    pos_free(name, h);
}

int
pos_hashtable_destroy(char *name)
{
	pos_map(name);
#if CONSISTENCY == 1
	pos_log_map(name);
#endif
	//hashtable_destroy(name);
#if CONSISTENCY == 1
	pos_log_delete(name);
#endif
	pos_delete(name);

	return 0;
}

/*
 * Copyright (c) 2002, Christopher Clark
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 * * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * 
 * * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 
 * * Neither the name of the original author; nor the names of any contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 * 
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
