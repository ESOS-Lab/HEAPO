
clang -o main.o main.c -c -flto -g
clang -o fftmisc.o fftmisc.c -c -flto -g
clang -o fourierf.o fourierf.c -c -flto -g

llvm-link main.o fftmisc.o fourierf.o -o fft.bc

./profiletool -a 1 -i fft.bc -o fft_.bc
opt --strip-debug fft_.bc -o fft__.bc
llc -filetype=obj fft__.bc -o fft.o

clang++ -o fft fft.o -lm
