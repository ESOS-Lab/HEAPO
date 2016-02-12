

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "profile_simple.hpp"
#include "llvm/IR/InstIterator.h"

using namespace sdmllvm ;

namespace profile_simple
{
    u_int32_t profileType;
    U_64T  heapallocationCount;
    U_64T stackallocationCount;
    U_64T GVCount ;
    instmap_t malloclist ;
    instmap_t stacklist ;
    std::map<llvm::Value *,  u_int64_t > indexes ;
    sdmllvm::module *M;
    
    void  Save_Output(std::string InputFilename,std::string OutputFilename,bool Convert_object_file)
    {
        std::string O_bc  ;std::string O_o;
        if ( OutputFilename == "")
        {
            O_bc = InputFilename + std::string ("_profile.bc");
            O_o  = InputFilename + std::string ("_profile.o");
        }
        else
        {
            if (Convert_object_file)
            {
                O_bc  = OutputFilename + ".bc";
                O_o = OutputFilename ;
            }else
            {
                O_bc  = OutputFilename ;
                
            }
        }
        
        
        {
            std::string ErrorInfo;
            
            tool_output_file Out( O_bc .c_str(), ErrorInfo, sys::fs::F_None);
            if (!ErrorInfo.empty())
            {
                errs() << ErrorInfo << '\n';
            }
            
            WriteBitcodeToFile(M->Mod.get(), Out.os());
            Out.keep();
            
        }
        
        
        if (Convert_object_file)
        {
            std::stringstream call;
            call << LLVM_LLC << " -filetype=obj -o " <<  O_o << " " << O_bc ;
            std::system(call.str().c_str());
            
            message  <<  "Output Object File = " <<  O_o   << go ;
        }else
        {
            message  <<  "Output Bitcode File = " <<  O_bc  << go ;
        }
        
        
    }
    
