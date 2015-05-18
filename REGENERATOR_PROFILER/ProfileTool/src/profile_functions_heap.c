
#define ArraySize 100000
#define NullPointer NULL

struct sdmprofile__list_item__heap
{
    u_int64_t instrunction_number  ;
    u_int64_t r ;
    u_int64_t w ;
    u_int32_t size ;
    double createtime;
    double freedtime;
    u_int32_t Findex;
    
    u_int64_t key ;
    int deleted ;
    u_int64_t upperbound ;
    struct sdmprofile__list_item__heap * next ;
    
}sdmprofile__list_item__heap_;

struct sdmprofile__list_item__heap * sdmprofile__List__heap[ArraySize];
long sdmprofile__list_maximum_index_used__heap ;
u_int64_t sdmprofile__list_total_items_added__heap;
u_int64_t sdmprofile__list_total_items_removed__heap  ;

u_int64_t sdmprofile__Instruction_number ;

void sdmprofile__Initialize_list__heap()
{
    
    for (long ix =0 ; ix < ArraySize ; ix++) {sdmprofile__List__heap[ix] = NullPointer ;}
    sdmprofile__list_maximum_index_used__heap = 0;
    
}

struct sdmprofile__list_item__heap * sdmprofile__list_Add__heap(u_int64_t Key_   )
{
    struct sdmprofile__list_item__heap * new_item = (struct  sdmprofile__list_item__heap *)(malloc(sizeof(  sdmprofile__list_item__heap_)));
    new_item->deleted = 0;
    new_item->next = 0;
    new_item->key = Key_ ;
    
    
    long ix ;
    for (ix = 0 ;ix < ArraySize ;ix ++)
    {
        if (sdmprofile__List__heap[ix] == NullPointer)
        {
            sdmprofile__List__heap[ix] = new_item ;
            if(sdmprofile__list_maximum_index_used__heap < ix )
            { sdmprofile__list_maximum_index_used__heap = ix ;}
            return new_item ;
        }
    }
    
    
    return 0;
}
void   sdmprofile__list_Remove__heap( u_int64_t Key_)
{
    
    long ix ;
    for (ix = 0 ;ix < ArraySize ;ix ++)
    {
        if (sdmprofile__List__heap[ix] != NullPointer)
        {
            if (sdmprofile__List__heap[ix]->key == Key_)
            {
                sdmprofile__List__heap[ix]->deleted = 1 ; usleep(100);
                sdmprofile__List__heap[ix] = NullPointer ;
                return   ;
            }
        }
    }
    
    
}

struct sdmprofile__list_item__heap * sdmprofile__list_getitem__heap( u_int64_t Key_)
{
    
    long ix ;
    for (ix = 0 ;ix < ArraySize ;ix ++)
    {
        if (sdmprofile__List__heap[ix] != NullPointer)
        {
            if (sdmprofile__List__heap[ix]->key == Key_)
            {
                 return  sdmprofile__List__heap[ix] ;
            }
        }
    }
    
    return 0 ;
    
}


void * sdmprofile__malloc(u_int64_t size_ , u_int64_t Inst_number ,u_int32_t Findex_ )
{
    void * rtn_pointer  = malloc (size_);
    
    struct sdmprofile__list_item__heap * heap = sdmprofile__list_Add__heap((u_int64_t)rtn_pointer  );
    
    heap->createtime = sdmprofile__getRealTime( );
    heap->freedtime = 0.0;
    heap->size = size_ ;
    heap->r = 0 ;
    heap->w = 0;
    heap->instrunction_number = Inst_number ;
    heap->upperbound = heap->key + heap->size ;
    heap->Findex = Findex_ ;
    
    return rtn_pointer  ;
}

void sdmprofile__free (void * pointer  )
{
    struct sdmprofile__list_item__heap * heap = sdmprofile__list_getitem__heap((u_int64_t) pointer );
    
    heap->freedtime = sdmprofile__getRealTime();
    {
        {
            tpl_node *tnheader; int header = 4 ;
            tnheader = tpl_map("A(i)", &header   );
            tpl_pack(tnheader ,1);
            tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
            tpl_free(tnheader );
        }
        {
            tpl_node *tn;
            tn = tpl_map("A(S(UUUuffu))", heap);
            tpl_pack(tn,1);
            tpl_dump(tn, TPL_FD , sdmprofile__FD  ) ;
            tpl_free(tn);
        }
        
    }
    
    sdmprofile__list_Remove__heap((u_int64_t) pointer );
    free ( pointer);
    return;
}

void sdmprofile__flush_remaining_heap (   )
{
    struct sdmprofile__list_item__heap * heap ;
    long icc  = sdmprofile__list_maximum_index_used__heap + 10;
    long ix ;
    
    for (ix = 0 ;ix < icc  ;ix ++)
    {
        if (sdmprofile__List__heap[ix] != NullPointer)
        {
            heap = sdmprofile__List__heap[ix] ;
            {
                tpl_node *tnheader; int header = 4 ;
                tnheader = tpl_map("A(i)", &header   );
                tpl_pack(tnheader ,1);
                tpl_dump(tnheader , TPL_FD , sdmprofile__FD   ) ;
                tpl_free(tnheader );
            }
            {
                tpl_node *tn;
                tn = tpl_map("A(S(UUUuffu))", heap);
                tpl_pack(tn,1);
                tpl_dump(tn, TPL_FD , sdmprofile__FD  ) ;
                tpl_free(tn);
            }

        }
    }
    return;
}


