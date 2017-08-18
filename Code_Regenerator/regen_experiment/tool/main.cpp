//===                             main.cpp                                  ==//
//
//                     Application Memory Profiling Tool
//
//              Developed by System Design Methodology Laboratory
//                   Hanyang University, Seoul, South Korea
//
//===----------------------------------------------------------------------===//

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "main.h"

using namespace llvm ;

namespace profiletool
{
    int profileAction ;
    bool IncludeStackProfiling;
    bool IncludeThreadProfiling;
    
    Module *M;
    
    Function  * app_mainf;
    Function  * new_mainf;
    
    instmap_t  malloclist , freelist , stacklist ;
    
    std::map<llvm::BasicBlock * , llvm::GlobalVariable *> BBHitCount_variable_List ;

    std::map <BasicBlock * , std::vector<Memaccess *> *> All_BBMemaccess;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBGVmap ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBGVmapR ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBGVmapW ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBSTmap ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBSTmapR ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBSTmapW ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBHPmap ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBHPmapR ;
    std::map <BasicBlock * , std::map<Value *,int > *> All_BBHPmapW ;
    U_64T TraceStats_TotalGV, TraceStats_TotalST ,TraceStats_TotalHP, TraceStats_TotalUnknown,MemInst;
    long BBcount ;
    
    // TODO: map of function and the entry block count increamenter instruction
    std::map<std::string , Instruction *> FntBBcounterMap;
    
    Type * NewArg1Type ;
    Type * NewArg2Type  ;
    
}

namespace profiletool
{
    
