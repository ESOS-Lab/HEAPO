./rm.sh &&
./install.sh &&
gcc -o hash_test KV/hash_test.c -lrt -L/usr/local/lib -lpos -ldb -lm
