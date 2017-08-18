//===                             util.cpp                                  ==//
//
//                     Application Memory Profiling Tool
//
//              Developed by System Design Methodology Laboratory
//                   Hanyang University, Seoul, South Korea
//
//===----------------------------------------------------------------------===//

#include "utils.h"

using namespace llvm ;

namespace profiletool
{
    DataLayout  * TD ;

    strMap pf_fntlist, app_fntlist,app_GVlist ;
    
    std::string pf_prefix ;
    
    std::map<Instruction *,int> AddedInstruction ;
    
    std::map<std::string ,   ModifiedFunctionMeta * > ModifiedFunctions ;
    
    std::map <void * , U_64T >Index ;
    
}


namespace profiletool {
    
    std::unique_ptr<llvm::Module> Mod ;
    
    Module * LoadIRFile (std::string InputFilename ,std::string pf_function)
    {
         // get App file info
        {
            std::string ErrorMessage;
            std::unique_ptr<llvm::Module> ModApp ;
            llvm::Module::iterator FI ,FE;
            DataStreamer *pf_streamer = llvm::getDataFileStreamer( InputFilename , &ErrorMessage);
            if (pf_streamer)
            {
                
                std::string DisplayFilename;
                ModApp.reset(getStreamedBitcodeModule(DisplayFilename, pf_streamer, llvm::getGlobalContext(), &ErrorMessage));
                if(ModApp.get())
                {
                    if (std::error_code EC = ModApp.get()->materializeAllPermanently())
                    {
                        ErrorMessage = EC.message();
                        ModApp.reset();
                    }
                }
            }
            if (!ModApp.get())
            {
                
                if (ErrorMessage.size())
                {
                    debug  << ErrorMessage << "\n";
                }
                else
                {
                    //debug  << "App didn't read correctly.\n" << go;
                }
                return 0;
            }
            
            // get list of GV
            for (llvm::Module::global_iterator  I = ModApp.get()->global_begin(), E = ModApp.get()->global_end();I != E; ++I)
            {
                if (I->getName().find("llvm.") != std::string::npos) // llvm core variable
                { continue ; }
                
                if (I->getName().find("__stderrp") != std::string::npos) // std error related
                {  continue ; }
                
                app_GVlist [I->getName().str()] = 1;
            }
            
            // get list of functions in app
            for (FI = ModApp.get()->begin(), FE = ModApp.get()->end(); FI != FE; ++FI)
            {
                if (FI->getName().find("llvm.") != std::string::npos)
                {continue ;}
                
                app_fntlist [FI->getName()] = 1;
            }
            
            
        }
        
        // Link application with profile functions
        message  << "\tLink application with profile functions : " << pf_function << go ;
        std::string temp_app = tmpfile(".bc") ;
        debug << "\tTemporary Application file " << temp_app << go ;
        std::stringstream linkcommand ;
        linkcommand << LLVM_LINKER << " " << pf_function << " " << InputFilename << " -o " << temp_app;
        std::system(linkcommand.str().c_str());
        
        Module * M;
        std::string ErrorMessage;
        DataStreamer *streamer = llvm::getDataFileStreamer(temp_app, &ErrorMessage);
        
        if (streamer)
        {
            std::string DisplayFilename;
            Mod.reset(getStreamedBitcodeModule(DisplayFilename, streamer, llvm::getGlobalContext(), &ErrorMessage));
            
            if(Mod.get())
            {
                if (std::error_code EC = Mod.get()->materializeAllPermanently())
                {
                    ErrorMessage = EC.message();
                    Mod.reset();
                }
            }
        }
        if (!Mod.get())
        {
            if (ErrorMessage.size())
            {
                debug  << ErrorMessage << "\n";
            }
            else
            {
                debug  << "bitcode didn't read correctly.\n";
            }
            return 0;
        }
        
        M =  Mod.get();
        TD = new llvm::DataLayout( M );
     
    
        //debug << "\tApp Target Triple : " << M->getTargetTriple () <<  go ;
        //debug << "\tApp Data Layout : "  <<  TD->getStringRepresentation () << go ;
        
        return M ;
    }
    
