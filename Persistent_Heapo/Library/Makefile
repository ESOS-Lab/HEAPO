all : malloc_free

malloc_free : pos-lib.o pos-malloc.o
	arm-xilinx-linux-gnueabi-gcc -o malloc_free malloc_free.c -L . -lpos

#pos-lib.o :
#	gcc -c -o pos-lib.o pos-lib.c

#pos-malloc.o : 
#	gcc -c -o pos-malloc.o pos-malloc.c

clean : 
	rm *.o malloc_free

