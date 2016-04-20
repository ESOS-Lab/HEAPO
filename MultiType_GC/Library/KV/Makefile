# Makefile
all : main main_bdb

main : btree/pos-btree.o hashtable/pos-hashtable.o list/pos-list.o workload_list.o
	gcc -o main main.c btree/pos-btree.o hashtable/pos-hashtable.o list/pos-list.o workload_list.o -lrt -L/usr/local/lib -lpos -ldb -lm

main_bdb : workload_list.o
	gcc -o main_bdb main_bdb.c workload_list.o -lrt -ldb

btree/pos-btree.o :
	gcc -c -o btree/pos-btree.o btree/pos-btree.c -L/usr/local/lib -lpos

hashtable/pos-hashtable.o :
	gcc -c -o hashtable/pos-hashtable.o hashtable/pos-hashtable.c -L/usr/local/lib -lpos -lm

list/pos-list.o :
	gcc -c -o list/pos-list.o list/pos-list.c -L/usr/local/lib -lpos

workload_list.o : 
	gcc -c -o workload_list.o workload_list.c -ldb

clean : 
	rm main main_bdb *.o btree/*.o hashtable/*.o list/*.o
