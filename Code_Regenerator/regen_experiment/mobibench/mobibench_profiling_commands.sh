
size=102400
rec=4
acc=$1
sync=$2


db=$1
n=$2
j=$3
s=$4

cmd="/application -p ./ -d $db -n $n -j $j -s $s -g"
#cmd="/application -p ./ -f $size -r $rec -a $acc -y $sync"
#cd mobibench

echo $cmd 

echo $cmd | cat >> heapo_gen_result.csv

rm -f sqlite3.bc mobibench.bc mobibench_pf.bc application.bc application.o

clang mobibench.c -g -c -flto -o mobibench.bc

make -f Makefile_for_making_sqlite3.bc_file

cd ../tool

make

./profiletool -a 3 -i ../mobibench/mobibench.bc -o ../mobibench/mobibench_pf.bc


cd ../mobibench

opt --strip-debug mobibench_pf.bc -o mobibench_pf_.bc

llvm-link sqlite3.bc mobibench_pf_.bc -o application.bc

llc -filetype=obj application.bc -o application.o

clang++ application.o -o application -lpthread -ldl

#./application -p ./ -f $size -r $rec -a $acc -y $sync
./application -p ./ -d $db -n $n -j $j -s $s


#cd mobibench

rm -f sqlite3.bc mobibench.bc mobibench_pf.bc application.bc application.o

clang mobibench.c -g -c -flto -o mobibench.bc

make -f Makefile_for_making_sqlite3.bc_file

cd ../tool

make

./profiletool -a 1 -i ../mobibench/mobibench.bc -o ../mobibench/mobibench_pf.bc

cd ../mobibench

opt --strip-debug mobibench_pf.bc -o mobibench_pf_.bc

llvm-link sqlite3.bc mobibench_pf_.bc -o application.bc

llc -filetype=obj application.bc -o application.o

clang++ application.o -o application -lpthread -ldl

./application -p ./ -f $size -r $rec -a $acc -y $sync -g
#./application -p ./ -d $db -n $n -j $j -s $s
