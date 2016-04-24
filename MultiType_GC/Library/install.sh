cp pos-lib.h /usr/include/ &&
cp pos-malloc.h /usr/include/ &&
cp KV/list/pos-list.h /usr/include/ &&
cp KV/hashtable/pos-hashtable.h /usr/include &&
cp KV/hashtable/pos-hashtable_private.h /usr/include &&
cp KV/btree/pos-btree.h /usr/include &&
cp KV/alloc_list/alloc_list.h /usr/include &&
gcc -fPIC -c -o pos-lib.o pos-lib.c &&
gcc -fPIC -c -o pos-log.o pos-log.c &&
gcc -fPIC -c -o pos-malloc.o pos-malloc.c &&
gcc -fPIC -c -o alloc_list.o KV/alloc_list/alloc_list.c &&
gcc -fPIC -c -o pos-list.o KV/list/pos-list.c &&
gcc -fPIC -c -o pos-hashtable.o KV/hashtable/pos-hashtable.c &&
gcc -fPIC -c -o pos-btree.o KV/btree/pos-btree.c &&
gcc -shared -Wl,-soname,libpos.so.0 -o libpos.so.0.0.0 pos-lib.o pos-log.o pos-malloc.o alloc_list.o pos-list.o pos-hashtable.o pos-btree.o &&
cp libpos.so.0.0.0 /usr/local/lib &&
ln -s /usr/local/lib/libpos.so.0.0.0 /usr/local/lib/libpos.so &&
ln -s /usr/local/lib/libpos.so.0.0.0 /usr/local/lib/libpos.so.0
