cp pos-lib.h /usr/include/ &&
cp pos-malloc.h /usr/include/ &&
gcc -fPIC -c -o pos-lib.o pos-lib.c &&
gcc -fPIC -c -o pos-log.o pos-log.c &&
gcc -fPIC -c -o pos-malloc.o pos-malloc.c &&
gcc -shared -Wl,-soname,libpos.so.0 -o libpos.so.0.0.0 pos-lib.o pos-log.o pos-malloc.o &&
cp libpos.so.0.0.0 /usr/local/lib &&
ln -s /usr/local/lib/libpos.so.0.0.0 /usr/local/lib/libpos.so &&
ln -s /usr/local/lib/libpos.so.0.0.0 /usr/local/lib/libpos.so.0
