./rm.sh &&
./install.sh &&
gcc -o list_test KV/list_test.c -lrt -L/usr/local/lib -lpos -lm
