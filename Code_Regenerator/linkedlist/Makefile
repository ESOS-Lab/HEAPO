main : main.o linkedlist.o linkedlist.h
	gcc -g -o main main.o linkedlist.o
main.o : main.c linkedlist.h
	gcc -g -c main.c
linkedlist.o : linkedlist.c linkedlist.h
	gcc -g -c linkedlist.c
clean :
	rm -f main *.o

