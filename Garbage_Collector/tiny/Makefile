# Makefile
include /home/kunulee/Downloads/tinySTM-1.0.5/Makefile.common
BINS =  btree_insert
#test7 stm_test
all: $(BINS) 

$(BINS) : %: %.o $(TMLIB) 
	$(CC) -g -o $@ $<  $(LDFLAGS) -L /usr/local/lib -lpos -lm -lrt 
clean :
	rm -rf $(BINS) *.o 
#all : tiny
#tiny : list/pos-list.o workload_list.o 
#	gcc $(CPPFLAGS) $(CFLAGS) $(DEFINES) -o tiny tiny.c  


workload_list.o : 
	gcc -c -o workload_list.o workload_list.c -ldb
#clean : 
##	rm test8 test7 list_test malloc_test main main_bdb *.o btree/*.o hashtable/*.o list/*.o
