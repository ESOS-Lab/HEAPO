// POS (Taeho Hwang)

#ifndef _DILLO_POS_DILLO_H
#define _DILLO_POS_DILLO_H

#include "url.h"
#include "decode.h"
#include "d_size.h"
#include <time.h>

#ifdef __cplusplus
extern "C" {
#endif


#define ORIGIN_DILLO	0
#define DISK_MODEL		1
#define POS_MODEL		0


// Web IO Time
extern unsigned long total_web_io_time, total_web_io_size;

// Decoding Time
extern unsigned long total_dec_time, total_dec_size;

// Disk IO Time
extern unsigned long total_disk_io_time, total_disk_io_size;

// Parsing Time
extern unsigned long total_parsing_size, total_parsing_time;
extern int cnt_space, cnt_tag, cnt_word;

// Drawing Time
//extern unsigned long total_draw_time;

extern struct timespec stamp_start, stamp_end;


typedef struct {
   const DilloUrl *Url;      /* Cached Url. Url is used as a primary Key */
   char *TypeDet;            /* MIME type string (detected from data) */
   char *TypeHdr;            /* MIME type string as from the HTTP Header */
   char *TypeMeta;           /* MIME type string from META HTTP-EQUIV */
   char *TypeNorm;           /* MIME type string normalized */
   Dstr *Header;             /* HTTP header */
   const DilloUrl *Location; /* New URI for redirects */
   Dlist *Auth;              /* Authentication fields */
   Dstr *Data;               /* Pointer to raw data */
   Dstr *UTF8Data;           /* Data after charset translation */
   int DataRefcount;         /* Reference count */
   Decode *TransferDecoder;  /* Transfer decoder (e.g., chunked) */
   Decode *ContentDecoder;   /* Data decoder (e.g., gzip) */
   Decode *CharsetDecoder;   /* Translates text to UTF-8 encoding */
   int ExpectedSize;         /* Goal size of the HTTP transfer (0 if unknown)*/
   int TransferSize;         /* Actual length of the HTTP transfer */
   uint_t Flags;             /* See Flag Defines in cache.h */

   // POS (Taeho Hwang)
   int Count;
} CacheEntry_t;


extern char *Cache_current_content_type(CacheEntry_t *entry);
extern CacheEntry_t *Cache_entry_search(const DilloUrl *Url);
extern void pos_convert_str(char *dest, char *src, int len);


#ifdef __cplusplus
}
#endif

#endif /* _DILLO_POS_DILLO_H */