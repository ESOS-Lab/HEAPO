
#include <sstream>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

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

#include <boost/algorithm/string/split.hpp>
#include <boost/algorithm/string/classification.hpp>
#include <boost/algorithm/string/replace.hpp>


#include "readresult.h"
#include "tpl.h"
#include "macros.h"


using namespace llvm ;

class osFlush { public: osFlush() {}; };
class osMessage : public std::ostringstream
{
public:
    bool show; std::string prefix ; std::string logF ;
    int outputtype;
    std::string serverip ;int serverport ;
    osMessage() ;
    osMessage(std::string logfile);
    osMessage(std::string ip,int udp_port);
    
};
extern osFlush go  ;
extern osMessage message; extern osMessage debug;//extern osMessage debug2;
extern std::ostream& operator <<(std::ostream &os,  const     osFlush &go ) ;


namespace sdmllvm
{
    class module ;
    class instruction   ;
    class function ;
    class basicblock ;
    class globalvariable ;
    class MemoryAccessInst ;
    class module ;
    class region ;
    class loop ;
    class SourceInfo ;
    
    struct  Error_Infor   {  bool error ; std::string msg ;  };
    typedef std::vector <function *>::iterator  ffiterator ;
    typedef std::vector <basicblock*>::iterator bbiterator ;
    typedef std::vector <instruction *>::iterator institerator ;
    typedef std::vector <globalvariable *>::iterator GVinterator ;
    
    extern std::string printllvmvalue(llvm::Value * v);
    extern std::string printllvmvalue(llvm::Instruction * v);
    extern std::string printllvmvalue (llvm::Type * t);
    
    #define Context llvm::getGlobalContext()
    #define Int64_t IntegerType::get(llvm::getGlobalContext() ,64)
    #define Int32_t IntegerType::get(llvm::getGlobalContext() ,32)
    #define Int16_t IntegerType::get(llvm::getGlobalContext() ,16)
    #define Int8_t IntegerType::get(llvm::getGlobalContext() ,8)
    
    
    class module
    {
    private:
        long long inst_added_count ;
        
    public:
        llvm::Module * base ;
        llvm::DataLayout  *TD ;
        std::unique_ptr<llvm::Module> Mod ;
        std::map<llvm::GlobalVariable *  , globalvariable * >  gvmap ;
        
        std::map< long   , globalvariable * >  gvindexmap ;
        
        typedef std::map<llvm::GlobalVariable *  , globalvariable * >::iterator gvmapI ;
        std::map<llvm::Function  *  , function * >  functionmap ;
        typedef std::map<llvm::Function  *  , function * >::iterator functionmapI ;
        std::map<std::string, function * >  pf_functions  ;
        std::map<std::string, globalvariable * >  pf_globalvariables  ;
        
        module ();
        const char * getnewinstname();
        const char * getnewinstname(const char * prefix);
        std::string print( );
        int LoadApp (std::string InputFilename ,std::string profile_function   );
        int LoadApp (llvm::Module *M );
        int LoadApp (std::string InputFilename );
        int LoadApp (std::string InputFilename ,std::string profile_function , std::string support_code_prefix  );
        
        
        
    };
    
    class globalvariable
    {
    private:
        std::string typestring ;
        
    public:
        llvm::GlobalVariable * base  ;
        long index;
        std::string Name()
        {
            return base->getName() ;
        };
        llvm::Type *Type()
        {
            return base->getType()->getElementType();
        };
        uint64_t MemorySize()
        {
            return base->getDataLayout()->getTypeAllocSize(base->getType()->getElementType());
        };
        std::string TypeString()
        {
            return typestring ;
        };
        globalvariable(llvm::GlobalVariable * gv);
        std::string  print();
    };
    
    
    class function
    {
    public:
        llvm::Function * base ;
        u_int32_t index;
        sdmllvm::module * Mod ;
        std::map<llvm::BasicBlock * , basicblock * > bbmap ;
        typedef std::map<llvm::BasicBlock * , basicblock * >::iterator bbmapI ;
        function(llvm::Function * F , sdmllvm::module * Mod_);
        std::string Name()
        {
           return base->getName().str();
        };
        std::string  print();
        std::map<llvm::BasicBlock *,sdmllvm::basicblock *> * bblist;
        std::map<int , region  *> rgmap  ;
        typedef std::map<int , region  *>::iterator rgI ;
        int rgcount;
        std::map<int , loop  *> lpmap   ;
        typedef std::map<int , loop  *>::iterator lpI ;
        int lpcount ;
        std::string sourcefile, sourcedir;
        
    };
    
    
    class basicblock
    {
    public:
        llvm::BasicBlock * base ;
        long index ;
        function  * parentfunction ;
        basicblock( llvm::BasicBlock * B);
        std::map<llvm::Instruction * , MemoryAccessInst *> meminstmap ;
        typedef std::map<llvm::Instruction * , MemoryAccessInst *>::iterator meminstmapI ;
        std::string  print();
    };
    
    
    