    llvm::Instruction * PlaceInitEnd(  )
    {
        debug << "Place pf init and end functions call in main function" << go ;
        function * mainf  = M->functionmap[M->Mod->getFunction ("main" )] ;
        sdmllvm::function * finit  = M->pf_functions["sdmprofile__Initialize_proling"];
        sdmllvm::function * fsave  = M->pf_functions["sdmprofile__End_profiling"];
        debug << "main fuunction : " << mainf->Name() << " , " << finit->Name() << " and " << fsave->Name() << go ;
        llvm::CallInst * InitcallInst = sdmllvm::WrapAfunction_head(M,mainf,finit , ARGV {ARG(profileType),ARG(M->functionmap.size(),ARGI64),ARG(malloclist.size() ,ARGI64),ARG(stacklist.size() ,ARGI64), ARG(M->gvmap.size() ,ARGI64),ARG(mainf->index) }  );
        
        sdmllvm::WrapAfunction_tail(M,mainf,fsave , ARGV {ARG( profileType)});
        
        llvm::Instruction  * LastPoint = InitcallInst ;
        debug << " store functions in result file : " << M->functionmap.size() << go ;
        sdmllvm::function * regf  = M->pf_functions["sdmprofile__Store_FunctionNames"];
        for (sdmllvm::module::functionmapI I = M->functionmap.begin() ; I != M->functionmap.end();++I)
        {
            sdmllvm::function * f  = I->second ;
            std::stringstream  variablename ; variablename << "sdmprofile__F_Name_" << f->index;
            ARGV args ;
            args.push_back (ARG(f->index));
            args.push_back (ARG(f->Name(),variablename.str() ,ARGSL ));
            llvm::CallInst * fcall = sdmllvm::CreateCallInst(M, LastPoint,true, regf , args );
            LastPoint = fcall ;
        }
        
        u_int64_t Heap_fcall_index = 0 ;
        debug << " store heap in result file : " << malloclist.size() << go ;
        sdmllvm::function * regh  = M->pf_functions["sdmprofile__Store_HeapTotalsInfo"];
        for (instmap_I Ifcall  =   malloclist.begin() ; Ifcall != malloclist.end();++Ifcall)
        {
            llvm::CallInst * fcall = llvm::dyn_cast<llvm::CallInst >(Ifcall->first->base)  ;
            sdmllvm::instruction * Inst = Ifcall->first;
            sdmllvm::function * F = M->functionmap[fcall->getParent()->getParent()];
            Heap_fcall_index++;
            indexes[fcall] = Heap_fcall_index;
            std::stringstream  variablename ;
            variablename << "sdmprofile__H_info_" << Heap_fcall_index << "" ;
            ARGV args;
            args.push_back(ARG(Heap_fcall_index  ,ARGI64 ));
            args.push_back(ARG(Ifcall->first->line ,ARGI64 ));
            args.push_back(ARG(F->index));
            args.push_back(ARG(Inst->sourcefile,variablename.str() ,ARGSL));
            variablename << "_" ;
            args.push_back(ARG (Inst->directory,variablename.str(), ARGSL));
            llvm::CallInst * cc = CreateCallInst(M,LastPoint,true,regh,args) ;
            LastPoint = cc ;
            //debug << "store heap info in app : " << Ifcall->first->line << " " << Heap_fcall_index <<  go;
            
        }

        //osMessage result  ("staticresult2.csv") ;
        
        // store stack totals info
        u_int64_t Stack_fcall_index = 0 ;
        debug << " store stack in result file : " << stacklist.size() << go ;
        sdmllvm::function * regs  = M->pf_functions["sdmprofile__Store_StackTotalsInfo"];
        for (instmap_I Ifcall = stacklist.begin() ; Ifcall != stacklist.end();++Ifcall)
        {
            llvm::Instruction * fcall = Ifcall->first->base  ;
            u_int64_t souceline = Ifcall->first->line ;
            sdmllvm::function * F = M->functionmap[fcall->getParent()->getParent()];
            Stack_fcall_index++;
            indexes[fcall] = Stack_fcall_index;
            ARGV args;
            args.push_back(ARG(Stack_fcall_index  ,ARGI64 ));
            args.push_back(ARG(souceline ,ARGI64 ));
            args.push_back(ARG(F->index));
            llvm::CallInst * cc = CreateCallInst(M,LastPoint,true,regs,args) ;
            LastPoint = cc ;
            
        }
        
        
        debug << " store GV in result file : " << M->gvmap.size() << go ;
        sdmllvm::function * reggv  = M->pf_functions["sdmprofile__Register_GV"];
        u_int64_t cc = 0;
        for (long ixx = 1 ; ixx <= M->gvindexmap.size() ; ixx ++ )
        {
            sdmllvm::globalvariable *GV = M->gvindexmap[ixx]   ;
            std::string  name_string ("sdmprofile__GV_Name_" + GV->Name());
            std::string  type_string ("sdmprofile__GV_Type_" + GV->Name());
            indexes[GV->base] =  GV->index;
            
            ARGV args ;
            args.push_back (ARG((u_int32_t) GV->index));
            args.push_back (ARG(GV->base,ARGpti ));
            args.push_back (ARG(GV->MemorySize()));
            args.push_back (ARG(GV->Name(), name_string,ARGSL));
            args.push_back (ARG(GV->TypeString(), type_string,ARGSL) );
            llvm::CallInst * fcall = sdmllvm::CreateCallInst(M, LastPoint,true, reggv , args );
            LastPoint = fcall ;
        }
        
        return LastPoint;
    }
    
