#!/bin/bash
echo export MALLOC_CHECK_=0
echo "Executing rm.sh" 
../Library/rm.sh
echo "Executing install.sh" 
../Library/install.sh
make clean 
make
cp ./list/pos-list.h /home/kunulee/Downloads/tinySTM-1.0.5/src/