    int Profile_application(std::string InputFilename, std::string OutputFilename,int action,bool Convert_to_objectfile)
    {
        message.show = true;
        debug.show = true;
        
        std::string scope = "";
        switch (profileAction)
        {
            case GV_:
            {
                IncludeStackProfiling = false ;
                IncludeThreadProfiling = true ;
                scope = "Global Variables" ;
            }
                break;
            case HEAP_ :
            {
                IncludeStackProfiling = false ;
                IncludeThreadProfiling = true ;
                scope = "Heap (malloc allocations)";
                
            }
                break;
            case STACK_:
            {
                IncludeStackProfiling = true ;
                IncludeThreadProfiling = true ;
                scope = "Stack (local allocations)";
                
            }
                break;
            case ALL_:
            {
                IncludeStackProfiling = true ;
                IncludeThreadProfiling = true ;
                scope = "All (Global, Stack and Heap Variables)";
            }
                break ;
            default:
                break;
        }
        
        
        message << go << "\tSDM New Memory Profile Tool" << go << "\tOptions :" << go <<  "\t Scope\t\t: " << scope << go <<
        "\t Input File \t: " << InputFilename << go << "\t Output File \t: " << OutputFilename << go ;
        
        
        pf_prefix = "sdmprofile__";
        M  = LoadIRFile(InputFilename ,"PF.bc");
        
        if (IncludeStackProfiling || IncludeThreadProfiling)
        {
            if (AppendArgs ()){}
            else
            {
                return 0;
            }
        }
        
        WrapAppMainFunction();
        
        if (profileAction == STACK_)
        {
             Collect_AllocaInst(M, &stacklist) ;
             debug << stacklist.size() << go ;
        }
        else if (profileAction == HEAP_)
        {
            // collect all function call instructions to malloc and free
            llvm::Function * fmalloc = M->getFunction ("malloc");
            Collect_FcallInst(M,fmalloc,&malloclist);
            llvm::Function * ffree = M->getFunction("free") ;
            Collect_FcallInst(M,ffree,&freelist);
        }
        else if ( profileAction == ALL_)
        {
            Collect_AllocaInst(M, &stacklist) ;
            debug << stacklist.size() << go ;
            // collect all function call instructions to malloc and free
            llvm::Function * fmalloc = M->getFunction ("malloc");
            Collect_FcallInst(M,fmalloc,&malloclist);
            llvm::Function * ffree = M->getFunction("free") ;
            Collect_FcallInst(M,ffree,&freelist);
        }
        
        //Collect memory access (Load/Store) Instruction
        Collect_MemaccessInst(M,&All_BBMemaccess);
        
        //debug << "SET INDEXES" << go ;
        {
            //TODO : review index implementation
            
            U_64T i = 1;
            for (strMapI I = app_GVlist.begin() , Ie = app_GVlist.end() ; I != Ie ; ++I)
            {
                SetIndex(getgv (M,I->first) , i++);
            }
            
            i = 1;
            for (instmap_I I = stacklist.begin() , Ie = stacklist.end() ; I != Ie ; ++I)
            {
                SetIndex(I->first , i++);
                debug << "ST : " << GetIndex(I->first) << " >> " << I->first << go ;
            }
            
            i = 1;
            if (malloclist.size() > 0)
            {
                for (instmap_I I = malloclist.begin() , Ie = malloclist.end() ; I != Ie ; ++I)
                {
                    SetIndex(I->first , i++);
                }
            }
            
            BBcount=1;
            for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
            {
                Function * F ;
                if (( F = M->getFunction(IFstr->first)) )
                {
                    for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                    {
                        BasicBlock * B = (BI) ;
                        SetIndex(B, BBcount++);
                    }
                }
                else
                {
                    //debug << " : Not Exist" <<    go ;
                }
            }
            
        }
        
        ProcessBBmemaccesses();
        Pre_execution_processes();
        Post_execution_processes() ;
        
        if (profileAction == HEAP_  )
        {
            ReplaceMallocAndFree();
        }
       
        if (IncludeStackProfiling )
        {
            Stack_registration_codes();
        }
        
        Profile_unknown_memaccess();
        VerifyModule(M);
        Save_Module_to_File(M,InputFilename , OutputFilename , Convert_to_objectfile);
        return  1;
    }
    
    
    int AppendArgs()
    {
        GlobalVariable * var = M->getGlobalVariable ( "sdmprofile__MainthreadStack_allo");
        NewArg1Type  = Int32Ty ;
        NewArg2Type = ((PointerType*)var->getType())->getElementType();
        
        for (strMapI strI = app_fntlist.begin() ; strI != app_fntlist.end(); ++strI)
        {
            Function * F ;
            if (!(F = M->getFunction(strI->first) ))
            { continue ;}
        
            if (F->getBasicBlockList().size() == 0 ) // external function
            { continue ; }
            
            if (F->getName().str().find("_GLOBAL__") != std::string::npos) // llvm intrisic function
            {   continue; }
            
            if (F-> getFunctionType ()->isVarArg()) // exclude Function with variable Arguments
            {continue;}
            
          
            Function * new_f ;
            ModifiedFunctionMeta * FMeta = new ModifiedFunctionMeta();
            FMeta->Name = F->getName();
            FMeta->OldName = FMeta->Name + "_original" ;
            ModifiedFunctions[F->getName()] = FMeta ;
            
            // create FunctionType with new arg at end
            std::vector<Type*> ArgTypes;
            for (Function::const_arg_iterator I = F->arg_begin(), E = F->arg_end();I != E; ++I)
            {ArgTypes.push_back(I->getType());}
            ArgTypes.push_back(NewArg1Type);
            if (IncludeStackProfiling) ArgTypes.push_back(NewArg2Type);
            FunctionType *FTy = FunctionType::get(F->getFunctionType()->getReturnType(),ArgTypes, F->getFunctionType()->isVarArg());
            // create the new function
            F->setName (FMeta->OldName);
            new_f = Function::Create(FTy,F->getLinkage(), FMeta->Name  ,M) ;
            new_f->copyAttributesFrom(F);
        
            // Set arg names
            Function::arg_iterator DestI = new_f->arg_begin();
            for (Function::const_arg_iterator I = F->arg_begin(), E = F->arg_end();I != E; ++I)
            { DestI->setName(I->getName()); ++DestI; }
            FMeta->NewArg1Name = pf_prefix + std::string("threadnumber");
            DestI->setName(FMeta->NewArg1Name);
            if (IncludeStackProfiling)
            {
                ++DestI;
                FMeta->NewArg2Name = pf_prefix + std::string("stactAlloPtr");
                DestI->setName(FMeta->NewArg2Name);
            }
            
            // Copy old function body into new function
            ValueToValueMapTy VMap;
            copyFunctionBody(*new_f, *F  , VMap);
            
            for (Function::const_arg_iterator I = new_f->arg_begin(), E = new_f->arg_end();I != E; ++I)
            {
                if      (I->getName() == FMeta->NewArg1Name){ FMeta->NewArg1 = &(*I) ; }
                else if (I->getName() == FMeta->NewArg2Name){ FMeta->NewArg2 = &(*I) ; }
            }
            
            // Create stack allocation to hold new arguments
            //TODO :
            {
                // Find Last Alloca instruction
                BasicBlock * EntryB = &new_f->getEntryBlock();
                AllocaInst  * LastAllocaInst ;
                Instruction * FirstInstruction ;
                StoreInst * LastArgStoreInst = 0;
                bool HasAllocaInst = false ;
                
                for (BasicBlock::iterator II =  EntryB->begin(), IE = EntryB->end(); II != IE; ++II)
                {
                    if (AllocaInst::classof(II))
                    {
                        LastAllocaInst = llvm::dyn_cast<llvm::AllocaInst>( II) ;
                        HasAllocaInst = true;
                    }
                    
                    if (StoreInst::classof(II))
                    {
                        StoreInst *store = llvm::dyn_cast<llvm::StoreInst>(II);
                        for (Function::const_arg_iterator I = new_f->arg_begin(), E = new_f->arg_end();I != E; ++I)
                        {
                            if(store->getValueOperand () == I )
                            {
                                LastArgStoreInst =  store  ;
                            }
                        }
                        
                     }
                    
                    if (!(AllocaInst::classof(II) || (StoreInst::classof(II))))
                    {
                        FirstInstruction = II ;
                        break ;
                    }
                }
                
                FMeta->NewArg1_StackHolder = new AllocaInst(NewArg1Type ,  FMeta->NewArg1Name + std::string("_st") ,EntryB);
                FMeta->NewArg1_StackHolder->setAlignment(TD->getABITypeAlignment ( NewArg1Type ));
                
                AddedInstruction[FMeta->NewArg1_StackHolder] = 1;
                
                if (HasAllocaInst)
                {
                    FMeta->NewArg1_StackHolder->moveBefore(LastAllocaInst);
                    LastAllocaInst->moveBefore(FMeta->NewArg1_StackHolder);
                }
                else
                {
                    BasicBlock::iterator II = EntryB->begin();
                    FMeta->NewArg1_StackHolder->moveBefore(II);
                    LastAllocaInst = FMeta->NewArg1_StackHolder;
                }
                
                if (IncludeStackProfiling)
                {
                    FMeta->NewArg2_StackHolder = new AllocaInst( NewArg2Type,  FMeta->NewArg2Name + std::string("_st") ,EntryB );
                    FMeta->NewArg2_StackHolder->setAlignment(TD->getABITypeAlignment (NewArg2Type ));
                    FMeta->NewArg2_StackHolder->moveBefore(FMeta->NewArg1_StackHolder);
                    FMeta->NewArg1_StackHolder->moveBefore(FMeta->NewArg2_StackHolder);
                    AddedInstruction[FMeta->NewArg2_StackHolder] = 1;
                }
                
                StoreInst* void_10 = new StoreInst((Value *)FMeta->NewArg1  , FMeta->NewArg1_StackHolder, false, EntryB);
                void_10->setAlignment(TD->getABITypeAlignment ( Int32Ty));
                
                if (LastArgStoreInst == 0)
                {
                    if (IncludeStackProfiling)
                    {
                        void_10->moveBefore( FMeta->NewArg2_StackHolder);
                        FMeta->NewArg2_StackHolder->moveBefore(void_10);
                    }else
                    {
                        void_10->moveBefore( FMeta->NewArg1_StackHolder);
                        FMeta->NewArg1_StackHolder->moveBefore(void_10);
                    }
                    
                }else
                {
                    void_10->moveBefore(LastArgStoreInst);
                    LastArgStoreInst->moveBefore(void_10);
                }
                
                FMeta->NewArg1_StoreToStack = void_10;
                AddedInstruction[ void_10] = 1;
                
                if (IncludeStackProfiling)
                {
                    StoreInst* void_11 = new StoreInst((Value *)FMeta->NewArg2  , FMeta->NewArg2_StackHolder, false,EntryB);
                    void_11->setAlignment(TD->getABITypeAlignment ( NewArg2Type));
                    void_11->moveBefore(void_10);
                    void_10->moveBefore(void_11);
                    
                    FMeta->NewArg2_StoreToStack = void_11;
                    AddedInstruction[ void_11] = 1;
                    
                }
            }
            
        }
        
        
        // Clean up
 
        // Clear body of original functions
        for (ModifiedFunctionsI I = ModifiedFunctions.begin() ; I != ModifiedFunctions.end(); ++I)
        {
            Function * F ;
            if (!(F = M->getFunction(I->second->OldName) )){ continue ;}
            llvm::GlobalValue::LinkageTypes LinkTy = F->getLinkage();
            F->deleteBody();
            F->setLinkage(LinkTy) ;
        }
        
        // fill in original function with codes to call function
        for (ModifiedFunctionsI I = ModifiedFunctions.begin() ; I != ModifiedFunctions.end(); ++I)
        {
            Function * F ;
            if (!(F = M->getFunction(I->second->OldName) )){ continue ;}
            std::map< const Argument * , AllocaInst * >Map1 ;
            BasicBlock * EntryB = llvm::BasicBlock::Create(M->getContext(), "",F ,0);
            Instruction * linst;
            
            for (Function::const_arg_iterator argI = F->arg_begin(), argIE = F->arg_end();argI != argIE; ++argI)
            {
                AllocaInst * al = new AllocaInst(argI->getType(), argI->getName() + std::string("_st") ,EntryB);
                Map1[argI] = al ;
            }
            AllocaInst * althd = new AllocaInst(  NewArg1Type,  std::string("thdnumber_st") ,EntryB);
            linst = (Instruction*)althd ;
            
            for (Function::const_arg_iterator argI = F->arg_begin(), argIE = F->arg_end();argI != argIE; ++argI)
            {
                const Argument * Arg = argI ;
                StoreInst* st = new StoreInst((Value *)Arg,Map1[argI], false, EntryB);
                st->setAlignment(TD->getABITypeAlignment(argI->getType()));
                linst = st ;
            }
            
            Function * FindThread = M->getFunction(pf_prefix + "FindThread") ;
            
            CallArguments arg ;
            CallInst * call =  CreateCallInst(M, FindThread,arg ,linst,true);
            
            CallArguments arg2 ;
            for (Function::const_arg_iterator argI = F->arg_begin(), argIE = F->arg_end();argI != argIE; ++argI)
            {
                arg2.add (Map1[argI] , CallArguments::LoadST );
            }
            arg2.add(call);
            CallInst * call2 =  CreateCallInst(M, M->getFunction(I->second->Name), arg2,call,true);
            
            if (F->getReturnType()->isVoidTy() )
            {
                ReturnInst::Create(M->getContext(), EntryB);
            }
            else
            {
                ReturnInst::Create(M->getContext(), call2, EntryB);
            }
        }
        
        // Edit all instructions that calls original function to call the new function
        // and add the extra arguments
        std::vector<CallInst * > CleanInsts ;
        for (ModifiedFunctionsI I = ModifiedFunctions.begin() ; I != ModifiedFunctions.end(); ++I)
        {
            Function * F ;
            if (!(F = M->getFunction(I->second->OldName) )){continue ;}
            Function * new_fnt = M->getFunction(I->second->Name);
            
            llvm::Value::user_iterator Iu = F->user_begin() ;
            llvm::Value::user_iterator Iue = F->user_end  () ;
            for ( ; Iu != Iue ; ++Iu)
            {
                //debug << "\t" << (*Iu) << go ;
                if ((CallInst::classof(*Iu)) && (((CallInst *)(*Iu))->getCalledFunction()  == F ))
                {
                    llvm::CallInst * callinst = (llvm::CallInst*)*Iu ;
                    ModifiedFunctionMeta * FMeta = ModifiedFunctions[callinst->getParent()->getParent()->getName()];
                 
                    LoadInst* ptr_11 = new LoadInst( FMeta->NewArg1_StackHolder ,   NameInst("LD") , false, callinst->getParent());
                    ptr_11->setAlignment(8);
                    ptr_11->moveBefore(callinst);
                    AddedInstruction[ptr_11] = 1;
                    
                    LoadInst* ptr_12;
                    if (IncludeStackProfiling)
                    {
                        ptr_12 = new LoadInst(FMeta->NewArg2_StackHolder  ,   NameInst("LD"), false, callinst->getParent());
                        ptr_12->setAlignment(4);
                        ptr_12->moveBefore(callinst);
                        AddedInstruction[ptr_12] = 1;
                    }
                    
                    CallArguments args ;
                    for (unsigned int ix = 0 ; ix < callinst->getNumArgOperands() ; ix ++ )
                    {
                        args.add(callinst->getArgOperand(ix));
                    }
                    args.add(ptr_11 );
                    if (IncludeStackProfiling) {args.add(ptr_12 );}
                    
                    llvm::CallInst * fcall = CreateCallInst(M, new_fnt , args ,callinst);
                    callinst->replaceAllUsesWith(fcall);
                    CleanInsts.push_back(callinst);
                }
            }
        }
        
        // erase previous instruction
        for (auto &I : CleanInsts ){ I->eraseFromParent(); }
        
        return  1;
    }
    
