#!/bin/bash

file=$1
line=$2
p=p

scs_keyworld="typedef extern static auto register"

scs_keyworld=$(echo $scs_keyworld | awk '{ split($0, token, " "); for(i = 1; token[i] != NULL; i++) { printf("%s ", token[i]);}} ')

str=($(sed -n $line$p $file | awk '{ split($0, token, " "); for(i = 1; token[i] != NULL; i++) { printf("%s\n", token[i]);}}'))


for var in "${str[@]}"
do 
		echo $var
done


