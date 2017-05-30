all : malloc_free

malloc_free : pos-lib.o pos-malloc.o
	aarch64-linux-gnu-gcc -o malloc_free malloc_free.c -L . -lpos
	aarch64-linux-gnu-gcc -o malloc_free2 malloc_free2.c -L . -lpos

#pos-lib.o :
#	gcc -c -o pos-lib.o pos-lib.c

#pos-malloc.o : 
#	gcc -c -o pos-malloc.o pos-malloc.c

clean : 
	rm *.o malloc_free