    llvm::IRBuilder<> * B_builder;
    llvm::Instruction * PreMainfunctionCallPoint = nullptr ;
    llvm::Instruction * PreReturnInstructionPoint;
    
    void WrapAppMainFunction()
    {
        app_mainf  = M->getFunction ("main" );
        app_mainf->setName("app__mainfunction__");
        app_fntlist["app__mainfunction__"] = 1 ;
        app_fntlist.erase ("main") ;
        
        if (IncludeStackProfiling || IncludeThreadProfiling)
        {
            ModifiedFunctions["app__mainfunction__"] = ModifiedFunctions["main"] ;
            ModifiedFunctions.erase("main");
            FntBBcounterMap["app__mainfunction__"] = FntBBcounterMap["main"];
            FntBBcounterMap.erase("main");
        }
        
        std::map < std::string  ,AllocaInst*> arg_ptrmap ;
        AllocaInst* return_stackholder   ;
        BasicBlock* EntryBB;
        // create a new main function with original main function signature
        {
            std::vector<Type*> ArgTypes;
            int ArgCount = app_mainf->arg_size () ;
            if(IncludeThreadProfiling){ ArgCount -= 1;}
            if(IncludeStackProfiling){ArgCount -= 1;}
            
            // create FunctionType from original main function
            Function::const_arg_iterator I = app_mainf->arg_begin();
            for (int ix = 0 ; ix < ArgCount ; ix++) { ArgTypes.push_back(I->getType()); ++I ;}
            FunctionType *FTy = FunctionType::get(app_mainf->getFunctionType()->getReturnType(),ArgTypes, app_mainf->getFunctionType()->isVarArg());
            
            // create new main function
            new_mainf = Function::Create(FTy,app_mainf->getLinkage(),"main",M) ;
            new_mainf->copyAttributesFrom(app_mainf);
            
            // set arg names
            Function::arg_iterator DestI = new_mainf->arg_begin();
            I = app_mainf->arg_begin();
            for (int ix = 0 ; ix < (ArgCount ); ix++)
            { DestI->setName(I->getName()); ++DestI;++I; }
            
            EntryBB = llvm::BasicBlock::Create(M->getContext(), "",new_mainf ,0);
            B_builder = new llvm::IRBuilder<> ( EntryBB);
            
            for (Function::arg_iterator I = new_mainf->arg_begin(), E = new_mainf->arg_end();I != E; ++I)
            {
                AllocaInst* ptr__ = new AllocaInst( I->getType(),  I->getName() + std::string("_ptr"),EntryBB );
                ptr__->setAlignment(TD->getABITypeAlignment (I->getType()) );
                arg_ptrmap[I->getName().str()] = ptr__ ;
            }
            
        }
        
        // allocate stack space for return value
        return_stackholder = new AllocaInst( app_mainf->getReturnType	(), "rtn", EntryBB);
        return_stackholder->setAlignment(TD->getABITypeAlignment (app_mainf->getReturnType	()));
        
        // store arguments in stack variables
        for (Function::arg_iterator I = new_mainf->arg_begin(), E = new_mainf->arg_end();I != E; ++I)
        {
            StoreInst* stinst = new StoreInst(I , arg_ptrmap[I->getName().str()] , false, EntryBB);
            stinst->setAlignment(TD->getABITypeAlignment (I->getType()));
        }
        
        // Call App main function
        {
            std::vector<Value*> main_params;
            
            for (Function::arg_iterator I = new_mainf->arg_begin(), E = new_mainf->arg_end();I != E; ++I)
            {
                LoadInst* ldinst = new LoadInst(arg_ptrmap[I->getName().str()], "", false, EntryBB);
                ldinst->setAlignment(TD->getABITypeAlignment (I->getType()));
                main_params.push_back(ldinst);
                if (PreMainfunctionCallPoint == nullptr) { PreMainfunctionCallPoint = ldinst ;}
            }
            
            LoadInst* load_ptr_for_mainfnt_call ;
            
            if(IncludeThreadProfiling)
            {
                load_ptr_for_mainfnt_call = new LoadInst(M->getGlobalVariable (pf_prefix + "MainthreadNumber"), "", false, EntryBB  );
                load_ptr_for_mainfnt_call->setAlignment(TD->getABITypeAlignment (NewArg1Type));
                main_params.push_back(load_ptr_for_mainfnt_call );
            }
            if (IncludeStackProfiling)
            {
                load_ptr_for_mainfnt_call = new LoadInst(M->getGlobalVariable (pf_prefix +  "MainthreadStack_allo"), "", false, EntryBB  );
                load_ptr_for_mainfnt_call->setAlignment(TD->getABITypeAlignment(NewArg2Type));
                main_params.push_back(load_ptr_for_mainfnt_call );
            }
            
            CallInst* Call_App_mainfunction = CallInst::Create(app_mainf , main_params, "", EntryBB);
            Call_App_mainfunction->setCallingConv(CallingConv::C);
            Call_App_mainfunction->setTailCall(false);
            StoreInst* stinst_rtn = new StoreInst(Call_App_mainfunction, return_stackholder  , false, EntryBB);
            stinst_rtn->setAlignment(TD->getABITypeAlignment (app_mainf->getReturnType	()));
            
            if (PreMainfunctionCallPoint == nullptr) { PreMainfunctionCallPoint =  Call_App_mainfunction ;}
            
        }
        
        // End of profiling
        LoadInst* ldinst_rtn = new LoadInst(return_stackholder   , "", false, EntryBB);
        PreReturnInstructionPoint = ldinst_rtn ;
        ldinst_rtn->setAlignment(TD->getABITypeAlignment (app_mainf->getReturnType	()));
        ReturnInst::Create(M->getContext(), ldinst_rtn, EntryBB);
        
        //debug << "\n" << new_mainf << go << go ;
        
    }
    
