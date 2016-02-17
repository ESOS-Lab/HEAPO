

KERNEL_PATH="/usr/src/linux-2.6.32/"


echo "***************"
echo "  F-STM patch"
echo " 1) Copied new unistd_64.h(includes recovery mechanism"
echo " 2) Copied original unistd_64.h(not includes recovery)" 
echo "**************\n"

# To use pos_recovery system call, we modified unistd_64.h 
echo "Copied unistd_64.h( includes pos_recovery ) to linux-2.6.32"
cp unistd_64.h $KERNEL_PATH/arch/x86/include/asm
cp unistd_64_ori.h $KERNEL_PATH/arch/x86/include/asm      

echo "Copied pos.c/pos.h to /usr/src/linux-2.6.32" 
cp pos.c $KERNEL_PATH/mm/
cp pos_ori.c $KERNEL_PATH/mm/
