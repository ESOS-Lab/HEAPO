
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <time.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>
#include <sstream>
#include <fstream>
#include <iostream>
#include <limits.h>
#include <map>
#include <forward_list>
#include <vector>
#include <list>
#include <algorithm>

#define HEAP_  1
#define STACK_ 2
#define GV_ 3
#define ALL_ 4

#define StoreINST 1
#define LoadINST 2
#define AtomicINST 3

#if defined MACOSBUILD
#define U_64T unsigned long
#else
#define U_64T u_int64_t
#endif

#if defined PTR64
#define PTRSIZE U_64T
#elseif defined PTR32
#define PTRSIZE u_int32_t
#else
#define PTRSIZE U_64T
#endif

#define CACHE1SIZE 8


extern "C" {
    
    typedef struct  sdmprofile__struct_STrw
    // Stack Allocation read write count metadata
    {
        U_64T index;
        U_64T r ;
        U_64T w ;
        u_int32_t size ;
        char * EstimatedName;
        char * DataTypeString;
        char * FunctionName;
        
    } sdmprofile__struct_STrw;

    typedef struct  sdmprofile__Allocated_Stack_item
    {
        void * ptr;
        U_64T  stackindex ;
        void  * upperbound;
    }Allocated_Stack_item;
        
}

struct  sdmprofile__struct_STrw STMetaArray[10000] ;
#define STitem struct sdmprofile__Allocated_Stack_item *

/* for Global vraible information */
typedef struct GVMeta
{
    U_64T index;
    U_64T r ;
    U_64T w ;
    void * address ;
    u_int32_t size ;
    char * VarName;
    char * DataTypeString;
    void * upperbound ;
    char * FileName;
    char * DirName ;
    U_64T linenumber ;
    
} GVMeta;

typedef  struct GVCache_Item
{
    GVMeta * ptr ;
    GVCache_Item * next ;
} GVCache_Item;

std::forward_list <struct  GVMeta *> GVMetalist ;
GVMeta Empty_GV_Item;
void * GV_AddrRangeHead = 0;
void * GV_AddrRangeTail = 0;


typedef struct  HPMeta
// Heap Allocation read write count metadata
{
    u_int32_t index;
    U_64T r ;
    U_64T w ;
    char * EstimatedName;
    char * EstimatedDataTypeString;
    char * FunctionName;
    U_64T linenumber ;
    char * SourceFile ;
    U_64T hitcount  ;
    size_t MaxSize ;
    size_t MinSize ;
    size_t AverageSize;
    
} HPMeta;
struct  HPMeta *HPMetaItem;
struct  HPMeta HPMetaArray[1000] ;

typedef struct  HeapAllocationMeta
{
    void * ptr;
    void * upperbound;
    size_t size ;
    u_int32_t heapindex ;
    U_64T RecentUsedClock;
} HeapAllocationMeta;

//std::map<void *,struct HeapAllocationMeta *> sdmprofile__HeapAllocations;
//std::map<void *,struct HeapAllocationMeta *>::iterator sdmprofile__HeapitemI ;

typedef std::list <struct HeapAllocationMeta *>::iterator HIt ;
std::list <struct HeapAllocationMeta *> HeapAllocationList;
#define ADD(I) HeapAllocationList.push_front(I)
#define REMOVE(I) HeapAllocationList.remove(I)

typedef  struct Cache2_Item
{
    HeapAllocationMeta * ptr ;
    Cache2_Item * next ;
} Cache2_Item;


static pthread_mutex_t threadlock = PTHREAD_MUTEX_INITIALIZER;
typedef struct  Thread
{
    u_int32_t threadnumber;
    pthread_t threadID;
    double ThreadStartTime;
    double ThreadEndTime;
    
    struct  sdmprofile__Allocated_Stack_item * Stack_allocations_head ;
    struct  sdmprofile__Allocated_Stack_item * Stack_allocations_current ;
    
    U_64T Malloc_Calls ;
    U_64T Free_Calls;
    U_64T Peak_Heap_Allocation ; // the number of live malloc allocations
    U_64T Peak_Heap_Allocation_Size ; // the memory size of live malloc allocations
    U_64T Current_Heap_Allocation;
    U_64T Current_Heap_Allocation_Size;
    
    U_64T Search;
    U_64T SearchMiss ;
    U_64T SearchWithinAddressRange;
    
    U_64T Cache_Miss ;
    U_64T Cache_Hits ;
    
    struct  HeapAllocationMeta * Cache1[CACHE1SIZE];
    U_64T Cache1_Recent_Count[CACHE1SIZE];
    
    struct Cache2_Item * Cache2_head;
    
    struct GVCache_Item * GVCache_head;
    
} Thread;

struct Thread thds[100];
int thdsCount = 0;
struct HeapAllocationMeta  * Empty_Item ;

double  sdmprofile__AppStartTime;
double  sdmprofile__AppEndTime;
void * sdmprofile__HP_addressRangeFrom = 0;
void * sdmprofile__HP_addressRangeTo   = 0;

void * sdmprofile__zeropointer = 0;

U_64T BBhits[5000];

struct  HeapAllocationMeta *  sdmprofile__profile_loopptr;
struct  sdmprofile__Allocated_Stack_item *  sdmprofile__profile_loopptrstack ;

void * cache_addr ; void * cache_upperbound;


u_int32_t RegisterNewThread();