    GlobalVariable * getgv (Module * M,std::string Name)
    {
        for (llvm::Module::global_iterator  I = M->global_begin(), E = M->global_end();I != E; ++I)
        {
            if ( I->getName().str() == Name ){return  I ; }
        }
        return 0;
    }
    
    int Save_Module_to_File(Module *M,std::string InputFilename,std::string OutputFilename,bool Convert_object_file = false)
    {
        std::string O_bc  ;std::string O_o;
        if ( OutputFilename == "")
        {
            O_bc = InputFilename + std::string ("_pf.bc");
            O_o  = InputFilename + std::string ("_pf.o");
        }
        else
        {
            O_bc = OutputFilename  ;
            O_o  = OutputFilename ;
            if (Convert_object_file)
            {
                O_bc =  "temp.bc" ;
            }

        }
        
        std::string ErrorInfo;
            
        tool_output_file Out( O_bc.c_str(), ErrorInfo, sys::fs::F_None);
        if (!ErrorInfo.empty())
        {
            errs() << ErrorInfo << '\n';
        }
        
        WriteBitcodeToFile(M, Out.os());
        Out.keep();
        
        if (Convert_object_file)
        {
            std::stringstream call;
            call << LLVM_LLC << " -filetype=obj -o " <<  O_o << " " << O_bc ;
            message << ">>" << call.str() << go ;
            std::system(call.str().c_str());
            
            message  <<  "Output Object File = " <<  O_o   << go ;
        }else
        {
            message  <<  "Output Bitcode File = " <<  O_bc  << go ;
        }
        
        return 1;
        
    }

