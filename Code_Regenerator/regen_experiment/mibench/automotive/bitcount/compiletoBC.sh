
clang -c bitcnt_1.c -o bitcnt_1.o -g -flto 
clang -c bitcnt_2.c -o bitcnt_2.o -g -flto 
clang -c bitcnt_3.c -o bitcnt_3.o -g -flto 
clang -c bitcnt_4.c -o bitcnt_4.o -g -flto 
clang -c bitcnts.c -o bitcnts.o -g -flto 
clang -c bitfiles.c -o bitfiles.o -g -flto 
clang -c bitstrng.c -o bitstrng.o -g -flto 
clang -c bstr_i.c -o bstr_i.o -g -flto 
llvm-link bitcnt_1.o bitcnt_2.o bitcnt_3.o bitcnt_4.o bitcnts.o bitfiles.o bitstrng.o bstr_i.o -o bitcnts.bc

./profiletool -a 3 -i bitcnts.bc -o bitcnts_.bc
opt --strip-debug bitcnts_.bc -o bitcnts__.bc
llc -filetype=obj bitcnts__.bc -o bitcnts.o

clang++ bitcnts.o -o bitcnts 

