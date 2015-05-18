

typedef struct sdmprofile__thread_info
{
    pthread_t id;
    struct sdmprofile__executing_function_info  * current_function;
    struct sdmprofile__thread_info * next ;
    
}sdmprofile__thread_info_;

struct sdmprofile__stack_allocations_info
{
    u_int64_t instrunction_number  ;
    u_int64_t r;
    u_int64_t w ;
    u_int32_t size;
    u_int32_t function_number ;
    
    u_int64_t address ;
    u_int64_t upperbound ;
    struct sdmprofile__stack_allocations_info * next ;
    
}sdmprofile__stack_allocations_info_;


typedef struct sdmprofile__executing_function_info
{
    struct sdmprofile__thread_info * thread;
    void * stack_allocation_head;
    void  * stack_allocation_tail   ;
    u_int32_t function_number ;
    struct sdmprofile__executing_function_info * Caller ;
    int depth ;
    
} sdmprofile__executing_function_info_;


struct sdmprofile__thread_info * sdmprofile__MainThread ;
struct sdmprofile__executing_function_info  sdmprofile__MainFunction ;
struct sdmprofile__thread_info * sdmprofile__OtherThreads_Head ;
struct sdmprofile__thread_info * sdmprofile__OtherThreads_Tail   ;
u_int64_t sdmprofile__Instruction_number_stack ;

void sdmprofile__Initialize__stack ( u_int32_t mainFindex )
{
    sdmprofile__MainThread = malloc(sizeof(sdmprofile__thread_info_));
    sdmprofile__MainThread->id  = pthread_self();
    sdmprofile__MainThread->next = 0;
    
    sdmprofile__MainThread->current_function = &sdmprofile__MainFunction ;
    sdmprofile__MainThread->current_function->Caller = 0;
    sdmprofile__MainThread->current_function->depth = 1;
    sdmprofile__MainThread->current_function->stack_allocation_head = 0;
    sdmprofile__MainThread->current_function->stack_allocation_tail = 0;
    sdmprofile__MainThread->current_function->function_number = mainFindex  ;
    sdmprofile__OtherThreads_Head   = 0;
    return ;
}


struct sdmprofile__executing_function_info * sdmprofile__Register_Current_executing_function(u_int32_t function_number)
{
    pthread_t pt = pthread_self();
    struct sdmprofile__thread_info * threadinfo = 0;
    int Is_new_thread = 0;
    
    {
        if (pt == sdmprofile__MainThread->id )
        {
            threadinfo = sdmprofile__MainThread ;
        }
        else
        {
            struct sdmprofile__thread_info * ptr =  sdmprofile__OtherThreads_Head;
            while ( ptr != 0)
            {
                if (pt == ptr->id )
                {
                    threadinfo = ptr  ;
                    break ;
                }
            }
            
        }
        
        if (!threadinfo)
        {
            Is_new_thread = 1 ;
            threadinfo = malloc(sizeof(sdmprofile__thread_info_));
            threadinfo->next = 0 ;
            threadinfo->id  = pt   ;
            
            if (!sdmprofile__OtherThreads_Head)
            {
                sdmprofile__OtherThreads_Head = threadinfo ;
                sdmprofile__OtherThreads_Tail  = threadinfo;
            }
            else
            {
                sdmprofile__OtherThreads_Tail->next  = threadinfo;
                sdmprofile__OtherThreads_Tail  = threadinfo;
            }
            
        }
    }
    
    struct sdmprofile__executing_function_info * new_f   = malloc(sizeof(sdmprofile__executing_function_info_))  ;
    if (Is_new_thread)
    {
        new_f->Caller = 0 ;
        new_f->depth =  1;
    }
    else
    {
        new_f->Caller = threadinfo->current_function ;
        new_f->depth = threadinfo->current_function->depth + 1;
    }
    
    new_f->stack_allocation_head = 0;
    new_f->stack_allocation_tail = 0;
    new_f->function_number = function_number ;
    new_f->thread = threadinfo ;
    threadinfo->current_function = new_f ;
    
    return new_f;
    
}
void sdmprofile__Add_stack_allocation(u_int64_t address_  ,struct sdmprofile__executing_function_info * cf, u_int64_t size_ ,u_int64_t Instruction_number )
{
    
    
    struct sdmprofile__stack_allocations_info * new_a = malloc (sizeof(sdmprofile__stack_allocations_info_));
    new_a->r = 0 , new_a->w = 0 ;
    new_a->address = address_ ; new_a->size = size_ ;
    new_a->upperbound = new_a->address +   new_a->size ;
    new_a->function_number = cf->function_number ;
    new_a->next = 0;
    
    new_a->instrunction_number = Instruction_number;// sdmprofile__Instruction_number_stack ;
    
    if(cf->stack_allocation_head == 0)
    {
        cf->stack_allocation_head = new_a ;
        cf->stack_allocation_tail = new_a ;
    }else
    {
        ((struct sdmprofile__stack_allocations_info *)(cf->stack_allocation_tail))->next = new_a ;
        cf->stack_allocation_tail = new_a ;
    }
    
}


void sdmprofile__Exit_Current_executing_function(struct sdmprofile__executing_function_info * cf )
{
    
    cf->thread->current_function = cf->Caller ;
    {
        struct sdmprofile__stack_allocations_info * ptr = cf->stack_allocation_head ;
        struct sdmprofile__stack_allocations_info * freeptr ;
        while (ptr != 0)
        {
            {
                tpl_node *tnheader; int header = 5 ;
                tnheader = tpl_map("A(i)", &header   );
                tpl_pack(tnheader ,1);
                tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
                tpl_free(tnheader );
            }
            {
                tpl_node *tn;
                tn = tpl_map("A(S(UUUuu))", ptr);
                tpl_pack(tn,1);
                tpl_dump(tn, TPL_FD , sdmprofile__FD  ) ;
                tpl_free(tn);
            }
   
            freeptr = ptr ;
            ptr = ptr->next ;
            free (freeptr );
            
        }
        
        free (cf );
    }
    
}


void sdmprofile__flush_remaining_stack   (   )
{
    struct sdmprofile__stack_allocations_info * ptr = sdmprofile__MainThread->current_function->stack_allocation_head  ;
    struct sdmprofile__stack_allocations_info * freeptr ;
    
    while (ptr != 0)
    {
        {
            tpl_node *tnheader; int header = 5 ;
            tnheader = tpl_map("A(i)", &header   );
            tpl_pack(tnheader ,1);
            tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
            tpl_free(tnheader );
        }
        {
            tpl_node *tn;
            tn = tpl_map("A(S(UUUuu))", ptr);
            tpl_pack(tn,1);
            tpl_dump(tn, TPL_FD , sdmprofile__FD  ) ;
            tpl_free(tn);
        }
        freeptr = ptr ;
        ptr = ptr->next ;
        free (freeptr );
        
    }

     
}

