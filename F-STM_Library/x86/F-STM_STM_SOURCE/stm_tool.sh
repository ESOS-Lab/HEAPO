#HEAPO_PATH_NAME="/home/kunulee/failsafe_dir/failsafe_heapo_source/Library/"
#HEAPO_KV_PATH="/home/kunulee/failsafe_dir/failsafe_heapo_source/KV_tiny/" 

HEAPO_PATH_NAME="../F-STM_LIBRARY/Library/" 
HEAPO_KV_PATH="../F-STM_LIBRARY/KV_tinry/" 


echo "TinySTM Build System in x86 HEAPO environment" 
echo "HEAPO_PATH : $HEAPO_PATH_NAME" 
echo "HEAPO_KV_PATH : $HEAPO_KV_PATH" 

sleep 1
cmd="make clean" 
$cmd
cmd="make" 
$cmd

cmd="clear" 
$cmd
echo " cp tinySTM header file to list directories " 
echo cp libstm.a to $HEAPO_PATH_NAME
cp ./lib/libstm.a $HEAPO_PATH_NAME
echo "cp stm.h to $HEAPO_PATH_NAME" 
cp ./include/stm.h $HEAPO_PATH_NAME
echo "cp mod_ab.h $HEAPO_PATH_NAME" 
cp ./include/mod_ab.h $HEAPO_PATH_NAME 
echo "cp stm_internal.h $HEAPO_PATH_NAME"
cp ./src/stm_internal.h $HEAPO_PATH_NAME
echo "cp esos_header.h $HEAPO_PATH_NAME"
cp ./src/esos_header.h $HEAPO_PATH_NAME
echo "cp esos_header.h $HEAPO_KV_PATH" 
cp ./src/esos_header.h $HEAPO_KV_PATH
echo "cp esos_header.h $HEAPO_KV_PATH/stm_lib"
cp ./src/esos_header.h $HEAPO_KV_PATH/stm_lib

echo "finish"

