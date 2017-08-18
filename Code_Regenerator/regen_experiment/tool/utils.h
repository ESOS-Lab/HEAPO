//===                              util.h                                   ==//
//
//                     Application Memory Profiling Tool
//
//              Developed by System Design Methodology Laboratory
//                   Hanyang University, Seoul, South Korea
//
//===----------------------------------------------------------------------===//

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sstream>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <map>

//#include <limits.h>

#include "llvm/IR/IRBuilder.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/DataStream.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/GraphWriter.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/ADT/Triple.h"
#include "llvm/IR/CallSite.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"

#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Analysis/ConstantFolding.h"
#include "llvm/Analysis/InstructionSimplify.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/Transforms/Utils/ValueMapper.h"


#include "llvm/Analysis/Passes.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#define HEAP_  1
#define STACK_ 2
#define GV_ 3
#define ALL_ 4

#define StoreINST 1
#define LoadINST 2
#define AtomicINST 3

#if defined MACOSBUILD
#define LLVM_LINKER "llvmlink.py"
#define LLVM_LLC "llvmllc.py"
#define U_64T unsigned long
#else
#define LLVM_LINKER "llvm-link"
#define LLVM_LLC "llc"
#define U_64T u_int64_t
#endif

#define U_PTR U_64T
#define Context llvm::getGlobalContext()
#define Int64Ty IntegerType::get(llvm::getGlobalContext() ,64)
#define Int32Ty IntegerType::get(llvm::getGlobalContext() ,32)
#define Int16Ty IntegerType::get(llvm::getGlobalContext() ,16)
#define Int8Ty  IntegerType::get(llvm::getGlobalContext() ,8)


using namespace llvm ;

namespace profiletool
{
    typedef  std::map<std::string , int >  strMap ;
    typedef  std::map<std::string , int >::iterator  strMapI ;
    typedef  std::map<Instruction *, U_64T  > instmap_t ;
    typedef  std::map<Instruction *, U_64T  >::iterator instmap_I ;

    class ModifiedFunctionMeta;
    class Memaccess ;
    
    extern DataLayout  * TD ;
    extern strMap pf_fntlist  , app_fntlist ,app_GVlist ;
    extern std::string pf_prefix ;
    extern std::map<std::string , ModifiedFunctionMeta * > ModifiedFunctions;
    typedef std::map<std::string , ModifiedFunctionMeta * >::iterator ModifiedFunctionsI ;
    
    class ModifiedFunctionMeta
    {
        public :
        std::string  Name,OldName ,NewArg1Name,NewArg2Name;
        const Argument *NewArg1,*NewArg2;
        AllocaInst * NewArg1_StackHolder, *NewArg2_StackHolder;
        StoreInst  * NewArg1_StoreToStack, *NewArg2_StoreToStack;
    };
    
    class  Memaccess
    {
    public:
        enum TraceSourceType { GV, ST, HP , Unknown };
        enum EnumAccesType { Store = StoreINST , Load = LoadINST  , Atomic = AtomicINST };
        Memaccess(Instruction * Inst_ , EnumAccesType AccessType_  )
        { Inst = Inst_ ; AccessType = AccessType_; };
        Instruction * Inst ;
        EnumAccesType AccessType;
        LoadInst * getLD()
        {
            return dyn_cast<LoadInst>(Inst);
        };
        llvm::StoreInst * getST()
        {
            return dyn_cast<StoreInst >(Inst);
        };
        Value * getPointerOperand()
        {
            
            if (AccessType == StoreINST)
            {
                return getST()->getPointerOperand();
            }
            else if ( AccessType == LoadINST)
            {
                return getLD()->getPointerOperand();
            }
            return 0;
        }
        Value * getPointerOperandAllocation() // get the pointer operand , and resolves any GEP
        {
            llvm::Value * v ;
            if (AccessType == StoreINST)
            {
                v  = getST()->getPointerOperand();
            }
            else if ( AccessType == LoadINST)
            {
                v = getLD()->getPointerOperand();
            }
            
            
            if (GEPOperator *GEPoptr = dyn_cast<GEPOperator >(v))
            {
                return GEPoptr->getPointerOperand ();
            }
            else
            {
                return  v;
            }
            
            return NULL ;
        }
        Value * Source ;
        TraceSourceType SourceType ;
    };

    
    class SourceMeta
    {
    public:
        u_int64_t line = 0;
        u_int32_t column = 0 ;
        std::string function = "";
        std::string sourcefile = "" ;
        std::string directory = "";
    };
    
