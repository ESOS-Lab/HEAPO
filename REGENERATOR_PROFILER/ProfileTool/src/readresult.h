#include <stdio.h>
#include <stdlib.h>
#include "macros.h"
#include "tpl.h"
#include <fcntl.h>
#include <unistd.h>


#if defined __cplusplus
extern "C" {
#endif

    typedef struct sdmprofile__GV_allocation_info
    {
        u_int32_t index;
        U_64T r ;
        U_64T w ;
        U_64T address ;
        u_int32_t size ;
        char * VarName;
        char * TypeString;
        
        U_64T upperbound ;
    }sdmprofile__GV_allocation_info;

    
    typedef struct function_info
    {
        u_int32_t index;
        char * Fname;
    }function_info ;
    
    typedef struct  stack_totals
    {
        U_64T  R , W , inst_number, count ; u_int32_t size ; u_int32_t Findex; U_64T sourceline;
    }stack_totals;
    
    typedef struct heap_totals
    {
        U_64T R , W ,inst_number , count; u_int32_t size ; u_int32_t Findex ; U_64T sourceline;char * sourcefile ; char * directory ;
    } heap_totals;
    
    
    extern U_64T functionsCount, heapallocationCount,stackallocationCount,GVCount ;
    extern struct function_info * firstFinfo ;
    extern struct stack_totals * first_st;
    extern struct heap_totals * first_hp;
    extern struct sdmprofile__GV_allocation_info * first_gv ;



    extern int make_csv_file(const char * filename) ;
    extern int make_csv_file__heapoformat(const char * filename);

    
#if defined __cplusplus
}
#endif

