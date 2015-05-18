# Makefile
include /home/kunulee/Downloads/tinySTM-1.0.5/Makefile.common
BINS =  stm_test test7 stm_orig performance_test btree_test hash_test btree_performance delayed_performance_test delayed_btree_performance
#test7 stm_test
all: $(BINS) 

#%.o: $.c
#	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFINES) -c -o $@ $< 
$(BINS) : %: %.o list/pos-list.o hashtable/pos-hashtable.o btree/pos-btree.o $(TMLIB) 
	$(CC) -g -o $@ $< list/pos-list.o hashtable/pos-hashtable.o btree/pos-btree.o $(LDFLAGS) -L /usr/local/lib -lpos -lm 
clean :
	rm -rf $(BINS) *.o list/*.o hashtable/*.o btree/*.o
###all : tiny
##tiny : list/pos-list.o workload_list.o 
##	gcc $(CPPFLAGS) $(CFLAGS) $(DEFINES) -o tiny tiny.c  
##hashtable/pos-hashtable.o : 
##	gcc -c -o hashtable/pos-hashtable.o hashtable/pos-hashtable.c -L/usr/local/lib -lpos -lm -lstm
##btree/pos-btree.o:
##	gcc -c -o btree/pos-btree.o btree/pos-btree.c -L/usr/local/lib -lpos -lstm
##list/pos-list.o :
##	gcc -L/usr/local/lib -c -o list/pos-list.o list/pos-list.c -I/usr/local/include -lpos -lstm
#list/pos-list.o : 
#	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFINES)  -L/usr/local/lib -c -o list/pos-list.o list/pos-list.c $(LDFLAGS)
#workload_list.o : 
#	gcc -c -o workload_list.o workload_list.c -ldb
#clean : 
##	rm test8 test7 list_test malloc_test main main_bdb *.o btree/*.o hashtable/*.o list/*.o
