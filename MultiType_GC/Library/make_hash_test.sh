./rm.sh &&
./install.sh &&
rm -rf v7_pmu.o &&
arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -c v7_pmu.s &&
arm-xilinx-linux-gnueabi-gcc -O0 -mtune=cortex-a9 -o ./build/hash_test KV/GC_test_codes/hash_test.c v7_pmu.o -lrt -L ./ -lpos -lpthread -lm --static