    Instruction * Pre_execution_processes(  )
    {
        
        // Set profile general info values
        llvm::Instruction  * LastPoint = PreMainfunctionCallPoint ;
        B_builder->SetInsertPoint( LastPoint);
        GlobalVariable *var;
        Function * functiontocall ;
        
        var = M->getGlobalVariable (pf_prefix + "profileAction");
        B_builder->CreateStore (((llvm::Constant *)ConstantInt::get( Int32Ty, profileAction)), var);
        
        var = M->getGlobalVariable (pf_prefix + "heapallocationCount");
        B_builder->CreateStore (((llvm::Constant *)ConstantInt::get( Int64Ty, malloclist.size())), var);
        
        var = M->getGlobalVariable (pf_prefix + "stackallocationCount");
        B_builder->CreateStore (((llvm::Constant *)ConstantInt::get( Int64Ty, stacklist.size())), var);
        
        var = M->getGlobalVariable (pf_prefix + "BBcount" );
        B_builder->CreateStore (((llvm::Constant *)ConstantInt::get( Int64Ty,  BBcount )), var);
        
        var = M->getGlobalVariable (pf_prefix + "IncludeStackProfiling");
        if(IncludeStackProfiling)
        {
            B_builder->CreateStore (((llvm::Constant *)ConstantInt::get( Int32Ty, 1 )), var);
        }else
        {
            B_builder->CreateStore (((llvm::Constant *)ConstantInt::get( Int32Ty, 0 )), var);
        }
        
        // call the 'StartProfiling_Processes' function
        functiontocall = M->getFunction( pf_prefix + "StartProfiling_Processes");
        LastPoint = PreMainfunctionCallPoint ;
        CallArguments arg;
        LastPoint =  CreateCallInst  ( M,functiontocall,arg, LastPoint,false );
        
        // insert code to increament BB Counter in each basic block
        for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
        {
            Function * F ;
            if (( F = M->getFunction(IFstr->first)) )
            {
                for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                {
                    BasicBlock * B = (BI) ;
                    
                    std::stringstream bbcname ;bbcname << "sdmprofile__BBcounter_" <<  GetIndex(B) ;
                    GlobalVariable * CounterSample  = M->getGlobalVariable ("sdmprofile__BBcounterSample__");
                    
                    GlobalVariable *GV = new GlobalVariable(*M,CounterSample->getType()->getElementType(),CounterSample->isConstant(), CounterSample->getLinkage(),(Constant*) nullptr, bbcname.str(),CounterSample,CounterSample->getThreadLocalMode(), CounterSample->getType()->getAddressSpace());
                    GV->copyAttributesFrom(CounterSample);
                    GV->setInitializer(CounterSample->getInitializer());
                    BBHitCount_variable_List[B]= GV;
                    
                    llvm::IRBuilder<>  IR_builder(B);
                    
                    // get the best place to insert code;
                    Instruction * insertpoint;
                    if (B == &B->getParent()->getEntryBlock() )
                    {
                        // find last of all initial store instructions
                        // initial store instructions will be storing argument into automatic stack variables
                        // and instruction must be placed after them
                        for (BasicBlock::iterator II = B->begin(), IE = B->end(); II != IE; ++II)
                        {
                            if (!(AllocaInst::classof(II) || (StoreInst::classof(II))))
                            {
                                insertpoint = II ;
                                break ;
                            }
                        }
                        IR_builder.SetInsertPoint(insertpoint);
                        
                        llvm::Constant  * cc = IR_builder.Insert(((llvm::Constant *)ConstantInt::get( Int64Ty, 1))  );
                        FntBBcounterMap[F->getName()] = IR_builder.CreateAtomicRMW(llvm::AtomicRMWInst::Add, GV, cc , llvm::AtomicOrdering::SequentiallyConsistent);
                        
                    }
                    else
                    {
                        insertpoint =  B->getFirstNonPHIOrDbg ();
                        while(llvm::AllocaInst::classof(insertpoint)){ insertpoint = insertpoint->getNextNode();}
                        IR_builder.SetInsertPoint(insertpoint);
                        
                        llvm::Constant  * cc = IR_builder.Insert(((llvm::Constant *)ConstantInt::get( Int64Ty, 1))  );
                        IR_builder.CreateAtomicRMW(llvm::AtomicRMWInst::Add, GV, cc , llvm::AtomicOrdering::SequentiallyConsistent);
                    }
                }
            }
        }
        
        
        if (profileAction == GV_ )
        {
            debug << "\tEmbed Global Variable metadata in app : " << app_GVlist.size() << go ;
            Function * function_1  = M->getFunction (pf_prefix + "Embed_metadata_GV");
            
            DebugInfoFinder Finder;
            Finder.processModule(*M);
            
            //TODO : review implimentation
            for (strMapI I = app_GVlist.begin() , Ie = app_GVlist.end() ; I != Ie ; ++I)
            {
                GlobalVariable * GV ;
                GV = getgv (M,I->first)   ;
                
                std::string  name_string (pf_prefix + "GV_Name_" + GV->getName().str());
                std::string  type_string (pf_prefix + "GV_Type_" + GV->getName().str());
                std::string  filename_string (pf_prefix + "GV_FileName_" + GV->getName().str());
                std::string  filename = "-" ;
                std::string  Dir_string (pf_prefix + "GV_FileDir_" + GV->getName().str());
                std::string  Dir  = "-" ;
                int lineNumber = 0;
                
                for (DIGlobalVariable DIGV : Finder.global_variables())
                {
                    llvm::DIGlobalVariable Loc(DIGV);
                    if (  Loc.getName().str() == GV->getName().str() )
                    {
                        filename = Loc.getFilename ();
                        Dir = Loc.getDirectory	() ;
                        lineNumber = Loc.getLineNumber() ;
                        break ;
                    }
                }
                
                U_64T gvindex =  GetIndex( GV ) ;
                
                //debug << "\tEmbed GV : " << gvindex << "\t" << GV->getName() << " , " << TD->getTypeAllocSize( GV->getType()) << " , "  << str(GV->getType()) << "\t" << go << "\t" << filename << " : " << lineNumber << go << "\tDir:" << Dir << go ;
                
                CallArguments args ;
                args.add (gvindex , CallArguments::INT64   );
                args.add (GV , CallArguments::PtrToVoidPtr );
                args.add (TD->getTypeAllocSize( GV->getType()) , CallArguments::INT32  );
                args.add (GV->getName(), name_string  );
                args.add (str(GV->getType()) , type_string ) ;
                args.add (filename , filename_string  );
                args.add (Dir , Dir_string  );
                args.add (lineNumber , CallArguments::INT64  );
                llvm::CallInst * fcall =  CreateCallInst(M,function_1 , args  ,PreMainfunctionCallPoint,false);
                LastPoint = fcall ;
                
            }
        

        }
        if (profileAction == STACK_ )
        {
            debug << "\tEmbed Stack Allocation metadata in app : " << stacklist.size() << go ;
            
            std::stringstream ios;
            Function * function_2  = M->getFunction (pf_prefix + "Embed_metadata_ST");
            for (instmap_I I = stacklist.begin() , Ie = stacklist.end() ; I != Ie ; ++I)
            {
                Instruction * inst = I->first ;
                llvm::AllocaInst * stackallocation = (llvm::AllocaInst *) inst      ;
                U_64T STindex =  GetIndex(  I->first   ) ;
                
                ios.clear() ; ios.str("");
                ios << STindex ;
                std::string  name_string (pf_prefix + "ST_Name_" + ios.str() );
                std::string  type_string (pf_prefix + "ST_Type_" + ios.str() );
                std::string  functionname_string (pf_prefix + "ST_Fname_" + ios.str() );
                
                //debug << "\tEmbed ST : " <<  STindex << "\t" << stackallocation << go ;
                
                CallArguments args ;
                args.add (STindex , CallArguments::INT64 );
                args.add (TD->getTypeAllocSize(stackallocation->getAllocatedType()),CallArguments::INT32 );
                args.add (stackallocation->getName() , name_string);
                args.add (str(stackallocation->getAllocatedType()), type_string);
                args.add (stackallocation->getParent()->getParent()->getName() , functionname_string );
                llvm::CallInst * fcall =  CreateCallInst(M, function_2 , args,PreMainfunctionCallPoint,false );
                LastPoint = fcall ;
                
            }
            
        }
        
        if (profileAction == HEAP_ )
        {
            debug << "\tEmbed Heap Allocation metadata in app : " << malloclist.size() << go ;
            
            std::stringstream ios;
            Function * function_3  = M->getFunction (pf_prefix + "Embed_metadata_HP");
            
            for (instmap_I I = malloclist.begin() , Ie = malloclist.end() ; I != Ie ; ++I)
            {
                Instruction * heapallocation = I->first ;
                U_64T HPindex =  GetIndex( I->first ) ;
                
                //debug << "\tEmbed HP : " << HPindex << " : " << heapallocation  << go ;
                
                ios.clear() ; ios.str("");
                ios << HPindex ;
                std::string  name_string (pf_prefix + "HP_Name_" + ios.str() );
                std::string  type_string (pf_prefix + "HP_Type_" + ios.str() );
                std::string  functionname_string (pf_prefix + "HP_Fname_" + ios.str() );
                std::string  sourcefile_string (pf_prefix + "HP_SourceFile_" + ios.str() );
                SourceMeta * meta = getSourceMeta(heapallocation);
                
                std::string ptrName ,ptrType;
                // find heap allocation pointer name and type
                {
                    llvm::Instruction * n1 , *n2 ;n2 = 0;
                    n1 =  heapallocation->getNextNode() ;
                    
                    if ( llvm::BitCastInst::classof(n1) )
                    {
                        llvm::BitCastInst * bitcastInst = (llvm::BitCastInst *)n1 ;
                        
                        ptrType =  str ( bitcastInst->getDestTy());
                        bool pointer_found = false ;
                        n2 =  n1->getNextNode() ;
                        
                        while (!pointer_found )
                        {
                            if (llvm::Instruction::classof(n2))
                            {
                                ptrName.append("--,--");
                                break ;
                            }
                            if(llvm::StoreInst::classof(n2) )
                            {
                                llvm::StoreInst * stinst = (llvm::StoreInst *) n2 ;
                                
                                if (stinst->getValueOperand() == n1)
                                {
                                    if (llvm::AllocaInst::classof (stinst ->getPointerOperand()))
                                    {
                                        debug << "\tok ST:: " << stinst ->getPointerOperand()->getName() << go ;
                                        ptrName.append("Stack,"); ptrName.append(stinst ->getPointerOperand()->getName()) ;
                                    }else if (llvm::GlobalVariable::classof(stinst ->getPointerOperand())  )
                                    {
                                        debug << "\tok GV:: " << stinst ->getPointerOperand()->getName() << go ;
                                        ptrName.append("Global,"); ptrName.append(stinst ->getPointerOperand()->getName()) ;
                                    }else
                                    {
                                        debug << "\tok :: " << stinst ->getPointerOperand()->getName() << go ;
                                        ptrName.append("--,"); ptrName.append(stinst ->getPointerOperand()->getName()) ;
                                    }
                                    pointer_found = true ;
                                }
                            }
                            n2 = n2->getNextNode();
                            
                        }
                    }else
                    {
                        ptrName.append("--,--");
                    }
                }
                
                CallArguments args ;
                args.add (HPindex , CallArguments::INT32 );
                args.add ( ptrName , name_string);
                args.add ( ptrType , type_string );
                args.add ( heapallocation->getParent()->getParent()->getName() , functionname_string );
                args.add ( meta->line , CallArguments::INT64  );
                args.add ( meta->sourcefile, sourcefile_string );
                llvm::CallInst * fcall =  CreateCallInst(M, function_3 , args ,PreMainfunctionCallPoint,false);
                LastPoint = fcall ;
            }
            
        }
        
        return LastPoint;
    }
    