    class CallArguments
    {
    public:
        enum Types {INT8 ,INT16,INT32,INT64,STR ,VALUE,PtrToInt,PtrToVoidPtr,LoadGV,LoadST};
        Types Type[20];
        Value * Data[20];
        long Number[20];
        std::string SL[20];
        std::string SLname[20];
        int count;
        
        CallArguments(){ count = 0;}
        void add(std::string SL_,std::string SLname_ )
        {
            Type[count] = Types::STR; SL[count] = SL_; SLname[count] = SLname_ ;
            count++;
        }
        void add(Value * data)      {Type[count] = Types::VALUE; Data[count]=data; count++;}
        void add(Instruction * data){Type[count] = Types::VALUE; Data[count]=(Value*)data; count++;}
        void add(GlobalVariable *data,Types Ty ){Type[count] = Ty; Data[count]= (Value*)data ; count++;}
        void add(CallInst * data )  {Type[count] = Types::VALUE; Data[count]=(Value*)data; count++;}
        void add(long number,Types Ty )  {Type[count] = Ty; Number[count]= number ; count++;}
        void add(Value * data,Types CastTy) {Type[count] = CastTy ; Data[count] = data ; count++;}
    };

}


namespace profiletool
{
    extern std::map<Instruction *,int> AddedInstruction ;
    
    extern Module * LoadIRFile (std::string InputFilename ,std::string pf_function);
    
    extern GlobalVariable * getgv (Module * M,std::string Name);
    
    extern int  Save_Module_to_File (Module * ,std::string InputFilename,std::string OutputFilename,bool Convert_object_file );
    
    extern CallInst * CreateCallInst(Module * M, Function * functiontocall, CallArguments &arg,llvm::Instruction * insertP,bool insertafter = false) ;
    
    extern void Collect_AllocaInst(Module * M, instmap_t * list);
    
    extern void Collect_FcallInst(Module * M, Function *CalledFnt, instmap_t * list);
    
    extern void Collect_MemaccessInst(Module * M, std::map <BasicBlock * , std::vector<Memaccess *> *> *All_BBMemaccess_);
    
    extern bool VerifyModule (Module * M );
    
    extern std::map <void *, U_64T>Index ;
    
    inline void SetIndex(void *item, U_64T index_){ Index[item] = index_;}
    
    inline U_64T GetIndex (void * item){ return Index[item];}
    
    extern SourceMeta * getSourceMeta(Instruction * inst);
    
    void TraceMemAccess(Module * M, Memaccess * I ,int tracedepth);
    
}

namespace profiletool
{
    extern std::string FtnSig  (Function * F);
    
    extern std::string NameInst(const char * prefix);
    
    extern std::string tmpfile(std::string ext);
    
    extern void copyFunctionBody(Function &New, const Function &Orig, ValueToValueMapTy &VMap);
    
    extern std::string str (Value * t);
    
    extern std::string str (Type * t);
    
    extern std::string str (Memaccess * v);
}

class osFlush { public: osFlush() {}; };
class osMessage : public std::ostringstream
{
    
public:
    bool show ; std::string logF ;
    int outputtype;
    osMessage() ;
    osMessage(std::string logfile);
    
};
extern std::ostream& operator <<(std::ostream &os, const osFlush &go ) ;
extern std::ostream& operator <<(std::ostream &os, const llvm::StringRef &StringRef   ) ;
extern std::ostream& operator <<(std::ostream &os, const Value &data ) ;
extern std::ostream& operator <<(std::ostream &os, const Value *data ) ;
extern std::ostream& operator <<(std::ostream &os, const Instruction *data) ;
extern std::ostream& operator <<(std::ostream &os, const GlobalVariable * data ) ;
extern std::ostream& operator <<(std::ostream &os, const Module * data ) ;
extern std::ostream& operator <<(std::ostream &os, const Type *data ) ;

extern std::ostream& operator <<(std::ostream &os, const FunctionType * data ) ;
extern std::ostream& operator <<(std::ostream &os, const profiletool::Memaccess *data ) ;
extern std::ostream& operator <<(std::ostream &os, const profiletool::SourceMeta *data ) ;


extern  osFlush go  ;
extern  osMessage message;
extern  osMessage debug;



