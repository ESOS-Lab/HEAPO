
#include <fcntl.h>
#include "tpl.h"
#include "readresult.h"

#define StoreINST 1
#define LoadINST 2
#define AtomicINST 3

int sdmprofile__FD ;

double sdmprofile__AppStartTime;
double sdmprofile__AppEndTime;
long long sdmprofile__Total_AccessCount_R ;
long long sdmprofile__Total_AccessCount_W ;

#include "getRealTime.c"
#include "profile_functions_heap.c"
#include "profile_functions_stack.c"
#include "profile_functions_globalvariable.c"


void sdmprofile__Initialize_proling (u_int32_t profileType,u_int64_t functionsCount, u_int64_t heapallocationCount, u_int64_t stackallocationCount ,u_int64_t GVCount, u_int32_t mainFindex )
{
    sdmprofile__AppStartTime = sdmprofile__getRealTime( );
    sdmprofile__AppEndTime = 0;
    
    // initialize output binary file
    system("rm result.tpl");
    mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH;
    sdmprofile__FD  = open ("result.tpl", O_WRONLY | O_EXCL | O_CREAT, mode);
    
    {
        tpl_node *tnheader; int header = 1 ;
        tnheader = tpl_map("A(i)", &header);
        tpl_pack(tnheader ,1);
        tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tnheader );
    }
    {
        tpl_node *tn;
        tn = tpl_map("A(fuUUUU)", &sdmprofile__AppStartTime , & profileType, &functionsCount, &heapallocationCount,&stackallocationCount,&GVCount    );
        tpl_pack(tn ,1);
        tpl_dump(tn , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tn );
    }
    
    
    
    switch (profileType)
    {
        case 1  :
            sdmprofile__Initialize_list__heap();
            break;
        case 2:
            sdmprofile__Initialize__stack(mainFindex) ;
            break ;
        case 3:
            sdmprofile__GV_init();
        case 4:
            sdmprofile__Initialize_list__heap();
            sdmprofile__Initialize__stack(mainFindex) ;
            sdmprofile__GV_init();
        default:
            break;
    }
    return  ;
}



void sdmprofile__Store_FunctionNames(u_int32_t Findex,  char * Fname  )
{
    
    {
        tpl_node *tnheader; int header = 10 ;
        tnheader = tpl_map("A(i)", &header);
        tpl_pack(tnheader ,1);
        tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tnheader );
    }
    {
        tpl_node *tn;
        tn = tpl_map("A(us)", & Findex , &Fname   );
        tpl_pack(tn ,1);
        tpl_dump(tn , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tn );
    }
    return   ;
    
}

void sdmprofile__Store_HeapTotalsInfo(u_int64_t index_, u_int64_t sourceline , u_int32_t Findex_, char * filename, char * dir)
{
    
    {
        tpl_node *tnheader; int header = 11 ;
        tnheader = tpl_map("A(i)", &header);
        tpl_pack(tnheader ,1);
        tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tnheader );
    }
    {
        tpl_node *tn;
        tn = tpl_map("A(UUuss)", & index_ , &sourceline, &Findex_, &filename, &dir );
        tpl_pack(tn ,1);
        tpl_dump(tn , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tn );
    }
    return   ;
    
}
void sdmprofile__Store_StackTotalsInfo(u_int64_t index_, u_int64_t sourceline , u_int32_t Findex_)
{
    
    {
        tpl_node *tnheader; int header = 12 ;
        tnheader = tpl_map("A(i)", &header);
        tpl_pack(tnheader ,1);
        tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tnheader );
    }
    {
        tpl_node *tn;
        tn = tpl_map("A(UUu)", & index_ , &sourceline, &Findex_ );
        tpl_pack(tn ,1);
        tpl_dump(tn , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tn );
    }
    return   ;
    
}



void sdmprofile__End_profiling(int profileType)
{
    sdmprofile__AppEndTime = sdmprofile__getRealTime( );
    
    switch (profileType)
    {
        case 1  :
            sdmprofile__flush_remaining_heap();
            break;
        case 2:
            sdmprofile__flush_remaining_stack() ;
            break ;
        case 3:
            sdmprofile__Save_GV_profile();
            break ;
        case 4:
            sdmprofile__flush_remaining_heap();
            sdmprofile__flush_remaining_stack() ;
            sdmprofile__Save_GV_profile();
            break ;
        default:
            break;
    }
    
    {
        tpl_node *tnheader; int header = 2 ;
        tnheader = tpl_map("A(i)", &header   );
        tpl_pack(tnheader ,1);
        tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tnheader );
    }
    {
        tpl_node *tn;
        tn = tpl_map("A(fUU)", &sdmprofile__AppEndTime , &sdmprofile__Total_AccessCount_R ,& sdmprofile__Total_AccessCount_W );
        tpl_pack(tn ,1);
        tpl_dump(tn , TPL_FD , sdmprofile__FD   ) ;
        tpl_free(tn );
    }
    close(sdmprofile__FD );
    
    
    // Reload result file and create csv file
    make_csv_file("result.tpl");
    make_csv_file__heapoformat("result.tpl");
    
}


