

# compiling source to llvm bitcode file

rm search_large*

clang -o bmhasrch.o -c bmhasrch.c -g -flto
clang -o bmhisrch.o -c bmhisrch.c -g -flto
clang -o bmhsrch.o -c bmhsrch.c -g -flto
clang -o pbmsrch_large.o -c pbmsrch_large.c -g -flto
llvm-link bmhasrch.o bmhisrch.o bmhsrch.o pbmsrch_large.o -o search_large.bc


./profiletool -a 1 -i search_large.bc -o search_large_.bc

opt --strip-debug search_large_.bc -o search_large__.bc
llc -filetype=obj search_large__.bc -o search_large.o
clang++ search_large.o -o search_large