    void ProcessBBmemaccesses()
    {
        osMessage tracestats ;
        TraceStats_TotalGV = TraceStats_TotalST = TraceStats_TotalHP = TraceStats_TotalUnknown = MemInst = 0 ;
        long bbprocessed = 0;
        
        for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
        {
            Function * F ;
            if (( F = M->getFunction(IFstr->first)) )
            {
                for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                {
                    BasicBlock * B = (BI) ;
                    long BBIndex = GetIndex(B);
        
                    std::map<Value *, int> *BBGVmap = new std::map<Value *, int>();
                    std::map<Value *, int> *BBGVmapR = new std::map<Value *, int>();
                    std::map<Value *, int> *BBGVmapW = new std::map<Value *, int>();
                    All_BBGVmap[B] = BBGVmap;
                    All_BBGVmapR[B] = BBGVmapR;
                    All_BBGVmapW[B] = BBGVmapW;
                    
                    std::map<Value *, int> *BBSTmap = new std::map<Value *, int>();
                    std::map<Value *, int> *BBSTmapR = new std::map<Value *, int>();
                    std::map<Value *, int> *BBSTmapW = new std::map<Value *, int>();
                    All_BBSTmap[B] = BBSTmap;
                    All_BBSTmapR[B] = BBSTmapR;
                    All_BBSTmapW[B] = BBSTmapW;
                    
                    std::map<Value *, int> *BBHPmap = new std::map<Value *, int>();
                    std::map<Value *, int> *BBHPmapR = new std::map<Value *, int>();
                    std::map<Value *, int> *BBHPmapW = new std::map<Value *, int>();
                    All_BBHPmap[B] = BBHPmap;
                    All_BBHPmapR[B] = BBHPmapR;
                    All_BBHPmapW[B] = BBHPmapW;
                    
                    
                    tracestats << "\nBB:" << GetIndex( B )    ;
                    std::vector<Memaccess *> * mlist = All_BBMemaccess[B] ;
                    std::vector<Memaccess *>::iterator It = mlist->begin();
                    std::vector<Memaccess *>::iterator Ite = mlist->end();
                    for (;It != Ite ; ++It)
                    {
                        MemInst++;
                        Memaccess *meminst = *It;
                        TraceMemAccess(M,meminst,2);
                        if (meminst->SourceType == Memaccess::GV)
                        {
                            TraceStats_TotalGV++;
                            tracestats << "\n\tGV  Inst: " << meminst <<  " Source: " << meminst->Source ;
                            if(BBGVmap->find(meminst->Source) == BBGVmap->end() )
                            {
                                (*BBGVmap)[meminst->Source] = 1;
                            }
                            else
                            {
                                (*BBGVmap)[meminst->Source] += 1;
                            }
                            
                            if (meminst->AccessType == Memaccess::Load )
                            {
                                if(BBGVmapR->find(meminst->  Source) == BBGVmapR->end() )
                                {
                                    (*BBGVmapR)[meminst->Source] = 1;
                                }
                                else
                                {
                                    (*BBGVmapR)[meminst->Source] += 1;
                                }
                            }
                            
                            if (meminst->AccessType == Memaccess::Store )
                            {
                                if(BBGVmapW->find(meminst->Source) == BBGVmapW->end() )
                                {
                                    (*BBGVmapW)[meminst->Source] = 1;
                                }
                                else
                                {
                                    (*BBGVmapW)[meminst->Source] += 1;
                                }
                            }
                            
                            
                        }
                        else if (meminst->SourceType == Memaccess::ST)
                        {
                            TraceStats_TotalST++;
                            tracestats << "\n\tST  Inst: " << meminst <<  " Source: " << meminst->Source;
                            if(BBSTmap->find(meminst->Source) == BBSTmap->end() )
                            {
                                (*BBSTmap)[meminst->Source] = 1;
                            }
                            else
                            {
                                (*BBSTmap)[meminst->Source] += 1;
                            }
                            
                            
                            if (meminst->AccessType == Memaccess::Load  )
                            {
                                if(BBSTmapR->find(meminst->Source) == BBSTmapR->end() )
                                {
                                    (*BBSTmapR)[meminst->Source] = 1;
                                }
                                else
                                {
                                    (*BBSTmapR)[meminst->Source] += 1;
                                }
                            }
                            
                            if (meminst->AccessType == Memaccess::Store )
                            {
                                if(BBSTmapW->find(meminst->Source) == BBSTmapW->end() )
                                {
                                    (*BBSTmapW)[meminst->Source] = 1;
                                }
                                else
                                {
                                    (*BBSTmapW)[meminst->Source] += 1;
                                }
                            }
                            
                        }
                        else if (meminst->SourceType == Memaccess::HP )
                        {
                            TraceStats_TotalHP++;
                            tracestats << "\n\tHP  Inst: " << meminst <<  " Source: " << meminst->Source ;
                        }
                        else if (meminst->SourceType == Memaccess::Unknown)
                        {
                            TraceStats_TotalUnknown ++;
                            tracestats << "\n\t--  Inst: " << meminst <<  " Source: --"  ;
                        }
                    }
                  
                }
            }
        }
        
        FILE *f;
        f = fopen("traceStat.txt", "w+");
        fprintf(f, "Totals GV:%lu\nST:%lu\nHP:%lu\nUnknown:%lu\nTotal Memory Access Inst:%lu\n\n%s",
                TraceStats_TotalGV , TraceStats_TotalST , TraceStats_TotalHP , TraceStats_TotalUnknown ,MemInst,tracestats.str().c_str());
        fclose(f);
        
    }

