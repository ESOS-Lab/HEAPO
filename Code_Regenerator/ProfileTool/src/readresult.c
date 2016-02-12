#include "readresult.h"

typedef struct sdmprofile__list_item__heap
{
    U_64T instruction_number  ;
    U_64T r ;
    U_64T w ;
    u_int32_t size ;
    double createtime;
    double freedtime;
    u_int32_t Findex;
    
    U_64T key ;
    int deleted ;
    U_64T upperbound ;
    struct sdmprofile__list_item__heap * next ;
}sdmprofile__list_item__heap;


typedef struct sdmprofile__stack_allocations_info
{
    U_64T instruction_number  ;
    U_64T r;
    U_64T w ;
    u_int32_t size;
    u_int32_t function_number ;
    
    U_64T address ;
    U_64T upperbound ;
    struct sdmprofile__stack_allocations_info * next ;
    
}sdmprofile__stack_allocations_info;


int head;
double sdmprofile__AppStartTime;
double sdmprofile__AppEndTime;
long long sdmprofile__Total_AccessCount_R,sdmprofile__Total_AccessCount_W ;
int profileType ;
struct sdmprofile__stack_allocations_info stack;
struct sdmprofile__list_item__heap  heap;
struct sdmprofile__GV_allocation_info  GV;
u_int32_t Findex ; char *Fname , * sourcefile, * directory;
U_64T functionsCount, heapallocationCount,stackallocationCount,GVCount = 0;

struct function_info * firstFinfo ;
struct stack_totals * first_st;
struct heap_totals * first_hp;
struct sdmprofile__GV_allocation_info * first_gv ;
u_int32_t FindexNull ;
char * FnameEmpty = "-" ;
U_64T Index , sourceline ;

