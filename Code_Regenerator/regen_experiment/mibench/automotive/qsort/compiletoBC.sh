

# compiling source to llvm bitcode file

#rm app* *.o

clang -o qsort_large.bc qsort_large.c -c -flto -g

./profiletool -a 1 -i qsort_large.bc -o qsort_large_.bc

opt --strip-debug qsort_large_.bc -o qsort_large__.bc
llc -filetype=obj qsort_large__.bc -o qsort_large.o
clang++ qsort_large.o -o qsort_large -lm


#./app.bin input_large.pgm output_large.smoothing.pgm -s
#./susan input_large.pgm output_large.edges.pgm -e
#./susan input_large.pgm output_large.corners.pgm -c


