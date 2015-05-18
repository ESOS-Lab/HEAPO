EXEC = profiletool
PF = profile_functions.bc
SRC_DIR = src/
CXX = clang++
CC = clang
LLVMLINKER = llvm-link
CXXFLAGS = -I/usr/local/include  -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -Woverloaded-virtual -ffunction-sections -fdata-sections -Wcast-qual

LDFLAGS	=  -L/usr/local/lib
LIBS = -lLLVMBitWriter -lLLVMBitReader -lLLVMCore -lLLVMSupport -ldl -pthread

OBJS = $(SRC_DIR)sdmllvm.o $(SRC_DIR)profile_simple.o $(SRC_DIR)tpl.o $(SRC_DIR)readresult.o
H1 =  $(SRC_DIR)sdmllvm.hpp $(SRC_DIR)profile_simple.hpp $(SRC_DIR)tpl.h $(SRC_DIR)readresult.h
OBJSLIB = $(SRC_DIR)sdmllvm.o $(SRC_DIR)static_profile.o
OBJPF = $(SRC_DIR)pf.bc $(SRC_DIR)tpl.bc $(SRC_DIR)r.bc
H2 = $(SRC_DIR)tpl.h $(SRC_DIR)readresult.h $(SRC_DIR)profile_functions_globalvariable.c $(SRC_DIR)profile_functions_heap.c $(SRC_DIR)profile_functions_stack.c

all: $(EXEC) $(PF)

$(EXEC): $(OBJS)    ; @echo " LD ==> '$@'" ; $(CXX) $(CXXFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $(EXEC)

.cpp.o:       ; @echo "  ==> '$@'" ; $(CXX) $(CXXFLAGS) $(DEF) -c $*.cpp -o $*.o

.c.o :             ; @echo "  ==> '$@'" ; $(CC) -c $*.c -o $*.o

$(PF) : $(OBJPF)    ; @echo " LINK ==> '$@'" ; $(LLVMLINKER) $(OBJPF) -o $@

$(SRC_DIR)tpl.bc :  ; @echo "  ==> '$@'" ; $(CC) $(SRC_DIR)tpl.c -c -flto -g -O0 -o $@

$(SRC_DIR)pf.bc :   ; @echo "  ==> '$@'" ; $(CC) $(SRC_DIR)profile_functions.c -c -flto -g -O0  -o $@

$(SRC_DIR)r.bc :    ; @echo "  ==> '$@'" ; $(CC) $(SRC_DIR)readresult.c -c -flto -g -O0 -o $@


clean: ;rm -f $(OBJS) $(OBJSLIB) $(OBJPF) $(EXEC) $(PF)












