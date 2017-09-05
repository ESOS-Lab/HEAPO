# unlink
unlink ../linux-3.15/mm/Makefile
unlink ../linux-3.15/mm/memory.c
unlink ../linux-3.15/mm/page_alloc.c
unlink ../linux-3.15/mm/pos.c
unlink ../linux-3.15/mm/rmap.c
unlink ../linux-3.15/mm/swap_state.c
unlink ../linux-3.15/mm/vmscan.c
unlink ../linux-3.15/mm/pos_namespace.c

unlink ../linux-3.15/include/linux/mm.h
unlink ../linux-3.15/include/linux/pos.h
unlink ../linux-3.15/include/linux/pos_namespace.h

# link
ln -s	../../POS_SWAP/Makefile			../linux-3.15/mm/Makefile
ln -s	../../POS_SWAP/memory.c			../linux-3.15/mm/memory.c
ln -s	../../POS_SWAP/page_alloc.c		../linux-3.15/mm/page_alloc.c
ln -s	../../POS_SWAP/pos.c			../linux-3.15/mm/pos.c
ln -s	../../POS_SWAP/rmap.c			../linux-3.15/mm/rmap.c
ln -s	../../POS_SWAP/swap_state.c		../linux-3.15/mm/swap_state.c
ln -s	../../POS_SWAP/vmscan.c			../linux-3.15/mm/vmscan.c
ln -s	../../POS_SWAP/pos_namespace.c		../linux-3.15/mm/pos_namespace.c

ln -s	../../../POS_SWAP/mm.h			../linux-3.15/include/linux/mm.h
ln -s	../../../POS_SWAP/pos.h			../linux-3.15/include/linux/pos.h
ln -s	../../../POS_SWAP/pos_namespace.h	../linux-3.15/include/linux/pos_namespace.h

# CP
cp 	./.config				../linux-3.15/.config
