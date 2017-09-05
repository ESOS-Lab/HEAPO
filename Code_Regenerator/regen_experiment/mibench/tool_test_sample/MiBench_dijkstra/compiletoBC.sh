

# compiling source to llvm bitcode file

rm app* *.o

clang -static dijkstra_large.c -O3 -c -g -flto -o app-g.bc

./profiletool -a h -i app-g.bc -o appf-g.bc

opt --strip-debug appf-g.bc -o appf.bc
llc -filetype=obj appf.bc -o app.o
clang++ app.o -o app.bin


./app.bin input.dat > output_large.dat

