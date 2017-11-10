arm-xilinx-linux-gnueabi-gcc -fPIC -c pos-lib.c pos-log.c pos-malloc.c KV/alloc_list/alloc_list.c KV/list/pos-list.c KV/hashtable/pos-hashtable.c KV/btree/pos-btree.c -L -lpthread
arm-xilinx-linux-gnueabi-ar rv libpos.a pos-lib.o pos-malloc.o pos-log.o alloc_list.o pos-list.o pos-hashtable.o pos-btree.o
