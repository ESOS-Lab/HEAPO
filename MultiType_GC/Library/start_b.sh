./rm.sh &&
./install.sh &&
gcc -o btree_test KV/btree_test.c -lrt -L/usr/local/lib -lpos -ldb -lm
