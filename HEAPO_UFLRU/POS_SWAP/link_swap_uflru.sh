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
ln -s	../../POS_SWAP/pos.c			../linux-swap/mm/pos.c
ln -s	../../POS_SWAP/pos_namespace.c		../linux-swap/mm/pos_namespace.c
ln -s	../../POS_SWAP/memory.c			../linux-swap/mm/memory.c
ln -s	../../POS_SWAP/mempolicy.c		../linux-swap/mm/mempolicy.c
ln -s	../../POS_SWAP/page_alloc.c		../linux-swap/mm/page_alloc.c
ln -s	../../POS_SWAP/vmscan_uflru.c		../linux-swap/mm/vmscan.c
ln -s	../../POS_SWAP/rmap_uflru.c		../linux-swap/mm/rmap.c
ln -s	../../POS_SWAP/swap.c			../linux-swap/mm/swap.c
ln -s	../../POS_SWAP/swap_state.c		../linux-swap/mm/swap_state.c

# link header
ln -s	../../../POS_SWAP/pos.h			../linux-swap/include/linux/pos.h
ln -s	../../../POS_SWAP/pos_namespace.h	../linux-swap/include/linux/pos_namespace.h
ln -s	../../../POS_SWAP/gfp.h			../linux-swap/include/linux/gfp.h
ln -s	../../../POS_SWAP/swap.h		../linux-swap/include/linux/swap.h
ln -s	../../../POS_SWAP/rmap.h		../linux-swap/include/linux/rmap.h

# link Makefile
ln -s	../../POS_SWAP/Makefile			../linux-swap/mm/Makefile

# CP
#cp 	./.config				../linux-swap/.config
