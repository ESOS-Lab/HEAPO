# unlink
unlink ../linux-swap/mm/pos.c
unlink ../linux-swap/mm/pos_namespace.c

unlink ../linux-swap/include/linux/pos.h
unlink ../linux-swap/include/linux/pos_namespace.h

unlink ../linux-swap/mm/Makefile

# link source
ln -s	../../POS_SWAP/pos.c			../linux-swap/mm/pos.c
ln -s	../../POS_SWAP/pos_namespace.c		../linux-swap/mm/pos_namespace.c

# link header
ln -s	../../../POS_SWAP/pos.h			../linux-swap/include/linux/pos.h
ln -s	../../../POS_SWAP/pos_namespace.h	../linux-swap/include/linux/pos_namespace.h

# link Makefile
ln -s	../../POS_SWAP/Makefile			../linux-swap/mm/Makefile

# CP
#cp 	./.config				../linux-swap/.config