extern "C" {
    
    double  sdmprofile__getRealTime();
    
    u_int32_t sdmprofile__MainthreadNumber;
    U_64T  sdmprofile__BBcounterSample__ = 0;
    u_int32_t  sdmprofile__profileAction ;
    u_int32_t  sdmprofile__IncludeStackProfiling ;
    U_64T  sdmprofile__heapallocationCount;
    U_64T  sdmprofile__stackallocationCount;
    U_64T sdmprofile__BBcount ;
    
    struct  sdmprofile__Allocated_Stack_item *  sdmprofile__MainthreadStack_allo ;

    void  sdmprofile__StartProfiling_Processes()
    {
        Empty_Item = (struct  HeapAllocationMeta  *)malloc(sizeof(struct  HeapAllocationMeta  ));
        
        sdmprofile__MainthreadNumber = RegisterNewThread();
        
        Empty_Item->heapindex = 0;
        Empty_Item->size = 0;
        Empty_Item->upperbound = 0;
        Empty_Item->ptr = 0;
        
        Empty_GV_Item.index = 0 ;
        Empty_GV_Item.address  = 0;
        Empty_GV_Item.size = 0;
        Empty_GV_Item.VarName = 0 ;
        Empty_GV_Item.DataTypeString = 0 ;
        Empty_GV_Item.upperbound = 0 ;
        
        
        if ( sdmprofile__IncludeStackProfiling)
        {
             sdmprofile__MainthreadStack_allo = (struct  sdmprofile__Allocated_Stack_item *)malloc(sizeof(struct  sdmprofile__Allocated_Stack_item) * 10000);
            
            struct  sdmprofile__Allocated_Stack_item * sdmprofile__loopptr =  sdmprofile__MainthreadStack_allo;
            for(int ix = 0 ; ix < 10000; ix ++)
            {
                sdmprofile__loopptr->ptr = 0;
                sdmprofile__loopptr->upperbound = 0;
                sdmprofile__loopptr++;
            }
        }
        
        sdmprofile__AppEndTime = 0;
        return  ;
    }


    void  sdmprofile__Embed_metadata_GV (U_64T index__,void * AtAddress , u_int32_t size_ , char * Name_string_ptr ,char * DataType_string_ptr , char * FilenameStringptr_  ,  char * FileDirStringptr_  , U_64T linenumber__ )
    {
        
        struct GVMeta * I = (struct GVMeta *)malloc (sizeof(struct GVMeta));
        I->index = index__ ;
        I->address  = AtAddress;
        I->size = size_;
        I->VarName = Name_string_ptr ;
        I->DataTypeString = DataType_string_ptr  ;
        I->upperbound = (void *) ((PTRSIZE)AtAddress +  size_);
        I->r = 0;
        I->w = 0;
        
        I->FileName = FilenameStringptr_;
        I->DirName = FileDirStringptr_ ;
        I->linenumber = linenumber__ ;
        
        GVMetalist.push_front(I);
        
        if (GV_AddrRangeHead == 0 )
        {
            GV_AddrRangeHead = AtAddress;
            GV_AddrRangeTail = (void *)((PTRSIZE)AtAddress +  size_)  ;
        }
        else
        {
            if (GV_AddrRangeHead > AtAddress) { GV_AddrRangeHead = AtAddress;}
            
            if (GV_AddrRangeTail < ((void*)((PTRSIZE)AtAddress + size_)))
            {GV_AddrRangeTail = (void *)((PTRSIZE)AtAddress + size_);}
            
        }
        
        return   ;
        
    }


    void  sdmprofile__Embed_metadata_ST (U_64T index__,  u_int32_t size_ , char * Estimated_Name_string_ptr ,char * DataType_string_ptr , char * FunctionName_string_ptr )
    {
        STMetaArray [index__ ].index = index__ ;
        STMetaArray [index__ ].size = size_;
        STMetaArray [index__ ].EstimatedName = Estimated_Name_string_ptr   ;
        STMetaArray [index__ ].DataTypeString = DataType_string_ptr    ;
        STMetaArray [index__ ].FunctionName = FunctionName_string_ptr ;
        return   ;
    }
    
    void  sdmprofile__Embed_metadata_HP (u_int32_t index__, char * Estimated_Name_string_ptr ,char * DataType_string_ptr , char * FunctionName_string_ptr , U_64T linenumber__ , char * SourceFile__ )
    {
    
        HPMetaArray [index__ ].index = index__ ;
        HPMetaArray [index__ ].EstimatedName = Estimated_Name_string_ptr   ;
        HPMetaArray [index__ ].EstimatedDataTypeString = DataType_string_ptr    ;
        HPMetaArray [index__ ].FunctionName = FunctionName_string_ptr ;
        HPMetaArray [index__ ].linenumber = linenumber__ ;
        HPMetaArray [index__ ].SourceFile = SourceFile__ ;
        HPMetaArray [index__].MinSize = 0;
        HPMetaArray [index__].MaxSize = 0;
        HPMetaArray [index__].hitcount = 0;
        return;
    }
    

    void  sdmprofile__AddBBHitcount_GV(U_64T index__  ,U_64T BBhitcount ,int Rcount ,int Wcount)
    {
        for (auto &I : GVMetalist)
        {
            if ( index__ ==  I->index  )
            {
                I->r = I->r + (Rcount * BBhitcount );
                I->w = I->w + (Wcount * BBhitcount );
            }
        }
    }
    
    void  sdmprofile__AddBBHitcount_ST(U_64T index__ ,U_64T BBhitcount ,int Rcount ,int Wcount)
    {
         STMetaArray [index__ ].r  =  STMetaArray [index__ ].r + (Rcount * BBhitcount );
         STMetaArray [index__ ].w  =  STMetaArray [index__ ].w + (Wcount * BBhitcount );
    }
    void  sdmprofile__AddBBHitcount_HP(U_64T index__ ,U_64T BBhitcount ,int Rcount ,int Wcount)
    {
        //printf( "\naddbbhitcount HP:%lu,%lu,%d,%d" , index__ , BBhitcount ,Rcount,Wcount);
        // sdmprofile__HPrw [index__ ].r  =  sdmprofile__HPrw [index__ ].r + (Rcount * BBhitcount );
        // sdmprofile__HPrw [index__ ].w  =  sdmprofile__HPrw [index__ ].w + (Wcount * BBhitcount );
    }

    void sdmprofile__BBHit(U_64T index__, U_64T cc)
    {
        BBhits[index__] = cc ;
    }

    void *sdmprofile__DummyCallBack1(void *arg,u_int32_t thdn)                  {return  0; }
    void *sdmprofile__DummyCallBack2(void *arg,u_int32_t thdn,STitem ptr)       {return  0; }
    u_int32_t sdmprofile__DummyCallBack3(void *arg,u_int32_t thdn)              {return  0; }
    u_int32_t sdmprofile__DummyCallBack4(void *arg,u_int32_t thdn,STitem ptr)   {return  0; }
    u_int64_t sdmprofile__DummyCallBack5(void *arg,u_int32_t thdn)              {return  0; }
    u_int64_t sdmprofile__DummyCallBack6(void *arg,u_int32_t thdn,STitem ptr)   {return  0; }

    void *  sdmprofile__ptCallBack_template1(void * arg1)
    {
        void * rtn;
        u_int32_t  thdnumber =   RegisterNewThread();
        rtn =  sdmprofile__DummyCallBack1(arg1 ,thdnumber );
        thds[thdnumber].ThreadEndTime =  sdmprofile__getRealTime( );
        return rtn ;
    }

    void *  sdmprofile__ptCallBack_template2(void * arg1)
    {
        void * rtn;
        u_int32_t  thdnumber =  RegisterNewThread();
        rtn =  sdmprofile__DummyCallBack2(arg1 ,thdnumber  ,thds[thdnumber].Stack_allocations_head);
        thds[thdnumber].ThreadEndTime =  sdmprofile__getRealTime( );
        return rtn ;
    }
    
    void *  sdmprofile__ptCallBack_template3(void * arg1)
    {
        PTRSIZE rtn;
        PTRSIZE  thdnumber =   RegisterNewThread();
        rtn = sdmprofile__DummyCallBack3(arg1 ,thdnumber );
        thds[thdnumber].ThreadEndTime =  sdmprofile__getRealTime( );
        return (void *)rtn ;
    }
    
    void *  sdmprofile__ptCallBack_template4(void * arg1)
    {
        PTRSIZE rtn;
        PTRSIZE thdnumber =  RegisterNewThread();
        rtn = sdmprofile__DummyCallBack4(arg1 ,thdnumber  ,thds[thdnumber].Stack_allocations_head);
        thds[thdnumber].ThreadEndTime =  sdmprofile__getRealTime( );
        return (void *)rtn ;
    }
    
    void *  sdmprofile__ptCallBack_template5(void * arg1)
    {
        u_int64_t rtn;
        u_int32_t thdnumber =   RegisterNewThread();
        rtn = sdmprofile__DummyCallBack5(arg1 ,thdnumber );
        thds[thdnumber].ThreadEndTime =  sdmprofile__getRealTime( );
        return (void *)rtn ;
    }
    
    void *  sdmprofile__ptCallBack_template6(void * arg1)
    {
        u_int64_t rtn;
        u_int32_t  thdnumber =  RegisterNewThread();
        rtn = sdmprofile__DummyCallBack6(arg1 ,thdnumber  ,thds[thdnumber].Stack_allocations_head);
        thds[thdnumber].ThreadEndTime =  sdmprofile__getRealTime( );
        return (void *)rtn ;
    }

    void *  sdmprofile__malloc(size_t size_ , u_int32_t  heap_index,u_int32_t thdnumber)
    {
        
        void * addr  = malloc (size_);
        //printf("malloc , %d\n" ,heap_index);
        thds[thdnumber].Malloc_Calls++;
        pthread_mutex_lock(&threadlock);
        
        struct  HeapAllocationMeta * I  = (struct HeapAllocationMeta *) malloc(sizeof(struct HeapAllocationMeta));
        I->ptr = addr ;
        I->upperbound = (void *)((PTRSIZE)addr + size_) ;
        I->size = size_ ;
        I->heapindex = heap_index ;
        ADD(I);
        
        pthread_mutex_unlock(&threadlock);
        
        // statistics
        
        thds[thdnumber].Current_Heap_Allocation ++ ;
        if (thds[thdnumber].Peak_Heap_Allocation < thds[thdnumber].Current_Heap_Allocation )
        {
            thds[thdnumber].Peak_Heap_Allocation = thds[thdnumber].Current_Heap_Allocation;
        }
        
        HPMetaItem = &HPMetaArray
        [heap_index];
        if( HPMetaItem->hitcount == 0)
        {
            HPMetaItem->MaxSize = size_;
            HPMetaItem->MinSize = size_;
        }
        else
        {
            if( HPMetaItem->MaxSize < size_ ){ HPMetaItem->MaxSize = size_;}
            if( HPMetaItem->MinSize > size_ ){ HPMetaItem->MinSize = size_;}
        }
        HPMetaItem->hitcount++;
        
        
        if (sdmprofile__HP_addressRangeFrom == 0 )
        {
            sdmprofile__HP_addressRangeFrom = addr;
            sdmprofile__HP_addressRangeTo   = (void *)((PTRSIZE)addr +  size_)  ;
        }
        else
        {
            if (sdmprofile__HP_addressRangeFrom > addr) { sdmprofile__HP_addressRangeFrom = addr;}
            if (sdmprofile__HP_addressRangeTo < ((void*)((PTRSIZE)addr + size_))) {sdmprofile__HP_addressRangeTo = (void *)((PTRSIZE)addr + size_);}
        }
        
        return addr   ;
    }
    
    void  sdmprofile__free (void * pointer , u_int32_t thdnumber  )
    {
        //printf("free %zu \n", HeapAllocationList.size());
        thds[thdnumber].Free_Calls ++;
        pthread_mutex_lock(&threadlock);
        
        for (auto &I : HeapAllocationList)
        {
            if (I->ptr == pointer)
            {
                I->ptr = 0 ;
                I->upperbound = 0 ;
                I->size = 0 ;
                I->heapindex = 0 ;
                REMOVE(I);
                break ;
            }
        }
        
        pthread_mutex_unlock(&threadlock);
        
        // statistics
        thds[thdnumber].Current_Heap_Allocation--;
        free ( pointer);
        return;
    }
    
    void sdmprofile__SearchRoutine_Dummy1 (void * AtAddress, u_int8_t  AccessType )
    {
        thds[0].Search++;
        return ;
    }
    void sdmprofile__SearchRoutine_Dummy2 (void * AtAddress, u_int8_t AccessType,u_int32_t threadnumber )
    {
        thds[threadnumber].Search++;
        return ;
    }
    void sdmprofile__SearchRoutine_Dummy3 (void * AtAddress, u_int8_t AccessType,u_int32_t threadnumber, struct  sdmprofile__Allocated_Stack_item * ptr )
    {
        thds[threadnumber].Search++;
        return ;
    }
    
    void sdmprofile__SearchRoutine_GVonly (void * AtAddress ,  u_int8_t  AccessType,u_int32_t thdnumber )
    {
        thds[thdnumber].Search++;
        GVMeta * HitItem ;
        
        if ( AtAddress >= GV_AddrRangeHead && AtAddress < GV_AddrRangeTail)
        {
            thds[thdnumber].SearchWithinAddressRange++;
            // Cache First
            struct GVCache_Item * swap,*previous;
            struct GVCache_Item * I = thds[thdnumber].GVCache_head ;
            
            while(I != 0)
            {
                if (AtAddress >=  I->ptr->address  && AtAddress < I->ptr->upperbound)
                {
                    switch (AccessType)
                    {
                        case LoadINST :
                            I->ptr->r++ ;
                            break;
                        case StoreINST:
                            I->ptr->w++;
                            break;
                        default:
                            break;
                    }
                    thds[thdnumber].Cache_Hits++;
                    // move to head
                    if (I == thds[thdnumber].GVCache_head)
                    {
                        // noo need to move;
                    }
                    else
                    {
                        previous->next = I->next;
                        swap = thds[thdnumber].GVCache_head;
                        thds[thdnumber].GVCache_head = I ;
                        thds[thdnumber].GVCache_head->next = swap;
                    }
                    
                    return  ;
                }
                else
                {
                    previous = I;
                    I = I->next ;
                }
                
            }
            
            // Search thru all items
            for (auto &I : GVMetalist)
            {
                if (AtAddress >=  I->address && AtAddress < I->upperbound)
                {
                    switch (AccessType)
                    {
                        case LoadINST :
                            I->r++ ;
                            break;
                        case StoreINST:
                            I->w++;
                            break;
                        default:
                            break;
                    }
                    HitItem = I ;
                    goto return_2;
                }
            }
            
            thds[thdnumber].SearchMiss++;
        }
        
        
        return ;
        
    return_2:
        thds[thdnumber].Cache_Miss ++;
        // update Cache
        // find cache item with next set to 0 least recent number , and replace
        struct GVCache_Item * swap,*previous;
        struct GVCache_Item * I = thds[thdnumber].GVCache_head  ;
        
        while(I->next != 0)
        {
            previous = I;
            I = I->next ;
        }
        
        previous->next = 0;
        swap = thds[thdnumber].GVCache_head;
        thds[thdnumber].GVCache_head = I ;
        thds[thdnumber].GVCache_head->next = swap;
        
        thds[thdnumber].GVCache_head->ptr = HitItem ;
        
        
        return ;
    }
    
    void sdmprofile__SearchRoutine_HPonly(void * AtAddress ,  u_int8_t  AccessType,u_int32_t thdnumber )
    {
        thds[thdnumber].Search++;
        struct  HeapAllocationMeta * loopptr ;
        
        if (AtAddress >= sdmprofile__HP_addressRangeFrom && AtAddress <= sdmprofile__HP_addressRangeTo)
        {
            thds[thdnumber].SearchWithinAddressRange++;
            // Cache First
            struct Cache2_Item * swap,*previous;
            struct Cache2_Item * I = thds[thdnumber].Cache2_head ;
            
            while(I != 0)
            {
                cache_addr = I->ptr->ptr;
                cache_upperbound = I->ptr->upperbound;
                
                if (AtAddress >=  cache_addr && AtAddress < cache_upperbound)
                {
                    switch (AccessType)
                    {
                        case LoadINST :
                            HPMetaArray[I->ptr->heapindex].r++ ;
                            break;
                        case StoreINST:
                            HPMetaArray[I->ptr->heapindex].w++;
                            break;
                        default:
                            break;
                    }
                    thds[thdnumber].Cache_Hits++;
                    // move to head
                    if (I == thds[thdnumber].Cache2_head)
                    {
                        // noo need to move;
                    }
                    else
                    {
                        previous->next = I->next;
                        swap = thds[thdnumber].Cache2_head;
                        thds[thdnumber].Cache2_head = I ;
                        thds[thdnumber].Cache2_head->next = swap;
                    }
                    
                    return  ;
                }
                else
                {
                    previous = I;
                    I = I->next ;
                    
                }
                
            }
            
            
            for (auto &I : HeapAllocationList)
            {
                if ( I->ptr == AtAddress)
                {
                    switch (AccessType)
                    {
                        case LoadINST :
                            HPMetaArray[I->heapindex].r++ ;
                            break;
                        case StoreINST:
                            HPMetaArray[I->heapindex].w++;
                            break;
                        default:
                            break;
                    }
					loopptr = I;
                    goto return_2 ;
                }
                else if (AtAddress <  I->ptr    )
                {
                    continue ;
                }
                else if ( AtAddress < I->upperbound )
                {
                    switch (AccessType)
                    {
                        case LoadINST :
                            HPMetaArray[I->heapindex].r++ ; ;
                            break;
                        case StoreINST:
                            HPMetaArray[I->heapindex].w++ ;;
                            break;
                        default:
                            break;
                    }
                    //printf("Search end \n");
                    loopptr = I;
                    goto return_2;
                }
                
                
                
            }
            
        }
        
        thds[thdnumber].SearchMiss++;
        return ;
        
    return_2:
        thds[thdnumber].Cache_Miss ++;
        // update Cache
        // find cache item with next set to 0 least recent number , and replace
        struct Cache2_Item * swap,*previous;
        struct Cache2_Item * I = thds[thdnumber].Cache2_head ;
        
        while(I->next != 0)
        {
            previous = I;
            I = I->next ;
        }
        
        previous->next = 0;
        swap = thds[thdnumber].Cache2_head;
        thds[thdnumber].Cache2_head = I ;
        thds[thdnumber].Cache2_head->next = swap;
        
        thds[thdnumber].Cache2_head->ptr = loopptr ;
        
        
        return ;
    }
  
    void sdmprofile__SearchRoutine_STonly (void * AtAddress ,  u_int8_t  AccessType , u_int32_t thdnumber, struct  sdmprofile__Allocated_Stack_item * ptr  )
    {
        thds[thdnumber].Search++;
        
        //sdmprofile__Search++;
        //printf("\nSearch, th:%d , last st ptr :%lu" , threadnumber , (PTRSIZE)ptr  );
        
        struct  sdmprofile__Allocated_Stack_item * loopptr = ptr ;
        struct  sdmprofile__Allocated_Stack_item * loopptr_head  ;
        loopptr_head = thds[thdnumber].Stack_allocations_head;
        
        // it always points to the next empty item , so we start from 1 step back
        loopptr  --;
        
        while (   loopptr   >=  loopptr_head )
        {
            if ( loopptr->ptr == AtAddress)
            {
                switch (AccessType)
                {
                    case LoadINST :
                        STMetaArray[ loopptr->stackindex].r++ ;
                        break;
                    case StoreINST:
                        STMetaArray[ loopptr->stackindex].w++;
                        break;
                    default:
                        break;
                }
                
                goto return_ ;
            }
            else if (AtAddress <  loopptr->ptr    )
            {
                //return ;
            }
            else
            {
                // calculate the upperbound once ,
                if (   loopptr  ->upperbound ==  sdmprofile__zeropointer)
                {
                    loopptr->upperbound = (void *) ((PTRSIZE)loopptr->ptr +  STMetaArray[ loopptr->stackindex].size );
                }
                if ( AtAddress <   loopptr->upperbound )
                {
                    switch (AccessType)
                    {
                        case LoadINST :
                            STMetaArray[ loopptr->stackindex].r++ ;
                            break;
                        case StoreINST:
                            STMetaArray[ loopptr->stackindex].w++ ;
                            break;
                        default:
                            break;
                    }
                    goto return_ ;
                }
            }
              loopptr  -- ;
        }
        
        thds[thdnumber].SearchMiss++;

        return_ :
        
        return;
    }
    
    void sdmprofile__PrintResultBeforeAddingBBcount()
    {
        FILE *f;
        f = fopen("debug_files_1.csv", "w+");
        
        if (sdmprofile__profileAction == GV_ || sdmprofile__profileAction == ALL_)
        {
            fprintf(f, "Global Variable Memory Region Profile Result\n\nIndex,Read Count,Write Count,Memory Size,Name, Type  ");
            
            for (auto &I : GVMetalist)
            {
                fprintf(f,"\n%lu,%lu,%lu,%u,%s,%s ", I->index , I->r,  I->w , I->size ,I->VarName, I->DataTypeString ) ;
            }
 
            fprintf(f, "\n\n\n");
        }
        
        if (sdmprofile__profileAction == STACK_  || sdmprofile__profileAction == ALL_)
        {
            fprintf(f, "Stack Variable Memory Region Profile Result\n\nIndex,Read Count,Write Count,Memory Size,Estimated Name, Type, Function Name  ");
            
            for (U_64T ix =0 ; ix <  sdmprofile__stackallocationCount ; ix++)
            {
                fprintf(f,"\n%lu,%lu,%lu,%u,%s,%s,%s ", STMetaArray[ix].index, STMetaArray [ix].r, STMetaArray[ix].w, STMetaArray[ix].size, STMetaArray[ix].EstimatedName, STMetaArray[ix].DataTypeString, STMetaArray[ix].FunctionName) ;
            }
            fprintf(f, "\n\n\n");
        }
        
        if (sdmprofile__profileAction == HEAP_   || sdmprofile__profileAction == ALL_)
        {
            fprintf(f, "Heap Variable Memory Region Profile Result\n\nIndex,Read Count,Write Count,Average Memory Size,Pointer Scope,Pointer Name,Pointer Type,Function Name,Line Number,Source File");
            
            for (  U_64T ix =0 ; ix <  sdmprofile__heapallocationCount  ; ix++)
            {
                HPMetaItem =  &HPMetaArray[ix];
                fprintf(f,"\n%u,%lu,%lu,%u,%s,%s,%s,%lu,%s,%lu,%zu,%zu", HPMetaItem->index , HPMetaItem->r,  HPMetaItem->w ,0 ,  HPMetaItem->EstimatedName, HPMetaItem->EstimatedDataTypeString ,  HPMetaItem->FunctionName ,  HPMetaItem->linenumber, HPMetaItem->SourceFile, HPMetaItem->hitcount, HPMetaItem->MinSize,  HPMetaItem->MaxSize ) ;
            }
            
            fprintf(f, "\n\n\n");
            
        }
        
        
        fclose(f);

    }

    void  sdmprofile__EndProfiling_Processes( )
    {

			/* added by ss */
			double  Edram = 0.0; 
			double  Emram = 0.0;
			int variable_count = 0;
			int nv_variable_count = 0;

        thds[0].ThreadEndTime = sdmprofile__getRealTime( );
       
		/* modified by sslee */
        //printf("\nApp END\n");
        
        FILE * bbf ;
        bbf = fopen ("debug_files_2.csv", "w+");
        {
            fprintf(bbf,"BasicBlock Index,Hit Count\n");
            for (U_64T ix = 0 ;ix < sdmprofile__BBcount ; ix++ )
            {
                fprintf(bbf,"%lu,%lu\n",ix,BBhits[ix]);
            }
        }
        
        FILE *f;
		/* modified by sslee */
		char errmsg[64] = "file open failed\n";
		
        //f = fopen("heapo_gen_result.csv", "w+");
        f = fopen("heapo_gen_result.csv", "a+");

		if(f == NULL){
			fprintf(stderr,"%s", errmsg);
			return ;
		}
        
        //fprintf(f,"Num of threads ,%d\n" , thdsCount);
        
        //fprintf (f,"Thread,Call to Malloc,Call to Free,No. Heap Allo at Peak,Searches,Search in Addr Range,Not in Addr Range,Search Miss,Cache Hits ,Cache Updates");
        
        int Malloc_Count =0;int Free_Count = 0;
		/*
        {
            for (int ix = 0 ;ix < thdsCount ; ix ++)
            {
                Malloc_Count = Malloc_Count + thds[ix].Malloc_Calls ;
                Free_Count = Free_Count + thds[ix].Free_Calls ;
                fprintf(f,"\n%d,%lu,%lu,%lu,%lu,%lu,%lu,%lu,%lu,%lu",thds[ix].threadnumber ,thds[ix].Malloc_Calls,thds[ix].Free_Calls,thds[ix].Peak_Heap_Allocation,thds[ix].Search,thds[ix].SearchWithinAddressRange,thds[ix].Search - thds[ix].SearchWithinAddressRange, thds[ix].SearchMiss,thds[ix].Cache_Hits ,thds[ix].Cache_Miss );
            }
        }
        
        fprintf(f,"\nAll threads,%d,%d\n",Malloc_Count, Free_Count );
        
        fprintf(f,"\nApplication RunTime,%f \n"   ,thds[0].ThreadEndTime -  thds[0].ThreadStartTime);
     	*/   

        if (sdmprofile__profileAction == GV_ || sdmprofile__profileAction == ALL_)
        {
            //fprintf(f, "\nGlobal Variable Memory Region Profile Result");
            //fprintf(f, "\nIndex,Read Count,Write Count,Memory Size,Name, Type, Dir,File,Line");
            //fprintf(f, "Global Variable\n");
            
            for (auto &I : GVMetalist)
            {
                std::string typestring ( I->DataTypeString);
                std::replace( typestring.begin(), typestring.end(), ',', ';');
				variable_count++;
               /* mofied by sslee */ 
					
					Edram = 0.72 * ( I->r + I->w); // nJ
					Emram = (0.4 * I->r) + (2.3 * I->w); // nj

					if(Emram < Edram){
                		//fprintf(f,"\n%lu,%lu,%lu,%u,%s,%s,%s,%s,%lu,%lf,%lf ", I->index, I->r, I->w, I->size, I->VarName, typestring.c_str() ,I->DirName,I->FileName,I->linenumber, Edram, Emram ) ;
						if(I->linenumber && strcmp(I->FileName,"-")){ 
								fprintf(f,"%s:%lu:%s/%s\n", I->VarName, I->linenumber, I->DirName, I->FileName) ;
                			//fprintf(f,"\n%lu,%lu,%lu,%u,%s,%s,%s,%s,%lu,%lf,%lf ", I->index, I->r, I->w, I->size, I->VarName, typestring.c_str() ,I->DirName,I->FileName,I->linenumber, Edram, Emram ) ;
							nv_variable_count++;
						}
					}
            }
           	fprintf(f, "\n");		 
       		fprintf(f, "[Global Variable Summary] ALL: %d, NVRAM: %d\n",variable_count, nv_variable_count ); 
       		//fprintf(f, "----------------------------------\n"); 
        }
        
    
          if (sdmprofile__profileAction == STACK_  || sdmprofile__profileAction == ALL_)
        {
            fprintf(f, "\nStack Variable Memory Region Profile Result\n\nIndex,Read Count,Write Count,Memory Size,Estimated Name, Type, Function Name  ");
            
            for (U_64T ix =0 ; ix <  sdmprofile__stackallocationCount ; ix++)
            {
                fprintf(f,"\n%lu,%lu,%lu,%u,%s,%s,%s ", STMetaArray[ix].index , STMetaArray [ix].r,  STMetaArray[ix].w , STMetaArray[ix].size  ,  STMetaArray[ix].EstimatedName, STMetaArray[ix].DataTypeString,  STMetaArray[ix].FunctionName) ;
            }

            fprintf(f, "\n\n\n");
            
        }
      
        if (sdmprofile__profileAction == HEAP_ || sdmprofile__profileAction == ALL_)
        {
            //fprintf(f, "\nHeap Variable Memory Region Profile Result\n\nIndex,Read Count,Write Count,Average Memory Size,Pointer Scope,Pointer Name,Pointer Type,Function Name,Line Number,Source File,HitCount,Min Size,Max Size");
            
       		//fprintf(f, "----------------------------------\n"); 
            for (  U_64T ix = 1 ; ix <  (sdmprofile__heapallocationCount +1)  ; ix++)
            {
                HPMetaItem =  &HPMetaArray[ix];
                
                //fprintf(f,"\n%u,%lu,%lu,%u,%s,%s,%s,%lu,%s,%lu,%zu,%zu", HPMetaItem->index , HPMetaItem->r,  HPMetaItem->w ,0 ,  HPMetaItem->EstimatedName, HPMetaItem->EstimatedDataTypeString ,  HPMetaItem->FunctionName ,  HPMetaItem->linenumber, HPMetaItem->SourceFile, HPMetaItem->hitcount, HPMetaItem->MinSize, HPMetaItem->MaxSize ) ;
					Edram = 0.72 * ( HPMetaItem->r + HPMetaItem->w); // nJ
					Emram = (0.4 * HPMetaItem->r) + (2.3 * HPMetaItem->w); // nj
				//if(Emram < Edram){
                //fprintf(f,",%zu", HPMetaItem->index , HPMetaItem->r,  HPMetaItem->w ,0 ,  HPMetaItem->EstimatedName, HPMetaItem->EstimatedDataTypeString ,  HPMetaItem->FunctionName ,  HPMetaItem->linenumber, HPMetaItem->SourceFile, HPMetaItem->hitcount, HPMetaItem->MinSize, HPMetaItem->MaxSize ) ;
				if(HPMetaItem->r > 0){
                		fprintf(f,"%s:%lu:%s:%s\n", HPMetaItem->SourceFile, HPMetaItem->linenumber,  HPMetaItem->FunctionName, HPMetaItem->EstimatedName) ;
						nv_variable_count++;
				}
				variable_count++;
            }

       		fprintf(f, "[Heap Variable Summary] : ALL: %d, NVRAM:   %d fit nvram \n", variable_count,nv_variable_count); 
       		//fprintf(f, "----------------------------------\n"); 
            
        }


        
         fclose(f);
        
    }

    u_int32_t sdmprofile__FindThread()
    {
        
        pthread_t pt =  pthread_self();
        for (int ix = 0 ; ix < thdsCount ; ix++)
        {
            if (thds[ix].threadID == pt )
            {
                return ix ;
            }
        }
        
        return RegisterNewThread();
    }
    
}

