// POS (Taeho Hwang)

#ifndef _DILLO_POS_DILLO_H
#define _DILLO_POS_DILLO_H

#ifdef __cplusplus
extern "C" {
#endif

#include <time.h>

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
//unsigned long total_draw_time;

extern struct timespec stamp_start, stamp_end;

#ifdef __cplusplus
}
#endif

#endif /* _DILLO_POS_DILLO_H */