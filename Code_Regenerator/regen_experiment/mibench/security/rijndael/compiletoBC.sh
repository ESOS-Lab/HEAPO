
# compiling source to llvm bitcode file

rm app* *.o

#clang -static dijkstra_large.c -O3 -c -g -flto -o app-g.bc
clang -c aes.c -o aes.o -flto -g 
clang -c aesxam.c -o aesxam.o -flto -g 
llvm-link aes.o aesxam.o -o app.bc

./profiletool -a 3 -i app.bc -o app_.bc
opt --strip-debug app_.bc -o app__.bc
llc -filetype=obj app__.bc -o rijndael.o

clang++ rijndael -o rijndael.o

./rijnael input.dat > output_data.txt

