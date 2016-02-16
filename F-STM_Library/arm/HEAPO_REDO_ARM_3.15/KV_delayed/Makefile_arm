# Modified by KEONWOO Lee <kunulee@hanyang.ac.kr> 

# You must change this flags to match with your home directory path.
HOME_DIR = /home/kunulee/HEAPO/HEAPO_STM_LIB/KV_tiny/
CC = arm-xilinx-linux-gnueabi-gcc
#include /home/kunulee/Downloads/tinySTM-1.0.5/Makefile.common

BINS = performance main kv_perf bdb_perf
OBJS = stm_lib/pos_stm.o list/pos-list.o list/pos-list-stm.o hashtable/pos-hashtable.o hashtable/pos-hashtable-stm.o btree/pos-btree.o btree/pos-btree-stm.o
SRCS = $(OBJS:%.o=%.c) #all files change to .c file
TARGET_NAME = $(OBJS:%.o=%) 

TM_LIB_NAME = libstm.a
all: $(BINS) 

# $(TMLIB) = /home/kunulee/Downloads/tinySTM1-1.0.5/lib/libstm.a  
performance : %: %.o stm_lib/pos_stm.o list/pos-list.o list/pos-list-stm.o hashtable/pos-hashtable.o hashtable/pos-hashtable-stm.o btree/pos-btree.o btree/pos-btree-stm.o
	$(CC)  -o $@ $< stm_lib/pos_stm.o list/pos-list.o list/pos-list-stm.o hashtable/pos-hashtable.o hashtable/pos-hashtable-stm.o btree/pos-btree.o btree/pos-btree-stm.o $(LDFLAGS) -L ../Library/ -lpos -lm -lstm -lpthread

main : stm_lib/pos_stm.o btree/pos-btree.o btree/pos-btree-stm.o hashtable/pos-hashtable.o hashtable/pos-hashtable-stm.o list/pos-list.o list/pos-list-stm.o workload_list.o 
	arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -o main workload_list.o btree/pos-btree.o list/pos-list.o hashtable/pos-hashtable.o btree/pos-btree-stm.o hashtable/pos-hashtable-stm.o list/pos-list-stm.o stm_lib/pos_stm.o main.c -lm -lrt -L . -ldb -L ../Library/ -lpos -lpthread -lstm

kv_perf : stm_lib/pos_stm.o btree/pos-btree.o btree/pos-btree-stm.o hashtable/pos-hashtable.o hashtable/pos-hashtable-stm.o list/pos-list.o list/pos-list-stm.o workload_list.o
	arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -o kv_perf workload_list.o btree/pos-btree.o list/pos-list.o hashtable/pos-hashtable.o btree/pos-btree-stm.o hashtable/pos-hashtable-stm.o list/pos-list-stm.o stm_lib/pos_stm.o kv_perf.c -lm -lrt -L . -ldb -L ../Library/ -lpos -lpthread -lstm

bdb_perf : stm_lib/pos_stm.o btree/pos-btree.o btree/pos-btree-stm.o hashtable/pos-hashtable.o hashtable/pos-hashtable-stm.o list/pos-list.o list/pos-list-stm.o workload_list.o
	arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -o bdb_perf workload_list.o btree/pos-btree.o list/pos-list.o hashtable/pos-hashtable.o btree/pos-btree-stm.o hashtable/pos-hashtable-stm.o list/pos-list-stm.o stm_lib/pos_stm.o bdb_perf.c -lm -lrt -L . -ldb -L ../Library/ -lpos -lpthread -lstm


clean :
	rm -rf $(BINS) *.o list/*.o hashtable/*.o btree/*.o stm_lib/*.o