void sdmprofile__profile_access1(u_int64_t AtAddress ,  u_int8_t  AccessType)
{
    if (AccessType == LoadINST ){ sdmprofile__Total_AccessCount_R    ++ ;}else if ( AccessType == StoreINST )	{  sdmprofile__Total_AccessCount_W   ++ ;}
    
    long icc  = sdmprofile__list_maximum_index_used__heap + 10;
    long ix ;
    struct sdmprofile__list_item__heap *item ;
    
    for (ix = 0 ; ix < icc ; ix++)
    {
        if(sdmprofile__List__heap[ix] != NullPointer)
        {
            if (!sdmprofile__List__heap[ix]->deleted)
            {
                item = sdmprofile__List__heap[ix] ;
                if (item->key == AtAddress)
                {
                    
                    if (AccessType == LoadINST ){ item->r   ++ ;}else if ( AccessType == StoreINST )	{  item->w   ++ ;}
                    return;
                }
                
                if (AtAddress < item->key)
                {
                    continue ;
                }
                
                if ( AtAddress < item->upperbound )
                {
                    
                    if (AccessType == LoadINST ){ item->r   ++ ;}else if ( AccessType == StoreINST )	{  item->w   ++ ;}
                    return;
                }
            }
        }
    }

    
    
}

void sdmprofile__profile_access2(u_int64_t AtAddress ,  u_int8_t  AccessType , struct sdmprofile__executing_function_info * cf)
{
 
    if (AccessType == LoadINST ){ sdmprofile__Total_AccessCount_R    ++ ;}else if ( AccessType == StoreINST )	{  sdmprofile__Total_AccessCount_W   ++ ;}
    
    
    struct sdmprofile__stack_allocations_info * ptr = cf->stack_allocation_head ;
    while (ptr != 0)
    {
        if (ptr->address == AtAddress )
        {
            if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
            
            return;
        }
        
        if (AtAddress < ptr->address    )
        {
            ptr = ptr->next ;
            continue ;
        }
        
        else if ( AtAddress <   ptr->upperbound )
        {
            if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
            
            return;
        }
        
        ptr = ptr->next ;

        
    }
    
    
    {
        struct sdmprofile__executing_function_info * callerf = cf->Caller ;
        
        while (callerf != 0)
        {
            struct sdmprofile__stack_allocations_info * ptr = callerf->stack_allocation_head ;
            while (ptr != 0)
            {
                if (ptr->address == AtAddress )
                {
                    if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
                    
                    return;
                }
                
                if (AtAddress < ptr->address    )
                {
                    ptr = ptr->next ;
                    continue ;
                }
                
                else if ( AtAddress <   ptr->upperbound )
                {
                    if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
                    
                    return;
                }
                
                ptr = ptr->next ;
                
                
            }

            
            callerf = callerf->Caller ;
            
        }
        
    }
    
    
    return;
}

void sdmprofile__profile_access3 (u_int64_t AtAddress ,  u_int8_t  AccessType)
{
    if (AccessType == LoadINST ){ sdmprofile__Total_AccessCount_R    ++ ;}else if ( AccessType == StoreINST )	{  sdmprofile__Total_AccessCount_W   ++ ;}
    
    
    int cc = sdmprofile__GV_count + 1 ;
    
    for (int ix = 1 ; ix < cc  ;ix++)
    {
        if (sdmprofile__GV_rw[ ix].address == AtAddress)
        {
            if (AccessType == LoadINST ){ sdmprofile__GV_rw[ix].r++ ; }
            else if ( AccessType == StoreINST )	{ sdmprofile__GV_rw[ix].w++ ; }
            return;
        }
        else if (AtAddress < sdmprofile__GV_rw[ ix].address   )
        { }
        else if ( AtAddress <   sdmprofile__GV_rw[ ix].upperbound )
        {
            if (AccessType == LoadINST ){ sdmprofile__GV_rw[ix].r++ ; }
            else if ( AccessType == StoreINST )	{ sdmprofile__GV_rw[ix].w++ ; }
            return;
        }
    }
    return;
}


