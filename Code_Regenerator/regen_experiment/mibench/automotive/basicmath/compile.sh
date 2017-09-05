app="basicmath_large"

echo $app
echo $app.bc

#rm $app *.o 

clang -c basicmath_large.c -o basicmath_large.o -g -flto 
clang -c rad2deg.c -o rad2deg.o -g -flto 
clang -c cubic.c -o cubic.o -g -flto 
clang -c isqrt.c -o isqrt.o -g -flto 
llvm-link basicmath_large.o rad2deg.o cubic.o isqrt.o -o $app.bc


./profiletool -a 1 -i $app.bc -o $app_.bc

opt --strip-debug $app_.bc -o $app__.bc
llc -filetype=obj $app__.bc -o $app.o

clang++ $app.o -o $app