int decodepf   ( int file  )
{
    
    int dataexist  =  0;
    {
        tpl_node *tnhead ;
        tnhead  = tpl_map("A(i)", &head);
        tpl_load(tnhead, TPL_FD , file );
        tpl_unpack(tnhead ,1);
        {}
        tpl_free(tnhead );
    }
    //printf ("\nhead:%d",head);
    
    switch (head)
    {
        case 1 :
        {
            tpl_node *tn;
            tn = tpl_map("A(fuUUUU)", &sdmprofile__AppStartTime , & profileType, &functionsCount, &heapallocationCount,&stackallocationCount,&GVCount);
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 1 ;
                
                //printf("\nScope:%d, hp count:%lu, st count:%lu, GV count:%lu\n",profileType, heapallocationCount , stackallocationCount,GVCount);
                
                // allocate memory for function information
                FindexNull =  functionsCount + 100;
                firstFinfo = (struct function_info *)realloc(firstFinfo , sizeof(struct  function_info ) * (functionsCount + 5));
                if (firstFinfo == NULL)
                {
                    printf("resize failed"); return  0;
                }
                for (int ix = 0; ix < functionsCount;ix ++)
                {
                    firstFinfo[ix].Fname = FnameEmpty;
                    firstFinfo[ix].index = FindexNull;
                    
                }
                
                // stack totals
                if (stackallocationCount > 0)
                {
                    first_st = (struct stack_totals *) realloc (first_st,  stackallocationCount * sizeof(struct stack_totals ));
                    if (first_st == NULL)
                    {
                        printf(" resize failed"); return 0;
                    }
                    
                    for (int ix =0 ; ix < stackallocationCount ; ix++)
                    {
                        first_st[ix].Findex = FindexNull ;
                    }
                }
                
                // heap totals
                if (heapallocationCount > 0)
                {
                    first_hp = (struct heap_totals   *) realloc (first_hp, heapallocationCount   * sizeof(struct  heap_totals ));
                    if (first_hp == NULL)
                    {
                        printf(" resize failed"); return 0;
                    }
                    //printf("Heap count : %lu",heapallocationCount);
                    
                    for (int ix =0 ; ix < heapallocationCount ; ix++)
                    {
                        first_hp[ix].Findex = FindexNull ;
                    }
                }
                
                // gv
                if (GVCount > 0)
                {
                    first_gv = (struct sdmprofile__GV_allocation_info   *) realloc (first_gv, GVCount   * sizeof(struct  sdmprofile__GV_allocation_info ));
                    if (first_gv == NULL)
                    {
                        printf(" resize failed"); return 0;
                    }
                    
                    for (int ix =0 ; ix < GVCount ; ix++)
                    {
                        first_gv[ix].r=0;
                        first_gv[ix].w=0 ;
                    }
                }
                
                
            }
            tpl_free(tn);
        }
            break ;
        case 2:
        {
            tpl_node *tn;
            tn = tpl_map("A(fUU)", &sdmprofile__AppEndTime , &sdmprofile__Total_AccessCount_R ,&sdmprofile__Total_AccessCount_W    );
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 0 ;
            }
            tpl_free(tn);
        }
            break ;
        case 10:
        {
            tpl_node *tn;
            tn = tpl_map("A(us)", & Findex , &Fname );
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 1 ;
                firstFinfo[Findex].index = Findex;
                firstFinfo[Findex].Fname = Fname;
                //printf("F : %lu , %s",Findex,Fname);
            }
            tpl_free(tn);
        }
            break;
        case 11:
        {
            tpl_node *tn;
            tn = tpl_map("A(UUuss)", &Index , &sourceline, &Findex, &sourcefile , &directory);
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 1 ;
                int index_ = Index - 1 ;
                first_hp[index_].count = 0;
                first_hp[index_].Findex = Findex;
                first_hp[index_].R = 0 ;
                first_hp[index_].W = 0 ;
                first_hp[index_].sourceline = sourceline ;
                first_hp[index_].inst_number  = Index ;
                first_hp[index_].size  = 0 ;
                first_hp[index_].sourcefile = sourcefile;
                first_hp[index_].directory = directory;
                //printf("\nH : %lu , %lu , %d",first_hp[index_].inst_number ,first_hp[index_].sourceline , Findex);
            }
            tpl_free(tn);
        }
            break;
        case 12:
        {
            tpl_node *tn;
            tn = tpl_map("A(UUu)", &Index , &sourceline, &Findex);
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 1 ;
                int index_ = Index - 1 ;
                first_st[index_].count = 0;
                first_st[index_].Findex = Findex;
                first_st[index_].R = 0 ;
                first_st[index_].W = 0 ;
                first_st[index_].sourceline = sourceline ;
                first_st[index_].inst_number  = Index ;
                first_st[index_].size  = 0 ;
                //printf("\nS : %lu , %lu , %d",first_st[index_].inst_number ,first_st[index_].sourceline , Findex);
            }
            tpl_free(tn);
        }
            break;
        case 3:
        {
            tpl_node *tn;
            tn = tpl_map("A(S(iUUUiss))", &GV);
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 1 ;
                //printf("gv -->%u\n",GV.index  );
                int index_ = GV.index -1;
                first_gv[index_].index = GV.index ;
                first_gv[index_].r = GV.r ;
                first_gv[index_].w = GV.r ;
                first_gv[index_ ].VarName = GV.VarName ;
                first_gv[index_]. TypeString = GV.TypeString ;
                first_gv[index_].size = GV.size ;
            }
            tpl_free(tn);
            
        }
            break;
        case 4:
        {
            tpl_node *tn;
            tn = tpl_map("A(S(UUUuffu))", &heap);
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 1 ;
                //printf("H -->%lu\n",heap.instruction_number);
                int index_ = heap.instruction_number - 1 ;
                first_hp[index_].count ++;
                first_hp[index_].Findex = heap.Findex;
                first_hp[index_].size = heap.size  ;
                first_hp[index_].R += heap.r ;
                first_hp[index_].W += heap.w ;
            }
            tpl_free(tn);
        }
            break ;
        case 5:
        {
            tpl_node *tn;
            
            tn = tpl_map("A(S(UUUuu))", &stack);
            tpl_load(tn, TPL_FD , file );
            tpl_unpack(tn,1);
            {
                dataexist = 1 ;
                int index_ = stack.instruction_number - 1 ;
                first_st[index_].count ++;
                first_st[index_].Findex = stack.function_number;
                first_st[index_].size = stack.size  ;
                first_st[index_].R += stack.r ;
                first_st[index_].W += stack.w ;
            }
            tpl_free(tn);
        }
            break ;
        default:
            break;
    }
    return dataexist;
    
}

