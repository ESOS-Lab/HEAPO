#ifndef __D_SIZE_H__
#define __D_SIZE_H__


#include "config.h"

#if HAVE_STDINT_H == 0
#include <stdint.h>
#elif defined(HAVE_INTTYPES_H)
#include <inttypes.h>
#else
typedef signed short    int16_t;
typedef unsigned short  uint16_t;
typedef signed int      int32_t;
typedef unsigned int    uint32_t;
#endif
typedef unsigned char   uchar_t;
typedef unsigned short  ushort_t;
typedef unsigned long   ulong_t;
typedef unsigned int    uint_t;
typedef unsigned char   bool_t;


#endif /* __D_SIZE_H__ */