    void Post_execution_processes( )
    {
        osMessage debug; debug.show = false ;
        
        llvm::Instruction  * LastPoint ;
        Function * BBhitF  = M->getFunction(pf_prefix + "BBHit");
        Function * addhitGV  = M->getFunction(pf_prefix + "AddBBHitcount_GV");
        Function * addhitST  = M->getFunction(pf_prefix + "AddBBHitcount_ST");
        Function * PrintResult1  = M->getFunction(pf_prefix +  "PrintResultBeforeAddingBBcount");
        
        CallArguments args__ ;
        llvm::CallInst *  PrintResult1Call = CreateCallInst(M, PrintResult1, args__,PreReturnInstructionPoint,false);
        LastPoint = PrintResult1Call ;
        
        for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
        {
            Function * F ;
            if (( F = M->getFunction(IFstr->first)) )
            {
                for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                {
                    BasicBlock * B = (BI) ;
                    GlobalVariable *BBHitCount_variable = BBHitCount_variable_List[B];
               
                    //
                    CallArguments args1 ;
                    args1.add ( GetIndex(B) ,CallArguments::INT64);
                    args1.add ( BBHitCount_variable , CallArguments::LoadGV);
                    llvm::CallInst * BBhitFCall = CreateCallInst(M, BBhitF, args1,PreReturnInstructionPoint,false);
                    LastPoint = BBhitFCall ;
                    
                    if (profileAction == GV_  )
                    {
                        // update GV R/W count in this BB
                        std::map<Value *, int> *BBGVmap = All_BBGVmap[B] ;
                        std::map<Value *, int> *BBGVmapR = All_BBGVmapR[B] ;
                        std::map<Value *, int> *BBGVmapW = All_BBGVmapW[B] ;
                        for(std::map<llvm::Value * , int >::iterator It = BBGVmap->begin(),
                            Ite = BBGVmap->end ();It != Ite ;++It )
                        {
                            int reads = 0 ; int  writes = 0; int total = It->second ;
                            Value * GV = It->first ;
                            if (BBGVmapR->find(GV) != BBGVmapR->end())
                            {
                                reads = (*BBGVmapR)[GV] ;
                            }
                            if (BBGVmapW->find(GV) != BBGVmapW->end())
                            {
                                writes = (*BBGVmapW)[GV] ;
                            }
                            
                            U_64T  gvindex =  GetIndex(GV) ;
                            
                            CallArguments args1 ;
                            args1.add ( gvindex , CallArguments::INT64);
                            args1.add ( BBHitCount_variable , CallArguments::LoadGV );
                            args1.add ( reads , CallArguments::INT32);
                            args1.add ( writes , CallArguments::INT32  );
                            llvm::CallInst * AddHitCount_functioncall =  CreateCallInst(M,addhitGV , args1, PreReturnInstructionPoint,false );
                            LastPoint = AddHitCount_functioncall ;
                        }
                    }
                    else if (profileAction == STACK_  )
                    {
                        // update Stack R/W count in this BB
                        std::map<Value *, int> *BBSTmap = All_BBSTmap[B] ;
                        std::map<Value *, int> *BBSTmapR = All_BBSTmapR[B]  ;
                        std::map<Value *, int> *BBSTmapW = All_BBSTmapW[B]  ;
                        for(std::map<llvm::Value * , int >::iterator It = BBSTmap->begin(),
                            Ite = BBSTmap->end ();It != Ite ;++It )
                        {
                            int reads = 0 ; int  writes = 0; int total = It->second ;
                            Value * stack = It->first ;
                            if (BBSTmapR->find(stack) != BBSTmapR->end())
                            {
                                reads = (*BBSTmapR)[stack] ;
                            }
                            if (BBSTmapW->find(stack) != BBSTmapW->end())
                            {
                                writes = (*BBSTmapW)[stack] ;
                            }
                            
                            U_64T  stindex =  GetIndex(stack) ;
                            
                            CallArguments args1 ;
                            args1.add ( stindex ,CallArguments::INT64);
                            args1.add ( BBHitCount_variable , CallArguments::LoadGV );
                            args1.add ( reads, CallArguments::INT32);
                            args1.add ( writes , CallArguments::INT32 );
                            llvm::CallInst * AddHitCount_functioncall = CreateCallInst(M,addhitST, args1,PreReturnInstructionPoint,false);
                            LastPoint = AddHitCount_functioncall ;
                        }
                    }
                    else if (profileAction == HEAP_    )
                    {
                        
                    }
            
                }
            }
        }
 
        
        Function * fsave  = M->getFunction(pf_prefix + "EndProfiling_Processes");
        CallArguments arg ;
        CreateCallInst  ( M, fsave,arg ,PreReturnInstructionPoint,false );
        return ;
    }

    
    // add stack registration codes in each function, for local/stack profiling
    void Stack_registration_codes()
    {
        PointerType* PointerTy_1 ;
        GlobalVariable * mainthd   = M-> getGlobalVariable	("sdmprofile__MainthreadStack_allo");
        GlobalVariable * zeroptr   = M-> getGlobalVariable	("sdmprofile__zeropointer");
        PointerType * ty1 = (PointerType*) mainthd->getType()->getElementType() ;
        Type * ty2 = ty1->getElementType() ;
        PointerTy_1 = PointerType::get(ty2 , 0);
        
        PointerType* VoidPtrTy = PointerType::get(IntegerType::get(M->getContext(), 8), 0);
        
        for (ModifiedFunctionsI It = ModifiedFunctions.begin() ; It != ModifiedFunctions.end() ; ++It)
        {
            
            Function *F = M->getFunction(It->second->Name);
            ModifiedFunctionMeta * FMeta = ModifiedFunctions[F->getName()];
            Instruction * InsertAbove = FntBBcounterMap[F->getName()];
            InsertAbove = InsertAbove->getNextNode();
            
            BasicBlock * EntryBlock = FMeta->NewArg1_StackHolder->getParent();
            
            ConstantInt* const_int32_1 = ConstantInt::get(M->getContext(), APInt(32, StringRef("1"), 10));
            ConstantInt* const_int32_0 = ConstantInt::get(M->getContext(), APInt(32, StringRef("0"), 10));
            ConstantInt* const_int32_2 = ConstantInt::get(M->getContext(), APInt(32, StringRef("2"), 10));
            
            for (BasicBlock::iterator II = EntryBlock->begin(), IE = EntryBlock->end(); II != IE; ++II)
            {
                if (!AllocaInst::classof( II)) { continue ;}
                if (AddedInstruction.find(II) != AddedInstruction.end()) { continue; }
                
                instmap_I I = stacklist.find (II);
                U_64T STindex = GetIndex(I->first);
                
                AllocaInst * stackallocation = dyn_cast<AllocaInst >( II);
                
                CastInst* ptr_13 = new BitCastInst(stackallocation , VoidPtrTy, "", EntryBlock);
                ptr_13->moveBefore(InsertAbove);
                LoadInst* ptr_14 = new LoadInst(FMeta->NewArg2_StackHolder , "", false, EntryBlock);
                ptr_14->moveBefore(InsertAbove);
                ptr_14->setAlignment(8);
                std::vector<Value*> ptr_15_indices;
                ptr_15_indices.push_back(const_int32_0);
                ptr_15_indices.push_back(const_int32_0);
                Instruction* ptr_15 = GetElementPtrInst::Create(ptr_14, ptr_15_indices, "", EntryBlock);
                ptr_15->moveBefore(InsertAbove);
                StoreInst* void_16 = new StoreInst(ptr_13, ptr_15, false, EntryBlock);
                void_16->moveBefore(InsertAbove);
                void_16->setAlignment(8);
                
                LoadInst* ptr_17 = new LoadInst(FMeta->NewArg2_StackHolder , "", false, EntryBlock);
                ptr_17->moveBefore(InsertAbove);
                ptr_17->setAlignment(8);
                std::vector<Value*> ptr_18_indices;
                ptr_18_indices.push_back(const_int32_0);
                ptr_18_indices.push_back(const_int32_1);
                Instruction* ptr_18 = GetElementPtrInst::Create(ptr_17, ptr_18_indices, "", EntryBlock);
                ptr_18->moveBefore(InsertAbove);
                Constant * const_num = ConstantInt::get(  Int64Ty  ,STindex );
                StoreInst* void_19 = new StoreInst(const_num  , ptr_18, false, EntryBlock);
                void_19->moveBefore(InsertAbove);
                void_19->setAlignment(8);
                
                LoadInst* ptr_30 = new LoadInst(FMeta->NewArg2_StackHolder , "", false, EntryBlock);
                ptr_30->moveBefore(InsertAbove);
                ptr_30->setAlignment(8);
                std::vector<Value*> ptr_30_indices;
                ptr_30_indices.push_back(const_int32_0);
                ptr_30_indices.push_back(const_int32_2);
                Instruction* ptr_31 = GetElementPtrInst::Create(ptr_30, ptr_30_indices, "", EntryBlock);
                ptr_31->moveBefore(InsertAbove);
                LoadInst* ptr_33 = new LoadInst( zeroptr , "", false, EntryBlock);
                ptr_33->moveBefore(InsertAbove);
                ptr_33->setAlignment(8);
                StoreInst* void_32  = new StoreInst(ptr_33  , ptr_31 , false, EntryBlock);
                void_32->moveBefore(InsertAbove);
                void_32->setAlignment(8);
                
                LoadInst* ptr_20 = new LoadInst(FMeta->NewArg2_StackHolder, "", false, EntryBlock);
                ptr_20->moveBefore(InsertAbove);
                ptr_20->setAlignment(8);
                GetElementPtrInst* ptr_21 = GetElementPtrInst::Create(ptr_20, const_int32_1, "", EntryBlock);
                ptr_21->moveBefore(InsertAbove);
                StoreInst* void_22 = new StoreInst(ptr_21, FMeta->NewArg2_StackHolder, false, EntryBlock);
                void_22->moveBefore(InsertAbove);
                void_22->setAlignment(8);
                
            }
            //debug << EntryBlock << go;
        }
    }
    
