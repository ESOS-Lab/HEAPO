aarch64-linux-gnu-gcc -fPIC -c pos-lib.c pos-malloc.c
aarch64-linux-gnu-gcc-ar-4.8 rv libpos.a pos-lib.o pos-malloc.o
