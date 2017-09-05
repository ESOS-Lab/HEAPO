rm patricia*.o patricia*.bc

clang -c patricia.c -o patricia.o -g -flto
clang -c patricia_test.c -o patricia_test.o -g -flto
llvm-link patricia.o patricia_test.o -o patricia.bc

./profiletool -a h -i patricia.bc -o patricia_.bc

opt --strip-debug patricia_.bc -o patricia__.bc
llc -filetype=obj patricia__.bc -o patricia_.o
clang++ patricia_.o -o patricia 

./patricia large.udp > output_large.txt