u_int32_t RegisterNewThread()
{
    
    pthread_mutex_lock(& threadlock);
    
    struct Thread * th =   &thds[thdsCount];
    th->threadnumber = thdsCount ;
    thdsCount ++;
    
    pthread_mutex_unlock(&threadlock);
    
    th->threadID = pthread_self();
    th->ThreadStartTime =  sdmprofile__getRealTime( );
    th->ThreadEndTime = 0 ;
    th->Malloc_Calls = 0;
    th->Free_Calls = 0;
    th->Current_Heap_Allocation = 0;
    th->Current_Heap_Allocation_Size = 0;
    th->Peak_Heap_Allocation = 0;
    th->Peak_Heap_Allocation_Size = 0 ;
    th->Search = 0;
    th->SearchMiss = 0;
    th->SearchWithinAddressRange = 0;
    
    th->Cache_Miss = 0;
    th->Cache_Hits = 0;
    
    
    
    if (sdmprofile__profileAction == HEAP_   || sdmprofile__profileAction == ALL_ )
    {
        // initialize Cache list
        struct Cache2_Item * list =(struct Cache2_Item * ) malloc ( sizeof(struct Cache2_Item) * CACHE1SIZE);
        th->Cache2_head = list;
        
        for(int ix = 0 ; ix < (CACHE1SIZE - 1) ;ix++)
        {
            struct Cache2_Item * I = list + ix ;
            I->ptr = Empty_Item;
            I->next = list + (ix + 1);
        }
        
        (list + (CACHE1SIZE - 1))->ptr = Empty_Item;
        (list + (CACHE1SIZE - 1))->next = 0;
        
    }
    
    if (sdmprofile__profileAction == GV_ || sdmprofile__profileAction == ALL_)
    {
        // initialize Cache list
        struct GVCache_Item * list =(struct GVCache_Item * ) malloc ( sizeof(struct GVCache_Item) * CACHE1SIZE);
        th->GVCache_head = list;
        
        for(int ix = 0 ; ix < (CACHE1SIZE - 1) ;ix++)
        {
            struct GVCache_Item * I = list + ix ;
            I->ptr = &Empty_GV_Item;
            I->next = list + (ix + 1);
        }
        
        (list + (CACHE1SIZE - 1))->ptr = &Empty_GV_Item;
        (list + (CACHE1SIZE - 1))->next = 0;
    }
    
    
    if (sdmprofile__IncludeStackProfiling)
    {
        th->Stack_allocations_head = (struct  sdmprofile__Allocated_Stack_item *)malloc(sizeof(struct  sdmprofile__Allocated_Stack_item) * 10000);
    }
    
    return th->threadnumber ;
}





