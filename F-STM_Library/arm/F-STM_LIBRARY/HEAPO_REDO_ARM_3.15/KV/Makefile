# Makefile
all : main main_bdb

main : btree/pos-btree.o hashtable/pos-hashtable.o list/pos-list.o workload_list.o v7_pmu.o
	arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -o main_pos workload_list.o btree/pos-btree.o list/pos-list.o hashtable/pos-hashtable.o v7_pmu.o main.c -lm -lrt -L . -ldb -L ../Library/ -lpos -lpthread

main_bdb : workload_list.o v7_pmu.o
	arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -o main_bdb main_bdb.c workload_list.o v7_pmu.o -lrt -L ./ -ldb -lpthread

btree/pos-btree.o :
	arm-xilinx-linux-gnueabi-gcc -c -o btree/pos-btree.o btree/pos-btree.c -L ../Library/ -lpos

hashtable/pos-hashtable.o :
	arm-xilinx-linux-gnueabi-gcc -c -o hashtable/pos-hashtable.o hashtable/pos-hashtable.c -L ../Library/ -lpos -lm

list/pos-list.o :
	arm-xilinx-linux-gnueabi-gcc -c -o list/pos-list.o list/pos-list.c -L ../Library/ -lpos

workload_list.o : 
	arm-xilinx-linux-gnueabi-gcc -c workload_list.c -L ./ -ldb

v7_pmu.o:
	arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -c v7_pmu.s

clean : 
	rm main_pos main_bdb *.o btree/*.o hashtable/*.o list/*.o
