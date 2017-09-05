# unlink
unlink ../linux-swap/mm/pos.c
unlink ../linux-swap/mm/memory.c
unlink ../linux-swap/mm/mempolicy.c
unlink ../linux-swap/mm/pos_namespace.c
unlink ../linux-swap/mm/page_alloc.c
unlink ../linux-swap/mm/vmscan.c
unlink ../linux-swap/mm/rmap.c
unlink ../linux-swap/mm/swap.c
unlink ../linux-swap/mm/swap_state.c

unlink ../linux-swap/include/linux/pos.h
unlink ../linux-swap/include/linux/pos_namespace.h
unlink ../linux-swap/include/linux/gfp.h
unlink ../linux-swap/include/linux/swap.h
unlink ../linux-swap/include/linux/rmap.h

unlink ../linux-swap/mm/Makefile

# link source
ln -s	../../POS_SWAP2/pos.c			../linux-swap/mm/pos.c
ln -s	../../POS_SWAP2/pos_namespace.c		../linux-swap/mm/pos_namespace.c
ln -s	../../POS_SWAP2/memory.c		../linux-swap/mm/memory.c
ln -s	../../POS_SWAP2/mempolicy.c		../linux-swap/mm/mempolicy.c
ln -s	../../POS_SWAP2/page_alloc.c		../linux-swap/mm/page_alloc.c
ln -s	../../POS_SWAP2/vmscan_ori.c		../linux-swap/mm/vmscan.c
ln -s	../../POS_SWAP2/rmap.c			../linux-swap/mm/rmap.c
ln -s	../../POS_SWAP2/swap.c			../linux-swap/mm/swap.c
ln -s	../../POS_SWAP2/swap_state.c		../linux-swap/mm/swap_state.c

# link header
ln -s	../../../POS_SWAP2/pos.h		../linux-swap/include/linux/pos.h
ln -s	../../../POS_SWAP2/pos_namespace.h	../linux-swap/include/linux/pos_namespace.h
ln -s	../../../POS_SWAP2/gfp.h		../linux-swap/include/linux/gfp.h
ln -s	../../../POS_SWAP2/swap.h		../linux-swap/include/linux/swap.h
ln -s	../../../POS_SWAP2/rmap.h		../linux-swap/include/linux/rmap.h

# link Makefile
ln -s	../../POS_SWAP2/Makefile		../linux-swap/mm/Makefile

# CP
#cp 	./.config				../linux-swap/.config