/* Get Time Routine */

#ifdef __cplusplus
extern "C" {
#endif

#if defined(_WIN32)
#include <Windows.h>

#elif defined(__unix__) || defined(__unix) || defined(unix) || (defined(__APPLE__) && defined(__MACH__))
#include <unistd.h>	/* POSIX flags */
#include <time.h>	/* clock_gettime(), time() */
#include <sys/time.h>	/* gethrtime(), gettimeofday() */

#if defined(__MACH__) && defined(__APPLE__)
#include <mach/mach.h>
#include <mach/mach_time.h>
#endif

#else
#error "Unable to define getRealTime( ) for an unknown OS."
#endif

double  sdmprofile__getRealTime  ( )
{
#if defined(_WIN32)
    FILETIME tm;
    ULONGLONG t;
#if defined(NTDDI_WIN8) && NTDDI_VERSION >= NTDDI_WIN8
    /* Windows 8, Windows Server 2012 and later. ---------------- */
    GetSystemTimePreciseAsFileTime( &tm );
#else
    /* Windows 2000 and later. ---------------------------------- */
    GetSystemTimeAsFileTime( &tm );
#endif
    t = ((ULONGLONG)tm.dwHighDateTime << 32) | (ULONGLONG)tm.dwLowDateTime;
    return (double)t / 10000000.0;
    
#elif (defined(__hpux) || defined(hpux)) || ((defined(__sun__) || defined(__sun) || defined(sun)) && (defined(__SVR4) || defined(__svr4__)))
    /* HP-UX, Solaris. ------------------------------------------ */
    return (double)gethrtime( ) / 1000000000.0;
    
#elif defined(__MACH__) && defined(__APPLE__)
    /* OSX. ----------------------------------------------------- */
    static double timeConvert = 0.0;
    if ( timeConvert == 0.0 )
    {
        mach_timebase_info_data_t timeBase;
        (void)mach_timebase_info( &timeBase );
        timeConvert = (double)timeBase.numer /
        (double)timeBase.denom /
        1000000000.0;
    }
    return (double)mach_absolute_time( ) * timeConvert;
    
#elif defined(_POSIX_VERSION)
    /* POSIX. --------------------------------------------------- */
#if defined(_POSIX_TIMERS) && (_POSIX_TIMERS > 0)
    {
        struct timespec ts;
#if defined(CLOCK_MONOTONIC_PRECISE)
        /* BSD. --------------------------------------------- */
        const clockid_t id = CLOCK_MONOTONIC_PRECISE;
#elif defined(CLOCK_MONOTONIC_RAW)
        /* Linux. ------------------------------------------- */
        const clockid_t id = CLOCK_MONOTONIC_RAW;
#elif defined(CLOCK_HIGHRES)
        /* Solaris. ----------------------------------------- */
        /* Solaris. ----------------------------------------- */
        /* Solaris. ----------------------------------------- */
        /* Solaris. ----------------------------------------- */
        /* Solaris. ----------------------------------------- */
        /* Solaris. ----------------------------------------- */
        /* Solaris. ----------------------------------------- */
        const clockid_t id = CLOCK_HIGHRES;
#elif defined(CLOCK_MONOTONIC)
        /* AIX, BSD, Linux, POSIX, Solaris. ----------------- */
        const clockid_t id = CLOCK_MONOTONIC;
#elif defined(CLOCK_REALTIME)
        /* AIX, BSD, HP-UX, Linux, POSIX. ------------------- */
        const clockid_t id = CLOCK_REALTIME;
#else
        const clockid_t id = (clockid_t)-1;	/* Unknown. */
#endif /* CLOCK_* */
        if ( id != (clockid_t)-1 && clock_gettime( id, &ts ) != -1 )
        return (double)ts.tv_sec +
        (double)ts.tv_nsec / 1000000000.0;
        /* Fall thru. */
    }
#endif /* _POSIX_TIMERS */
    
    /* AIX, BSD, Cygwin, HP-UX, Linux, OSX, POSIX, Solaris. ----- */
    struct timeval tm;
    gettimeofday( &tm, NULL );
    return (double)tm.tv_sec + (double)tm.tv_usec / 1000000.0;
#else
    return -1.0;		/* Failed. */
#endif
}

    
#ifdef __cplusplus
}
#endif