    int  GV_profiling_only(std::string InputFilename, std::string OutputFilename,int action,bool Convert_object_file)
    {
        message << go << "\tSDM Profile Tool " << go << "\tOptions :" << go <<  "\t Scope\t\t: Global Variables " << go <<
         "\t Input File \t: " << InputFilename << go << "\t Output File \t: " << OutputFilename << go ;
        
        M = new sdmllvm::module();
        M->LoadApp(InputFilename, "profile_functions.bc"   );
        
        PlaceInitEnd();
    
        sdmllvm::function *  logfunction  = M->pf_functions["sdmprofile__profile_access3"];
        sdmllvm::Insert_log_default(   M ,   logfunction );
        
        Save_Output(InputFilename , OutputFilename , Convert_object_file );
        return  1;
    }
    
    
    int heap_profiling_only (std::string InputFilename,std::string OutputFilename, int action,bool Convert_object_file)
    {
        std::stringstream so ;
        profileType = action ;
        so << "\n" << "\tSDM Profile Tool " << "\n" << "\tOptions :" << "\n" <<  "\t Scope\t\t: Heap Variables " << "\n" << "\t Input File \t: " << InputFilename << "\n" << "\t Output File \t: " << OutputFilename  ;
        message << so.str() << go ;
        debug << so.str() << go ;
        
        M = new sdmllvm::module();
        M->LoadApp(InputFilename, "profile_functions.bc"   );
        
        // collect all malloc and free function call instructions
        llvm::Function * fmalloc = M->Mod->getFunction ("malloc");
        llvm::Function * ffree = M->Mod->getFunction("free") ;
        
        Collect_FcallInst(M,fmalloc,&malloclist);
        instmap_t  freelist ; Collect_FcallInst(M,ffree,&freelist);
        
        debug << "Malloc Call Instruction Count:" << malloclist.size() << go;
        debug << "Free Call Instruction Count:" << freelist.size() << go;
        
        PlaceInitEnd();
        
        // replace all malloc and free function call instruction with profile malloc/free function
        function * pf_malloc = M->pf_functions["sdmprofile__malloc"];
        function * pf_free = M->pf_functions["sdmprofile__free"];
        
        for (instmap_I Ifcall = malloclist.begin() ; Ifcall != malloclist.end();++Ifcall)
        {
            llvm::CallInst * fcall = llvm::dyn_cast<llvm::CallInst >(Ifcall->first->base)  ;
            sdmllvm::function * F = M->functionmap[fcall->getParent()->getParent()];
            ARGV args;
            args.push_back(ARG(fcall->getArgOperand(0)));
            args.push_back(ARG( indexes[fcall] ,ARGI64 ));
            args.push_back(ARG(F->index));
            llvm::CallInst * cc = CreateCallInst(M,fcall,true,  pf_malloc,args) ;
            fcall->replaceAllUsesWith(cc);
            fcall->eraseFromParent();
        }
        for (instmap_I Ifcall = freelist.begin() ; Ifcall != freelist.end();++Ifcall)
        {
            llvm::CallInst * fcall = llvm::dyn_cast<llvm::CallInst >(Ifcall->first->base)  ;
            fcall->setCalledFunction(pf_free->base);
        }
        
        sdmllvm::function *  logfunction  = M->pf_functions["sdmprofile__profile_access1"];
        // place log fuctions
        {
            for (sdmllvm::module::functionmapI  FI  = M->functionmap.begin(), FE = M->functionmap.end(); FI != FE; ++FI)
            {
                sdmllvm::function * FF = FI->second ;
                for (sdmllvm::function::bbmapI BI = FF->bbmap.begin(), BE = FF->bbmap.end();BI != BE; ++BI)
                {
                    sdmllvm::basicblock * BB = BI->second ;
                    for (sdmllvm::basicblock::meminstmapI II = BB->meminstmap.begin(), IE = BB->meminstmap.end(); II != IE; ++II)
                    {
                        sdmllvm::MemoryAccessInst * mem = II->second ;
                        
                        ARGV args {ARG( mem->getPointerOperand(),ARGpti),ARG(mem->AccessType,ARGI8 ) } ;
                        sdmllvm::CreateCallInst(M,mem->base , false ,logfunction ,args ) ;
                        
                        
                        //cc++;
                    }
                }
            }
            
        }
        
        Save_Output(InputFilename , OutputFilename , Convert_object_file );
        return 1;
    }
    
    
    
