# Makefile
include /home/kunulee/Downloads/tinySTM-1.0.5/Makefile.common
BINS =  btree_performance 
#test7 stm_test
all: $(BINS) 

%.o: $.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFINES) -c -o $@ $< 
$(BINS) : %: %.o btree/pos-btree.o $(TMLIB) 
	$(CC) -g -o $@ $< btree/pos-btree.o $(LDFLAGS) -L /usr/local/lib -lpos -lm -lrt 
clean :
	rm -rf $(BINS) *.o btree/*.o
#all : tiny
#tiny : list/pos-list.o workload_list.o 
#	gcc $(CPPFLAGS) $(CFLAGS) $(DEFINES) -o tiny tiny.c  

btree/pos-btree.o:
	gcc -c -o btree/pos-btree.o btree/pos-btree.c -L/usr/local/lib -lpos -lstm

workload_list.o : 
	gcc -c -o workload_list.o workload_list.c -ldb
#clean : 
##	rm test8 test7 list_test malloc_test main main_bdb *.o btree/*.o hashtable/*.o list/*.o
