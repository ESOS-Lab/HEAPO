

# compiling source to llvm bitcode file

rm app* *.o

clang -o app-g.bc susan.c -c -flto -g

./profiletool -a h -i app-g.bc -o appf-g.bc

opt --strip-debug appf-g.bc -o appf.bc
llc -filetype=obj appf.bc -o app.o
clang++ app.o -o app.bin -lm


./app.bin input_large.pgm output_large.smoothing.pgm -s
#./susan input_large.pgm output_large.edges.pgm -e
#./susan input_large.pgm output_large.corners.pgm -c