    int stack_profiling_only(std::string InputFilename, std::string OutputFilename,int action ,bool Convert_object_file )
    {
        message << go << "\tSDM Profile Tool " << go << "\tOptions :" << go <<  "\t Scope\t\t: Heap Variables " << go <<
        "\t Input File \t: " << InputFilename << go << "\t Output File \t: " << OutputFilename << go ;
        
        M = new sdmllvm::module();
        M->LoadApp(InputFilename, "profile_functions.bc"   );
        
        // collect all stack allocation instructions
        Collect_Inst(M,sdmllvm::InstType::StackAllocationInst, &stacklist) ;
        
        PlaceInitEnd();
        
        function * Add_stack_allocation  = M->pf_functions["sdmprofile__Add_stack_allocation"];
        function * Reg_Current_executing_f = M->pf_functions["sdmprofile__Register_Current_executing_function"];
        function * Exit_Current_executing_f = M->pf_functions["sdmprofile__Exit_Current_executing_function"];
        function * mainf  = M->functionmap[M->Mod->getFunction ("main" )] ;
        globalvariable * mainF_info = M->pf_globalvariables["sdmprofile__MainFunction"];
        
        std::map <sdmllvm::function * , llvm::Value *> function_info_map ;
        function_info_map[mainf] = mainF_info->base ;
        
        for (instmap_I II = stacklist.begin() ; II != stacklist.end();++II)
        {
            llvm::Instruction * Inst = II->first->base ;
            llvm::Value * function_info ;
            sdmllvm::function * F = M->functionmap[ Inst->getParent()->getParent()] ;
            
            if (!(function_info_map[F]))
            {
                llvm::CallInst * InitcallInst = sdmllvm::WrapAfunction_head(M,F,Reg_Current_executing_f, ARGV {ARG (F->index)}  );
                sdmllvm::WrapAfunction_tail(M,F,Exit_Current_executing_f , ARGV {ARG(InitcallInst)});
                                function_info_map[F] = InitcallInst ;
            }
            
            function_info = function_info_map[F];
            int MemorySize = M->TD->getTypeAllocSize( ((llvm::AllocaInst *)(Inst))-> getAllocatedType());
            
            ARGV args;
            args.push_back(ARG(Inst,ARGpti));
            args.push_back(ARG(function_info )) ;
            args.push_back(ARG(MemorySize,ARGI64));
            args.push_back(ARG(indexes[Inst],ARGI64 ));
            CreateCallInst(M,Inst,true, Add_stack_allocation,args) ;
        }
        
        
        
        sdmllvm::function *  logfunction  = M->pf_functions["sdmprofile__profile_access2"];
        int cc = 0;
        for (sdmllvm::module::functionmapI  FI  = M->functionmap.begin(), FE = M->functionmap.end(); FI != FE; ++FI)
        {
            sdmllvm::function * FF = FI->second ;
            for (sdmllvm::function::bbmapI BI = FF->bbmap.begin(), BE = FF->bbmap.end();BI != BE; ++BI)
            {
                sdmllvm::basicblock * BB = BI->second ;
                for (sdmllvm::basicblock::meminstmapI II = BB->meminstmap.begin(), IE = BB->meminstmap.end(); II != IE; ++II)
                {
                    sdmllvm::MemoryAccessInst * mem = II->second ;
                    sdmllvm::function * F = M->functionmap[ mem->base->getParent()->getParent()] ;
                    llvm::Value * function_info ;
                    function_info = function_info_map[F];
                    ARGV args {ARG( mem->getPointerOperand(),ARGpti),ARG(mem->AccessType,ARGI8 ),ARG(function_info ) } ;
                    CreateCallInst(M,mem->base , false ,logfunction ,args ) ;
                    cc++;
                }
                
            }
        }
        
        Save_Output(InputFilename , OutputFilename , Convert_object_file );
        
        return 1;
    }
    
