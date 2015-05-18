
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <time.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>

int sdmprofile__GV_count ;
#define gv_array_size 2000

struct  sdmprofile__GV_allocation_info  sdmprofile__GV_rw[gv_array_size];

int sdmprofile__GV_init(  )
{
    int ix= 0;int ixx = 0;
    for (ix = 0 ; ix < gv_array_size ;ix++)
    {
        sdmprofile__GV_rw[ix].index = 0;
        sdmprofile__GV_rw[ix].r = 0;
        sdmprofile__GV_rw[ix].w = 0;
        sdmprofile__GV_rw[ix].address = 0;
        sdmprofile__GV_rw[ix].size = 0;
    }
    
    sdmprofile__GV_count =0;
    return 1 ;
}


void sdmprofile__Register_GV(int index__, u_int64_t AtAddress , u_int32_t size_ , char * name_string_ptr ,char * type_string_ptr )
{
    
    sdmprofile__GV_rw [index__ ].index = index__ ;
    sdmprofile__GV_rw [index__ ].address  = AtAddress;
    sdmprofile__GV_rw [index__ ].size = size_;
    sdmprofile__GV_rw [index__ ].VarName = name_string_ptr ;
    sdmprofile__GV_rw [index__ ].TypeString = type_string_ptr  ;
    sdmprofile__GV_rw [index__ ].upperbound = ( sdmprofile__GV_rw [index__ ].address + sdmprofile__GV_rw [index__ ].size);
    
    sdmprofile__GV_count ++;
    return   ;
    
}

void sdmprofile__Save_GV_profile()
{
    int cc = sdmprofile__GV_count + 1 ;
    for (int ix = 1 ; ix < cc   ;ix++)
    {
        {
            tpl_node *tnheader; int header = 3 ;
            tnheader = tpl_map("A(i)", &header   );
            tpl_pack(tnheader ,1);
            tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
            tpl_free(tnheader );
        }
        {
            tpl_node *tngv;
            
            tngv = tpl_map("A(S(iUUUiss))", &(sdmprofile__GV_rw[ix])   );
            tpl_pack(tngv,1);
            tpl_dump(tngv, TPL_FD , sdmprofile__FD  ) ;
            tpl_free(tngv);
        }
    }
}




