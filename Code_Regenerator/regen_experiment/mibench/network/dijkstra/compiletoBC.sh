
# compiling source to llvm bitcode file

rm app* *.o

clang dijkstra_large.c -c -g -flto -o app-g.bc

./profiletool -a 3 -i app-g.bc -o appf-g.bc

opt --strip-debug appf-g.bc -o appf.bc
llc -filetype=obj appf.bc -o app.o
clang++ app.o -o app.bin

./app.bin input.dat > output_data.txt

