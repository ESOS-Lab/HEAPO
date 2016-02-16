arm-xilinx-linux-gnueabi-gcc -fPIC -c pos-lib.c pos-log.c pos-malloc.c
arm-xilinx-linux-gnueabi-ar rv libpos.a pos-lib.o pos-malloc.o pos-log.o
# and then complete to make archieve.
echo "Copied libpos.a /media/kunulee/BOOT/" 


cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/pos-lib.h /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/KV_delayed/ &&


cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/pos-lib.h /usr/include/ &&
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/pos-malloc.h /usr/include/ &&
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/pos-lib.h /home/kunulee/Downloads/tinySTM-1.0.5-delayed/src/
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/pos-log.h /home/kunulee/Downloads/tinySTM-1.0.5-delayed/src/
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/pos-malloc.h /home/kunulee/Downloads/tinySTM-1.0.5-delayed/src/
#gcc -fPIC -c -o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-lib.o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-lib.c &&
#gcc -fPIC -c -o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-log.o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-log.c &&
#gcc -fPIC -c -o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-malloc.o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-malloc.c &&
#gcc -shared -Wl,-soname,libpos.so.0 -o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/libpos.so.0.0.0 /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-lib.o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-log.o /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/pos-malloc.o &&

#cp /home/kunulee/HEAPO/HEAPO_UNDO_ARM_3.15/Library/libpos.so.0.0.0 /usr/local/lib &&
#ln -s /usr/local/lib/libpos.so.0.0.0 /usr/local/lib/libpos.so &&
#ln -s /usr/local/lib/libpos.so.0.0.0 /usr/local/lib/libpos.so.0 &&
#Move to lib dir about tinySTM modification.
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/libstm.a /usr/local/lib &&
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/stm.h /usr/include/ &&
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/stm_internal.h /usr/include/ &&
cp /home/kunulee/HEAPO/HEAPO_REDO_ARM_3.15/Library/mod_ab.h /usr/include/ 
