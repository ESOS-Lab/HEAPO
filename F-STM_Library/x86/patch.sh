
echo "***************"
echo "  F-STM patch"
echo " 1) Copied new unistd_64.h(includes recovery mechanism"
echo " 2) Copied original unistd_64.h(not includes recovery)" 
echo "**************\n"

#echo "backup original unistd_64.h( renamed unistd_64_ori.h )" 
echo "Copied unistd_64.h( includes pos_recovery ) to linux-2.6.32"
cp unistd_64.h /usr/src/linux-2.6.32/arch/x86/include/asm
cp unistd_64_ori.h /usr/src/linux-2.6.32/arch/x86/include/asm       