    void ReplaceMallocAndFree (  )
    {
        //replace all malloc and free function call instruction with profile malloc/free function
        Function * pf_malloc = M->getFunction(pf_prefix + "malloc" );
        Function * pf_free = M->getFunction(pf_prefix + "free" );
        
        for (instmap_I I = malloclist.begin() ; I != malloclist.end();++I)
        {
            U_64T HPindex = GetIndex( I->first ) ;
            
            llvm::CallInst * old_mallocCall   = llvm::dyn_cast<llvm::CallInst >(I->first)  ;
            CallArguments  args;
            args.add ( old_mallocCall->getArgOperand(0));
            args.add( HPindex ,CallArguments::INT32   );
            
            ModifiedFunctionMeta * FMeta = ModifiedFunctions[old_mallocCall->getParent()->getParent()->getName()];
            args.add(FMeta->NewArg1_StackHolder , CallArguments::LoadST );
            
            llvm::CallInst * new_mallocCall = CreateCallInst(M,pf_malloc,args ,old_mallocCall,true  ) ;
            old_mallocCall->replaceAllUsesWith(new_mallocCall);
        }
        
        
        for (instmap_I I = freelist.begin() ; I != freelist.end();++I)
        {
            llvm::CallInst * old_freecall = llvm::dyn_cast<llvm::CallInst >(I->first)  ;
            
            CallArguments  args;
            args.add ( old_freecall->getArgOperand(0));
            
            ModifiedFunctionMeta * FMeta = ModifiedFunctions[old_freecall->getParent()->getParent()->getName()];
            args.add(FMeta->NewArg1_StackHolder , CallArguments::LoadST );
            
            llvm::CallInst * new_freeCall = CreateCallInst(M,pf_free,args ,old_freecall,true  ) ;
            old_freecall->replaceAllUsesWith(new_freeCall);
            old_freecall->eraseFromParent();
        }
        
    }
    
    
    int Profile_unknown_memaccess()
    {
        //Function * logfDummy1 = M->getFunction(pf_prefix +  "SearchRoutine_Dummy1") ;
        //Function * logfDummy2 = M->getFunction(pf_prefix +  "SearchRoutine_Dummy2") ;
        //Function * logfDummy3 = M->getFunction(pf_prefix +  "SearchRoutine_Dummy3") ;
        Function * logfGV = M->getFunction(pf_prefix +  "SearchRoutine_GVonly");
        Function * logfHP = M->getFunction(pf_prefix +  "SearchRoutine_HPonly" );
        Function * logfST = M->getFunction(pf_prefix +  "SearchRoutine_STonly");
        Function * logfAll = M->getFunction(pf_prefix +  "SearchRoutine_All");
        
        for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
        {
            Function * F;
            if (( F = M->getFunction(IFstr->first)))
            {
                for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                {
                    std::vector<Memaccess *> * list = All_BBMemaccess[BI] ;
                    BasicBlock * B = BI ;
                    
                    std::vector<Memaccess *>::iterator It = list->begin();
                    std::vector<Memaccess *>::iterator Ite = list->end ();
                    for (;It != Ite ; ++It)
                    {
                        MemInst++;
                        Memaccess *meminst = *It ;
                        if (meminst->SourceType  == Memaccess::Unknown)
                        {
                            //debug << "\t" << meminst->Inst << " F:" << meminst->Inst->getParent() << go ;
                            {
                                CallArguments args ;
                                args.add( meminst->getPointerOperand(),CallArguments::PtrToVoidPtr);
                                args.add( meminst->AccessType ,CallArguments::INT8 ) ;
                                
                                if (IncludeThreadProfiling  )
                                {
                                    ModifiedFunctionMeta * FMeta = ModifiedFunctions[meminst->Inst->getParent()->getParent()->getName()];
                                    args.add (FMeta->NewArg1_StackHolder , CallArguments::LoadST);
                                }
                                if (IncludeStackProfiling)
                                {
                                    ModifiedFunctionMeta * FMeta = ModifiedFunctions[meminst->Inst->getParent()->getParent()->getName()];
                                    args.add (FMeta->NewArg2_StackHolder , CallArguments::LoadST);
                                }
                                
                                if (profileAction == GV_  )
                                {
                                    CreateCallInst(M,logfGV, args, meminst->Inst  , false ) ;
                                }
                                else if (profileAction == HEAP_    )
                                {
                                    CreateCallInst(M,logfHP, args, meminst->Inst  , false ) ;
                                }
                                else if (profileAction == STACK_ )
                                {
                                    CreateCallInst(M,logfST, args, meminst->Inst  , false ) ;
                                }
                                else if (profileAction == ALL_ )
                                {
                                    CreateCallInst(M,logfAll, args, meminst->Inst  , false ) ;
                                }
                                
                            }
                        }
                    }
                }
            }
        }
        return 0;
    }
    

}


static llvm::cl::opt<std::string> OutputFilename("o", llvm::cl::desc("output filename"), llvm::cl::value_desc("filename"));
static llvm::cl::opt<std::string> InputFilename ("i", llvm::cl::desc("input filename"), llvm::cl::value_desc("filename"));
static llvm::cl::opt<int> job ("a", llvm::cl::desc("action \n 1  Heap variable profiling only (heap variables allocated with malloc) \n 2  Stack variable profiling only \n 3  Global variable only \n 4  All variable (Heap,Stack,Global) \n 6 generate .csv file profile results "), llvm::cl::value_desc("number"));
static llvm::cl::opt<bool> Convert_object_file("obj", llvm::cl::desc("convert output bitcode to object file"));
static cl::extrahelp MoreHelp( help___  );

int main (int argc, char ** argv)
{
    int action;
    std::string outf ;
    std::string inf ;
    bool obj ;
    
    cl::ParseCommandLineOptions(argc, argv, "");
    profiletool::profileAction = job;
    inf =  InputFilename ;
    outf =  OutputFilename ;
    obj = Convert_object_file ;
    
    profiletool::Profile_application(inf, outf, action, obj);
    return 1;
    
}