    class instruction
    {
    public:
        llvm::Instruction * base ;
        std::string  print();
        instruction(llvm::Instruction *, bool getsource_info );
        u_int64_t line;
        u_int32_t column ;
        std::string function;
        std::string sourcefile ;
        std::string directory ;
    } ;
    
    typedef  std::map<sdmllvm::instruction *, u_int64_t> instmap_t ;
    typedef  std::map<sdmllvm::instruction *, u_int64_t>::iterator instmap_I ;
    
    
#define StoreINST 1
#define LoadINST 2
#define AtomicINST 3
    
    enum TraceSourceType { GV, ST, HP , Unknown };
    
    class TraceInfo
    {
    public:
        MemoryAccessInst * Instruction;
        llvm::Value * Source ;
        TraceSourceType Type ;
    };
    
    class  MemoryAccessInst
    {
    public:
        llvm::Instruction * base ;
        std::string  print();
        MemoryAccessInst(llvm::Instruction * Inst , int AccessType_ ,llvm::StoreInst * s_ ,llvm::LoadInst * l_ );
        static MemoryAccessInst * IsMemAccess( llvm::Instruction * Inst) ;
        
        llvm::LoadInst * l;
        llvm::StoreInst * s;
        int AccessType;
        sdmllvm::TraceInfo * TraceInfo ;
        
        llvm::Value * getPointerOperand();
        llvm::Value * getPointerOperandValue();
        
    };
    
    
    class arg
    {
    public:
        int type ;
        int dataInt ;
        llvm::Value * dataValue ;
        llvm::Instruction * dataInst ;
        sdmllvm::instruction * datainst ;
        std::string SL , SLname;
        arg(int data){type = 1; dataInt = data ;};
        arg(int data, int type_){type = type_; dataInt = data ;};
        arg(llvm::Value * data){type = 2; dataValue = data ;};
        arg(llvm::Instruction * data){type = 3; dataInst = data ;};
        arg(llvm::CallInst * data){type = 3; dataInst = data ; printllvmvalue(data ); };
        arg(instruction * data){type = 4; datainst = data ;};
        arg( llvm::Value * data, int type_ ){type = type_; dataValue = data ;};
        arg(std::string SL_,std::string SLname_ , int type_ ){type = type_; SL = SL_; SLname = SLname_;
        }
#define ARG sdmllvm::arg
#define ARGV std::vector<sdmllvm::arg >
#define ARGI std::vector<sdmllvm::arg >::iterator
#define ARGpti 5    // pointer to int
#define ARGSL 6     // string literal
#define ARGI8 7     // 8 bit integer
#define ARGI64 8    // 64 bit integer
#define NOARG -1    // ignore arguments
    };

}


#define ALL_BB_Iteration        \
for (sdmllvm::module::functionmapI IF  = M->functionmap.begin() ; IF != M->functionmap.end(); IF ++) \
{ \
    sdmllvm::function * f  = IF->second ; \
    sdmllvm::function::bbmapI Ib ; \
    for (Ib = f->bbmap.begin() ; Ib != f->bbmap.end() ; ++Ib  ) \
    {   \
        sdmllvm::basicblock * b = Ib->second;   \
        llvm::BasicBlock * B = Ib->first ;

#define ALL_BB_Iteration_End        } }

#define Function_BB_Iteration        \
    for (sdmllvm::function::bbmapI Ib = f->bbmap.begin() ; Ib != f->bbmap.end() ; ++Ib  ) \
    {   \
        sdmllvm::basicblock * b = Ib->second;   \
        llvm::BasicBlock * B = Ib->first ;

#define Function_BB_Iteration_End        }


namespace sdmllvm
{
    // Other functions
    extern llvm::CallInst * CreateCallInst(sdmllvm::module * M,llvm::Instruction * Insertpoint,bool insertafter , sdmllvm::function * functiontocall, ARGV arg_) ;
    
    extern llvm::CallInst  * WrapAfunction_head(sdmllvm::module * M,sdmllvm::function * FF , sdmllvm::function * head ,  ARGV  arg_  );
    
    extern std::vector< llvm::CallInst * > * WrapAfunction_tail   (sdmllvm::module * M,sdmllvm::function * FF , sdmllvm::function * tail , ARGV arg_ );
    
    extern int Insert_log_default( sdmllvm::module * M , sdmllvm::function * logf);
    
    extern void Collect_FcallInst(sdmllvm::module * M, llvm::Function *F, instmap_t * list) ;

    enum InstType { StackAllocationInst } ;
    extern void Collect_Inst(sdmllvm::module * M,   InstType Ty, instmap_t * list) ;
    
    extern void TraceMemAccess(sdmllvm::module * M, sdmllvm::MemoryAccessInst * I );
    
}



