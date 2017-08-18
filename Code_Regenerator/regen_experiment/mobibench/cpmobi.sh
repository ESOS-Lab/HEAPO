#!/bin/bash

count=$1
tar="pos_mobibench_$count.tar"

cp /home/sslee/git_source/Mobibench/shell/*.c ./
regen

ls -l mobibench.c

tar cvf $tar *.[ch] 

mv $tar pos_mobi/