    int All_profiling(std::string InputFilename, std::string OutputFilename,int action ,bool Convert_object_file )
    {
        //profileType = 4;
        message << go << "\tSDM Profile Tool " << go << "\tOptions :" << go <<  "\t Scope\t\t: All  " << go <<
        "\t Input File \t: " << InputFilename << go << "\t Output File \t: " << OutputFilename << go ;
        
        M = new sdmllvm::module();
        M->LoadApp(InputFilename, "profile_functions.bc"   );
        
        function * mainf  = M->functionmap[M->Mod->getFunction ("main" )] ;
        
        // collect all malloc and free function call instructions
        llvm::Function * fmalloc = M->Mod->getFunction ("malloc");
        llvm::Function * ffree = M->Mod->getFunction("free") ;
        Collect_FcallInst(M,fmalloc,&malloclist);
        instmap_t  freelist; Collect_FcallInst(M,ffree, & freelist);
        
        // collect all stack allocation instructions
        Collect_Inst(M,sdmllvm::InstType::StackAllocationInst,&stacklist) ;
        
        PlaceInitEnd();
        
        // replace all malloc and free function call instruction with profile malloc/free function
        function * pf_malloc = M->pf_functions["sdmprofile__malloc"];
        function * pf_free = M->pf_functions["sdmprofile__free"];
        
        for (instmap_I Ifcall = malloclist.begin() ; Ifcall != malloclist.end();++Ifcall)
        {
            llvm::CallInst * fcall = llvm::dyn_cast<llvm::CallInst >(Ifcall->first->base)  ;
            sdmllvm::function * F = M->functionmap[fcall->getParent()->getParent()];
            ARGV args;
            args.push_back(ARG(fcall->getArgOperand(0)));
            args.push_back(ARG(indexes[fcall]  ,ARGI64 ));
            args.push_back(ARG(F->index));
            llvm::CallInst * cc = CreateCallInst(M,fcall,true,  pf_malloc,args) ;
            fcall->replaceAllUsesWith(cc);
            fcall->eraseFromParent();
        }
        for (instmap_I Ifcall = freelist.begin() ; Ifcall != freelist.end();++Ifcall)
        {
            llvm::CallInst * fcall = llvm::dyn_cast<llvm::CallInst >(Ifcall->first->base)  ;
            fcall->setCalledFunction(pf_free->base);
        }
        
        function * Add_stack_allocation  = M->pf_functions["sdmprofile__Add_stack_allocation"];
        function * Reg_Current_executing_f = M->pf_functions["sdmprofile__Register_Current_executing_function"];
        function * Exit_Current_executing_f = M->pf_functions["sdmprofile__Exit_Current_executing_function"];
        globalvariable * mainF_info = M->pf_globalvariables["sdmprofile__MainFunction"];
        
        std::map <sdmllvm::function * , llvm::Value *> function_info_map ;
        function_info_map[mainf] = mainF_info->base ;
       
        for (instmap_I II = stacklist.begin() ; II != stacklist.end();++II)
        {
            llvm::Instruction * Inst = II->first->base ;
            llvm::Value * function_info ;
            sdmllvm::function * F = M->functionmap[ Inst->getParent()->getParent()] ;
            
            if (!(function_info_map[F]))
            {
                llvm::CallInst * InitcallInst = sdmllvm::WrapAfunction_head(M,F,Reg_Current_executing_f, ARGV {ARG (F->index)}  );
                sdmllvm::WrapAfunction_tail(M,F,Exit_Current_executing_f , ARGV {ARG(InitcallInst)});
                function_info_map[F] = InitcallInst ;
            }
            
            function_info = function_info_map[F];
            int MemorySize = M->TD->getTypeAllocSize( ((llvm::AllocaInst *)(Inst))-> getAllocatedType());
            
            ARGV args;
            args.push_back(ARG(Inst,ARGpti));
            args.push_back(ARG(function_info )) ;
            args.push_back(ARG(MemorySize,ARGI64));
            args.push_back(ARG(indexes[Inst],ARGI64 ));
            CreateCallInst(M,Inst,true, Add_stack_allocation,args) ;
        }
        
        sdmllvm::function *  logfunction  = M->pf_functions["sdmprofile__profile_access4"];
        for (sdmllvm::module::functionmapI  FI  = M->functionmap.begin(), FE = M->functionmap.end(); FI != FE; ++FI)
        {
            sdmllvm::function * FF = FI->second ;
            for (sdmllvm::function::bbmapI BI = FF->bbmap.begin(), BE = FF->bbmap.end();BI != BE; ++BI)
            {
                sdmllvm::basicblock * BB = BI->second ;
                for (sdmllvm::basicblock::meminstmapI II = BB->meminstmap.begin(), IE = BB->meminstmap.end(); II != IE; ++II)
                {
                    sdmllvm::MemoryAccessInst * mem = II->second ;
                    sdmllvm::function * F = M->functionmap[ mem->base->getParent()->getParent()] ;
                    llvm::Value * function_info ;
                    function_info = function_info_map[F];
                    ARGV args {ARG( mem->getPointerOperand(),ARGpti),ARG(mem->AccessType,ARGI8 ),ARG(function_info ) } ;
                    CreateCallInst(M,mem->base , false ,logfunction ,args ) ;
                     
                }
                
            }
        }

        Save_Output(InputFilename , OutputFilename , Convert_object_file );
        
        return 1 ;
    }
    
    
    
}