    CallInst * CreateCallInst(Module *M, Function * functiontocall, CallArguments &arg,llvm::Instruction * insertP,bool insertafter  )
    {
        llvm::CallInst * fcall ;
        SmallVector<Value*, 20> arguments  ;
        llvm::IRBuilder<> B_builder(insertP->getParent());
        B_builder.SetInsertPoint(insertP );
        
        if( arg.count == 0)
        {
            fcall = B_builder.CreateCall(functiontocall );
        }
        else
        {
            for (int ix = 0; ix < arg.count ;ix++)
            {
                switch (arg.Type[ix])
                {
                    case CallArguments::INT8:
                    {
                        llvm::Value * v = B_builder.Insert(  ((llvm::Constant *)  ConstantInt::get( Int8Ty, arg.Number[ix])));
                        if(insertafter)
                        {
                            if (llvm::Instruction *instv = llvm::dyn_cast<llvm::Instruction >( v))
                            {
                                insertP->moveBefore( instv );
                                insertP = instv ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break ;
                    case CallArguments::INT16:
                    {
                        llvm::Value * v = B_builder.Insert(  ((llvm::Constant *)  ConstantInt::get( Int16Ty, arg.Number[ix])));
                        if(insertafter)
                        {
                            if (llvm::Instruction *instv = llvm::dyn_cast<llvm::Instruction >( v))
                            {
                                insertP->moveBefore( instv );
                                insertP = instv ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break ;
                        
                    case CallArguments::INT32 :
                    {
                        llvm::Value * v = B_builder.Insert(  ((llvm::Constant *)ConstantInt::get( Int32Ty,arg.Number[ix])));
                        if(insertafter)
                        {
                            if (llvm::Instruction *instv = llvm::dyn_cast<llvm::Instruction >( v))
                            {
                                insertP->moveBefore( instv );
                                insertP= instv ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break;
                    
                    case CallArguments::INT64 :
                    {
                        llvm::Value * v = B_builder.Insert(  ((llvm::Constant *)  ConstantInt::get(Int64Ty, arg.Number[ix])));
                        if(insertafter)
                        {
                            if (llvm::Instruction *instv = llvm::dyn_cast<llvm::Instruction >( v))
                            {
                                insertP->moveBefore( instv );
                                insertP = instv  ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break;
                    
                    case CallArguments::VALUE :
                    {
                        arguments.push_back(arg.Data[ix] );
                    }
                        break;
                    case CallArguments::PtrToInt :
                    {
                        llvm::Value * v = B_builder.CreatePtrToInt(arg.Data[ix], Int64Ty );
                        if(insertafter)
                        {
                            if (llvm::Instruction * instv = llvm::dyn_cast<llvm::Instruction >(v))
                            {
                                insertP->moveBefore( instv );
                                insertP = instv ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break ;
                        
                    case CallArguments::PtrToVoidPtr:
                    {
                        PointerType* voidptr = Type::getInt8PtrTy(M->getContext()) ;
                        llvm::Value * v = B_builder.CreateBitCast (arg.Data[ix],voidptr  );
                        
                        if(insertafter)
                        {
                            if (llvm::Instruction * instv = llvm::dyn_cast<llvm::Instruction >(v))
                            {
                                insertP->moveBefore( instv );
                                insertP = instv ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break ;
                    case CallArguments::LoadGV:
                    {
                        LoadInst * v = B_builder.CreateLoad ( arg.Data[ix]);
                        
                        if(insertafter)
                        {
                            if (llvm::Instruction * instv = llvm::dyn_cast<llvm::Instruction >(v))
                            {
                                insertP->moveBefore( instv );
                                insertP = instv ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break;
                    case CallArguments::LoadST:
                    {
                        LoadInst * v = B_builder.CreateLoad( arg.Data[ix]);
                        
                        if(insertafter)
                        {
                            if (llvm::Instruction * instv = llvm::dyn_cast<llvm::Instruction >(v))
                            {
                                insertP->moveBefore( instv );
                                insertP = instv ;
                                B_builder.SetInsertPoint(insertP );
                            }
                        }
                        arguments.push_back(v);
                    }
                        break;
                    case CallArguments::STR :
                    {
                        Value * v =  B_builder.CreateGlobalStringPtr (arg.SL[ix],arg.SLname[ix]);
                        arguments.push_back(v);
                    }
                        break ;
                        
                }
            }
            
            llvm::ArrayRef<llvm::Value *>  argsRef(arguments );
            fcall = B_builder.CreateCall(  functiontocall    , argsRef  );
        }
        
        
        if(insertafter){ insertP ->moveBefore( fcall );}

        
        return fcall ;
    }
    
    void Collect_AllocaInst(Module * M, instmap_t * list)
    {
        list->clear();
        
        for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
        {
            Function * F;
            if (( F = M->getFunction(IFstr->first)))
            {
                for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                {
                    for (BasicBlock::iterator II = BI->begin(), IE = BI->end(); II != IE; ++II)
                    {
                        if (llvm::AllocaInst *inst = llvm::dyn_cast<llvm::AllocaInst >( II))
                        {
                            std::map<Instruction *,int>::iterator it = AddedInstruction.find(inst) ;
                            if (it == AddedInstruction.end())
                            {
                                (*list)[inst] = 0 ;
                            }
                            else
                            {
                                //debug << "Skip ::" << inst << go ;
                            }
                        
                        }
                    }
                }
            }
        }
        
    }
    
    void Collect_FcallInst(Module * M, Function *CalledFnt, instmap_t * list)
    {
        list->clear();
        for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
        {
            Function * F;
            if (( F = M->getFunction(IFstr->first)))
            {
                for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                {
                    for (BasicBlock::iterator II = BI->begin(), IE = BI->end(); II != IE; ++II)
                    {
                        if (llvm::CallInst *fcall = llvm::dyn_cast<llvm::CallInst >( II))
                        {
                            if (CalledFnt == fcall->getCalledFunction	() )
                            {
                                (*list)[fcall] = 0 ;
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    void Collect_MemaccessInst(Module * M, std::map <BasicBlock * , std::vector<Memaccess *> *> *All_BBMemaccess_)
    {
        All_BBMemaccess_->clear();
        for (strMapI IFstr  = app_fntlist.begin() ; IFstr != app_fntlist.end() ; ++IFstr )
        {
            Function * F;
            if (( F = M->getFunction(IFstr->first)))
            {
                for (Function::iterator BI = F->begin(), BE = F->end();BI != BE; ++BI)
                {
                    std::vector<Memaccess *> * list = new std::vector<Memaccess *>() ;
                    (*All_BBMemaccess_)[BI] = list ;
                   
                    for (BasicBlock::iterator II = BI->begin(), IE = BI->end(); II != IE; ++II)
                    {
                        if (LoadInst *ld = dyn_cast<LoadInst >( II))
                        {
                            std::map<Instruction *,int>::iterator it = AddedInstruction.find(ld ) ;
                            if (it == AddedInstruction.end())
                            {
                                Memaccess *m = new Memaccess(II,Memaccess::Load);
                                list->push_back(m);
                            }
                            else
                            {
                                //debug << "Skip ::" << ld << go ;
                            }
                            
                            
                        }
                        else if (StoreInst *st = dyn_cast<StoreInst >( II))
                        {
                            std::map<Instruction *,int>::iterator it = AddedInstruction.find(st) ;
                            if (it == AddedInstruction.end())
                            {
                                Memaccess *m = new Memaccess(II,Memaccess::Store);
                                list->push_back(m);
                            }
                            else
                            {
                                //debug << "Skip ::" << st << go ;
                            }

                            
                        }
                    }
                }
            }
        }
         
    }
    
    int verify_count = 0;
    bool OldFilesCleared = false;
    bool VerifyModule (Module * M )
    {
        if (!OldFilesCleared)
        {
            std::system("rm App_verify_log*");
            std::system("rm App_IR*");
            OldFilesCleared = true ;
        }
        std::string ErrorInfo;
        raw_fd_ostream * os ;
        std::stringstream str ; str << "App_verify_log" << verify_count << ".sh" ;
        
        
        os  = new raw_fd_ostream(str.str().c_str(), ErrorInfo, sys::fs::F_Text);
        verifyModule(*M, os  );
        os->flush();
        os->close();
        
        str.clear(); str.str("");
        str << "App_IR" << verify_count << ".ll.sh" ;
        os = new raw_fd_ostream(str.str().c_str(), ErrorInfo, sys::fs::F_Text);
        
        M->print (*os,0) ;
        
        os->flush();
        os->close();
        verify_count++;
        
        return true ;
    }
    
    SourceMeta * getSourceMeta(Instruction * inst)
    {
        SourceMeta * meta = new SourceMeta();
        
        if (MDNode *N = inst->getMetadata("dbg"))
        {
            llvm::DILocation Loc(N);
            meta->line = Loc.getLineNumber() ;
            meta->column = Loc.getColumnNumber() ;
            meta->sourcefile = Loc.getFilename () ;
            meta->directory = Loc.getDirectory	() ;
            return meta ;
        }
        else
        {
            return meta;
        }
        
    }
    
    
}


namespace profiletool  // Mem access Trace routines
{
    osMessage DebugT ;

    GlobalVariable * Traceglobal(Memaccess * II )
    {
        Value  * v =   II->getPointerOperandAllocation() ;
        if ( GlobalVariable *GV = dyn_cast<GlobalVariable>(v))
        {
            return   GV ;
        }
        return  NULL ;
    }
    AllocaInst  * Tracestack(Memaccess * II)
    {
        Value * v =   II->getPointerOperandAllocation() ;
        if (AllocaInst * ai = dyn_cast<AllocaInst >(v) )
        {
            return   ai ;
        }
        return  NULL ;
    }
 
    
    void TraceMemAccess(Module * M, Memaccess * I, int tracedepth  )
    {
        llvm::Value * Source ;
        if ((Source = Tracestack(I)))
        {
            I->SourceType =  Memaccess::ST ;
            I->Source = Source ;
            return ;
        }
        else if ((Source = Traceglobal(I)))
        {
            I->SourceType = Memaccess::GV ;
            I->Source = Source ;
            return ;
        }
        else
        {
            I->SourceType = Memaccess::Unknown ;
        }
    }
}

namespace  profiletool
{
    std::string FtnSig  (Function * F)
    {
        std::string OSSs,rtn,tok;
        int pickfirstNlines = 2 ;
        int ix =0;
        llvm::raw_string_ostream OSS( OSSs);
        F->print( OSS ) ;
        std::stringstream ss(  OSS.str());

        while(std::getline(ss, tok))
        {
            rtn.append(tok );rtn .append("\n") ;
            if (ix >= pickfirstNlines){ break   ;}
            ix++;
        }
        return rtn ;
    }
    
    long inst_added_count =0;
    std::stringstream oss;
    extern std::string NameInst(const char * prefix)
    {
        
        oss.str("") ;
        oss << profiletool::pf_prefix << prefix << (++inst_added_count) ;
        return std::string(oss.str().c_str());
        
    }
    std::string tmpfile(std::string ext)
    {
        char buffer[64] ;
        memset(buffer,0,sizeof(buffer));
        
    #if defined MACOSBUILD
        strncpy(buffer,"/var/tmp/myIRTmpFile-XXXXXX",64);
    #else
        strncpy(buffer,"/tmp/myIRTmpFile-XXXXXX",64);
    #endif
        
        mkstemp(buffer);
        unlink(buffer);
        
        return (std::string(buffer) + ext );
    }
    
    void copyFunctionBody(Function &New, const Function &Orig, ValueToValueMapTy &VMap)
    {
        if (!Orig.isDeclaration()) {
            Function::arg_iterator DestI = New.arg_begin();
            for (Function::const_arg_iterator J = Orig.arg_begin(); J != Orig.arg_end();
                 ++J) {
                DestI->setName(J->getName());
                VMap[J] = DestI++;
            }
            
            SmallVector<ReturnInst *, 8> Returns;
            CloneFunctionInto(&New, &Orig, VMap, true, Returns);
        }
    }
    
    std::string OSSs;
    llvm::raw_string_ostream OSS( OSSs);
    #define print__(v) {OSSs.clear() ; v->print( OSS) ; return OSS.str() ;} ;
    std::string str(Value * t){  print__(t); }
    std::string str(Type * t){  print__(t); }
    std::string str(Memaccess * v  ){  print__(v->Inst ); }
    
 }


osFlush go;
osMessage message;
osMessage debug ;
osMessage::osMessage() {show = true ; outputtype=1;}
osMessage::osMessage(std::string logfile)
{
    outputtype=2; logF = logfile; show = true ;
    std::ofstream myfile (logF,  std::ios::trunc  );
    myfile << "" << "\n";
    myfile.close();
}

std::ostream& operator <<(std::ostream &os,  const    osFlush &go_ )
{
    osMessage& mos = static_cast<osMessage& >(os  );
    if (!mos.show) {mos.str("") ; return os;}
    
    switch (mos.outputtype)
    {
            case 1:
        {
            printf( "%s\n" ,   mos.str().c_str() ) ;
        }
            break;
            case 2:
        {
            std::ofstream myfile (mos.logF, std::ios::out | std::ios::app | std::ios::ate );
            myfile << mos.str() << "\n";
            myfile.close();
        }
            break;
        default:
            break;
    }
    mos.str("") ;
    return os ;
};

inline std::ostream& prt (std::ostream &os,llvm::Value * data)
{
    osMessage& mos = static_cast<osMessage& >(os  );
    std::string OSSs;
    llvm::raw_string_ostream OSS( OSSs);
    data->print( OSS) ;
    mos << OSS.str()  ;
    return os ;
}
inline std::ostream& prt (std::ostream &os,const llvm::Type * data)
{
    osMessage& mos = static_cast<osMessage& >(os  );
    std::string OSSs;
    llvm::raw_string_ostream OSS( OSSs);
    data->print( OSS) ;
    mos << OSS.str()  ;
    return os ;
}

std::ostream& operator <<(std::ostream &os, const   llvm::StringRef  &StringRef)
{
    osMessage& mos = static_cast<osMessage& >(os  );
    mos <<  StringRef.str() ;
    return os ;
}

std::ostream& operator <<(std::ostream &os,  const Value &data   )
{return prt(os,(Value *)&data);}

std::ostream& operator <<(std::ostream &os, const Value *data)
{return prt(os,(Value*)data);}

std::ostream& operator <<(std::ostream &os,const Instruction *data )
{return prt(os,(Value*)data);}

std::ostream& operator <<(std::ostream &os,const Module *data )
{return prt(os,(Value*)data);}

std::ostream& operator <<(std::ostream &os,const GlobalVariable *data )
{return prt(os,(Value*)data);}

std::ostream& operator <<(std::ostream &os, const Type *data)
{return prt(os,data);}

std::ostream& operator <<(std::ostream &os, const profiletool::Memaccess *data)
{return prt(os,(Value*)data->Inst);}

std::ostream& operator <<(std::ostream &os, const profiletool::SourceMeta *data )
{
    osMessage& mos = static_cast<osMessage& >(os  );
   
    mos << "\n\t Line: " << data->line  ;
    mos << "\n\t column: " << data->column  ;
    mos << "\n\t function: " << data->function  ;
    mos << "\n\t sourcefile: " << data->sourcefile  ;
    mos << "\n\t directory: " << data->directory  ;
    mos << "\n" ;
    
    return os ;
}


std::ostream& operator <<(std::ostream &os, const FunctionType *data)
{return prt(os,(Value*)data);}


namespace  llvm  
{
// CloneBasicBlock - See comments in Cloning.h
BasicBlock *CloneBasicBlock(const BasicBlock *BB,
                                  ValueToValueMapTy &VMap,
                                  const Twine &NameSuffix, Function *F,
                                  ClonedCodeInfo *CodeInfo) {
    BasicBlock *NewBB = BasicBlock::Create(BB->getContext(), "", F);
    if (BB->hasName()) NewBB->setName(BB->getName()+NameSuffix);
    
    bool hasCalls = false, hasDynamicAllocas = false, hasStaticAllocas = false;
    
    // Loop over all instructions, and copy them over.
    for (BasicBlock::const_iterator II = BB->begin(), IE = BB->end();
         II != IE; ++II) {
        Instruction *NewInst = II->clone();
        if (II->hasName())
            NewInst->setName(II->getName()+NameSuffix);
        NewBB->getInstList().push_back(NewInst);
        VMap[II] = NewInst;                // Add instruction map to value.
        
        hasCalls |= (isa<CallInst>(II) && !isa<DbgInfoIntrinsic>(II));
        if (const AllocaInst *AI = dyn_cast<AllocaInst>(II)) {
            if (isa<ConstantInt>(AI->getArraySize()))
                hasStaticAllocas = true;
            else
                hasDynamicAllocas = true;
        }
    }
    
    if (CodeInfo) {
        CodeInfo->ContainsCalls          |= hasCalls;
        CodeInfo->ContainsDynamicAllocas |= hasDynamicAllocas;
        CodeInfo->ContainsDynamicAllocas |= hasStaticAllocas &&
        BB != &BB->getParent()->getEntryBlock();
    }
    return NewBB;
}

// Clone OldFunc into NewFunc, transforming the old arguments into references to
// VMap values.
//
void CloneFunctionInto(Function *NewFunc, const Function *OldFunc,
                             ValueToValueMapTy &VMap,
                             bool ModuleLevelChanges,
                             SmallVectorImpl<ReturnInst*> &Returns,
                             const char *NameSuffix, ClonedCodeInfo *CodeInfo,
                             ValueMapTypeRemapper *TypeMapper,
                             ValueMaterializer *Materializer) {
    assert(NameSuffix && "NameSuffix cannot be null!");
    
#ifndef NDEBUG
    for (Function::const_arg_iterator I = OldFunc->arg_begin(),
         E = OldFunc->arg_end(); I != E; ++I)
        assert(VMap.count(I) && "No mapping from source argument specified!");
#endif
    
    // Copy all attributes other than those stored in the AttributeSet.  We need
    // to remap the parameter indices of the AttributeSet.
    AttributeSet NewAttrs = NewFunc->getAttributes();
    NewFunc->copyAttributesFrom(OldFunc);
    NewFunc->setAttributes(NewAttrs);
    
    AttributeSet OldAttrs = OldFunc->getAttributes();
    // Clone any argument attributes that are present in the VMap.
    for (const Argument &OldArg : OldFunc->args())
        if (Argument *NewArg = dyn_cast<Argument>(VMap[&OldArg])) {
            AttributeSet attrs =
            OldAttrs.getParamAttributes(OldArg.getArgNo() + 1);
            if (attrs.getNumSlots() > 0)
                NewArg->addAttr(attrs);
        }
    
    NewFunc->setAttributes(
                           NewFunc->getAttributes()
                           .addAttributes(NewFunc->getContext(), AttributeSet::ReturnIndex,
                                          OldAttrs.getRetAttributes())
                           .addAttributes(NewFunc->getContext(), AttributeSet::FunctionIndex,
                                          OldAttrs.getFnAttributes()));
    
    // Loop over all of the basic blocks in the function, cloning them as
    // appropriate.  Note that we save BE this way in order to handle cloning of
    // recursive functions into themselves.
    //
    for (Function::const_iterator BI = OldFunc->begin(), BE = OldFunc->end();
         BI != BE; ++BI) {
        const BasicBlock &BB = *BI;
        
        // Create a new basic block and copy instructions into it!
        BasicBlock *CBB = CloneBasicBlock(&BB, VMap, NameSuffix, NewFunc, CodeInfo);
        
        // Add basic block mapping.
        VMap[&BB] = CBB;
        
        // It is only legal to clone a function if a block address within that
        // function is never referenced outside of the function.  Given that, we
        // want to map block addresses from the old function to block addresses in
        // the clone. (This is different from the generic ValueMapper
        // implementation, which generates an invalid blockaddress when
        // cloning a function.)
        if (BB.hasAddressTaken()) {
            Constant *OldBBAddr = BlockAddress::get(const_cast<Function*>(OldFunc),
                                                    const_cast<BasicBlock*>(&BB));
            VMap[OldBBAddr] = BlockAddress::get(NewFunc, CBB);
        }
        
        // Note return instructions for the caller.
        if (ReturnInst *RI = dyn_cast<ReturnInst>(CBB->getTerminator()))
            Returns.push_back(RI);
    }
    
    // Loop over all of the instructions in the function, fixing up operand
    // references as we go.  This uses VMap to do all the hard work.
    for (Function::iterator BB = cast<BasicBlock>(VMap[OldFunc->begin()]),
         BE = NewFunc->end(); BB != BE; ++BB)
        // Loop over all instructions, fixing each one as we find it...
        for (BasicBlock::iterator II = BB->begin(); II != BB->end(); ++II)
            RemapInstruction(II, VMap,
                             ModuleLevelChanges ? RF_None : RF_NoModuleLevelChanges,
                             TypeMapper, Materializer);
}

}

 




