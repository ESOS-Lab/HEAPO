

# compiling source to llvm bitcode file
clang++   -c CumNormalInv.cpp -o CumNormalInv.o -g -flto
clang++   -c MaxFunction.cpp -o MaxFunction.o -g -flto
clang++   -c RanUnif.cpp -o RanUnif.o -g -flto
clang++   -c nr_routines.c -o nr_routines.o -g -flto
clang++   -c icdf.cpp -o icdf.o -g -flto
clang++   -c HJM_SimPath_Forward_Blocking.cpp -o HJM_SimPath_Forward_Blocking.o -g -flto
clang++   -c HJM.cpp -o HJM.o -g -flto
clang++   -c HJM_Swaption_Blocking.cpp -o HJM_Swaption_Blocking.o -g -flto
clang++   -c HJM_Securities.cpp -o HJM_Securities.o -g -flto
llvm-link CumNormalInv.o MaxFunction.o RanUnif.o nr_routines.o icdf.o HJM_SimPath_Forward_Blocking.o HJM.o HJM_Swaption_Blocking.o HJM_Securities.o -o swaptions-g.bc


# profiling example
./profiletool -a 1 -i swaptions-g.bc -o swaptionspf-g.bc
opt --strip-debug swaptionspf-g.bc -o swaptionspf.bc
llc -filetype=obj swaptionspf.bc -o swaptionspf.o
clang++ swaptionspf.o -o swaptionspf.bin  -lpthread
./swaptionspf.bin -ns 100 -sm 100 -nt 1 -sd 200