int make_csv_file__heapoformat(const char * filename) // heapo support format
{
    printf("\nWriting result to a csv(heapo_gen_result.csv) file\n\n");
    
    int fdr = open ( filename, O_RDONLY);
    while (decodepf(fdr) ){}
    
    //printf("\n finish reading scope=%d\n", profileType);
    
    FILE *f;
    f = fopen("heapo_gen_result.csv", "w+");
    
    
    if (profileType == HEAP_ || profileType == ALL_)
    {
        
        for (int ix = 0 ; ix < heapallocationCount ; ix++)
        {
            if (first_hp[ix].Findex != FindexNull)
            {
                //fprintf(f,"\n%s:%s:%lu:::%s",first_hp[ix].directory  ,first_hp [ix].sourcefile, first_hp[ix].sourceline ,firstFinfo[first_hp[ix].Findex].Fname) ;
                fprintf(f,"%s/%s:%lu:%s\n",first_hp[ix].directory  ,first_hp[ix].sourcefile, first_hp[ix].sourceline ,firstFinfo[first_hp[ix].Findex].Fname) ;
            }
            
        }
        //fprintf(f, "\n\n\n");
    }
    
    
    fclose(f);
    return  1;
}

int make_csv_file(const char * filename)
{
    printf("\nWriting result to a csv(result.csv) file\n\n");
    
    int fdr = open ( filename, O_RDONLY);
    while (decodepf(fdr) ){}
    
    //printf("\n finish reading scope=%d\n", profileType);
    
    FILE *f;
    f = fopen("result.csv", "w+");
    
    if ((profileType == STACK_ || profileType == ALL_))
    {
        //printf("writing s\n");
        fprintf(f, "Stack Memory Region Profile Result\n\nInstruction Index,Read Count,Write Count,Memory Size,Hits,Function,Source Line no.");
        
        for (int ix =0 ; ix < stackallocationCount ; ix++)
        {
            if (first_st[ix].Findex != FindexNull)
            {
                fprintf(f,"\n%lu,%lu,%lu,%u,%lu,%s,%lu ",first_st[ix].inst_number ,first_st[ix].R, first_st[ix].W ,first_st[ix].size ,first_st[ix].count ,firstFinfo[first_st[ix].Findex].Fname,first_st[ix].sourceline ) ;
            }
            
        }
        fprintf(f, "\n\n\n");
    }
    
    if (profileType == HEAP_ || profileType == ALL_)
    {
        //printf("writing h\n");
        fprintf(f, "Heap Memory Region Profile Result\n\nInstruction Index,Read Count,Write Count,Memory Size,Hits,Function,Source Line no.");
        
        for (int ix = 0 ; ix < heapallocationCount ; ix++)
        {
            if (first_hp[ix].Findex != FindexNull)
            {
                fprintf(f,"\n%lu,%lu,%lu,%u,%lu,%s,%lu ",first_hp[ix].inst_number ,first_hp [ix].R, first_hp[ix].W ,first_hp[ix].size  , first_hp[ix].count,firstFinfo[first_hp[ix].Findex].Fname,first_hp[ix].sourceline) ;
            }
            
        }
        fprintf(f, "\n\n\n");
    }
    
    if (profileType == GV_ || profileType == ALL_)
    {
        //printf("writing gv\n");
        fprintf(f, "Global Variable Memory Region Profile Result\n\nIndex,Read Count,Write Count,Memory Size,Name, Type  ");
        
        for (int ix =0 ; ix < GVCount ; ix++)
        {
            fprintf(f,"\n%d,%lu,%lu,%u,%s,%s ",first_gv[ix].index ,first_gv [ix].r, first_gv[ix].w ,first_gv[ix].size  , first_gv[ix].VarName,first_gv[ix].TypeString ) ;
        }
        fprintf(f, "\n\n\n");
    }
    
    fclose(f);
    return  1;
}

 