int sdmprofile__profile_access1___(u_int64_t AtAddress ,  u_int8_t  AccessType)
{
    
    long icc  = sdmprofile__list_maximum_index_used__heap + 10;
    long ix ;
    struct sdmprofile__list_item__heap *item ;
    
    for (ix = 0 ; ix < icc ; ix++)
    {
        if(sdmprofile__List__heap[ix] != NullPointer)
        {
            if (!sdmprofile__List__heap[ix]->deleted)
            {
                item = sdmprofile__List__heap[ix] ;
                if (item->key == AtAddress)
                {
                    
                    if (AccessType == LoadINST ){ item->r   ++ ;}else if ( AccessType == StoreINST )	{  item->w   ++ ;}
                    return 1;
                }
                
                if (AtAddress < item->key)
                {
                    continue ;
                }
                
                if ( AtAddress < item->upperbound )
                {
                    if (AccessType == LoadINST ){ item->r   ++ ;}else if ( AccessType == StoreINST )	{  item->w   ++ ;}
                    return 1;
                }
            }
        }
    }
    
    
    return 0;
}

int sdmprofile__profile_access2___(u_int64_t AtAddress ,  u_int8_t  AccessType , struct sdmprofile__executing_function_info * cf)
{
    
    
    struct sdmprofile__stack_allocations_info * ptr = cf->stack_allocation_head ;
    while (ptr != 0)
    {
        if (ptr->address == AtAddress )
        {
            if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
            
            return 1;
        }
        
        if (AtAddress < ptr->address    )
        {
            ptr = ptr->next ;
            continue ;
        }
        
        else if ( AtAddress <   ptr->upperbound )
        {
            if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
            
            return 1;
        }
        
        ptr = ptr->next ;
        
        
    }
    
    
    {
        struct sdmprofile__executing_function_info * callerf = cf->Caller ;
        
        while (callerf != 0)
        {
            struct sdmprofile__stack_allocations_info * ptr = callerf->stack_allocation_head ;
            while (ptr != 0)
            {
                if (ptr->address == AtAddress )
                {
                    if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
                    
                    return 1;
                }
                
                if (AtAddress < ptr->address    )
                {
                    ptr = ptr->next ;
                    continue ;
                }
                
                else if ( AtAddress <   ptr->upperbound )
                {
                    if (AccessType == LoadINST ){ ptr->r   ++ ;}else if ( AccessType == StoreINST )	{  ptr->w   ++ ;}
                    
                    return 1;
                }
                
                ptr = ptr->next ;
                
                
            }
            
            
            callerf = callerf->Caller ;
            
        }
        
    }
    
    
    return 0;
}

int sdmprofile__profile_access3___ (u_int64_t AtAddress ,  u_int8_t  AccessType)
{
    
    int cc = sdmprofile__GV_count + 1 ;
    
    for (int ix = 1 ; ix < cc  ;ix++)
    {
        if (sdmprofile__GV_rw[ ix].address == AtAddress)
        {
            if (AccessType == LoadINST ){ sdmprofile__GV_rw[ix].r++ ; }
            else if ( AccessType == StoreINST )	{ sdmprofile__GV_rw[ix].w++ ; }
            return 1;
        }
        else if (AtAddress < sdmprofile__GV_rw[ ix].address   )
        { }
        else if ( AtAddress <   sdmprofile__GV_rw[ ix].upperbound )
        {
            if (AccessType == LoadINST ){ sdmprofile__GV_rw[ix].r++ ; }
            else if ( AccessType == StoreINST )	{ sdmprofile__GV_rw[ix].w++ ; }
            return 1;
        }
    }
    return 0;
}


void sdmprofile__profile_access4(u_int64_t AtAddress ,  u_int8_t  AccessType , struct sdmprofile__executing_function_info * cf)
{
    if (AccessType == LoadINST ){ sdmprofile__Total_AccessCount_R    ++ ;}else if ( AccessType == StoreINST )	{  sdmprofile__Total_AccessCount_W   ++ ;}
    
    
    if ( sdmprofile__profile_access2___(  AtAddress ,     AccessType ,   cf))
    {
        return ;
    }
    else if ( sdmprofile__profile_access1___(  AtAddress ,     AccessType))
    {
        return ;
    }
    else if  (sdmprofile__profile_access3___ (  AtAddress ,     AccessType))
    {
        return ;
    }
     
}





