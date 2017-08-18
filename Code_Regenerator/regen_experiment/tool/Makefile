
CXX = clang++

CC = clang

LLVMLINKER = llvm-link

CXXFLAGS = -I/usr/local/include  -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -Woverloaded-virtual -ffunction-sections -fdata-sections -Wcast-qual

CCFLAGS = -DUBUNTUBUILD

LDFLAGS	=  -L/usr/local/lib

LIBS = -lLLVMBitWriter -lLLVMBitReader -lLLVMCore -lLLVMSupport -ldl -lpthread -lLLVMTransformUtils -lLLVMAsmPrinter -lLLVMCore -lpthread -lm #-ltinfo


Tool = profiletool
PF = PF.bc
ToolObjs = utils.o main.o

all: $(Tool) $(PF)

$(Tool): $(ToolObjs); @echo "  LD $(ToolObjs) ==> '$@'" ; $(CXX) $(CXXFLAGS) $(LDFLAGS) $(ToolObjs) $(LIBS) -o $(Tool)

.cpp.o:       ; @echo "  ==> '$@'" ; $(CXX) $(CXXFLAGS) $(DEF) -c $*.cpp -o $*.o -O3 -g

$(PF) : pFunctions.cpp ; @echo " ==> '$@'" ; $(CXX) $(CXXFLAGS) pFunctions.cpp -c -flto -o $@ -fno-inline -O3

clean: ;rm -f $(ToolObjs) $(Tool) $(PF) App_verify_log* App_IR* traceStat.txt
