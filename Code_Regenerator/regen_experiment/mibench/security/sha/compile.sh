
app=sha

clang -o sha.o sha.c -c -flto -g
clang -o sha_driver.o sha_driver.c -c -flto -g

llvm-link sha.o sha_driver.o -o "$app".bc

./profiletool -a 1 -i "$app".bc -o "$app"_.bc
opt --strip-debug "$app"_.bc -o "$app"__.bc
llc -filetype=obj "$app"__.bc -o "$app".o

clang++ -o $app "$app".o