using namespace llvm ;

static llvm::cl::opt<std::string> OutputFilename("o", llvm::cl::desc("output filename"), llvm::cl::value_desc("filename"));
static llvm::cl::opt<std::string> InputFilename ("i", llvm::cl::desc("input filename"), llvm::cl::value_desc("filename"));
static llvm::cl::opt<int> job ("a", llvm::cl::desc("action \n 1  Heap variable profiling only (heap variables allocated with malloc) \n 2  Stack variable profiling only \n 3  Global variable only \n 4  All variable (Heap,Stack,Global) \n 6 generate .csv file profile results "), llvm::cl::value_desc("number"));
static llvm::cl::opt<bool> Convert_object_file("obj", llvm::cl::desc("convert output bitcode to object file"));
static cl::extrahelp MoreHelp( help___  );

int main (int argc, char ** argv)
{
    //llvm_shutdown_obj Y;
    message.show = true;
    debug.show = true ; // set to false to disable logging
    int action;
    std::string outf ;
    std::string inf ;
    bool obj ;
    
    if (argc == 2)
    {
        inf =  std::string(argv[1]) ;
        if (inf == "-h" || inf == "--help")
        {
            // show help and exit
            message  << help___ << go  ;
            return 1;
        }
        
        outf = inf;
        boost::replace_last(outf , ".bc",".o");
        action = 4;
        obj = true ;
    }else
    {
        cl::ParseCommandLineOptions(argc, argv, "");
        action = job ;
        inf = InputFilename ;
        outf =  OutputFilename ;
        obj = Convert_object_file ;
    }
    
    switch (action)
    {
        case HEAP_:
            profile_simple::heap_profiling_only(inf, outf, action, obj);
            break;
        case STACK_:
            profile_simple::stack_profiling_only(inf, outf, action, obj);
            break ;
        case GV_:
            profile_simple::GV_profiling_only(inf, outf, action, obj);
            break ;
        case ALL_:
            profile_simple::All_profiling(inf, outf, action, obj);
            break ;
        default:
            break;
    }
    return 0 ;
}



