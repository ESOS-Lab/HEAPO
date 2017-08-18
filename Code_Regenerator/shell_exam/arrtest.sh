#!/bin/bash

array1=(file.c function.c math.c)


for file in ${array1[@]}
do
	echo $file

done


echo ""
echo ${#array1[0]}
echo ${array1:0}
echo ${array1:1}
echo ${array1:2}
echo ${array1:3}
echo ${array1:4}
echo ""
echo ${#array1[1]}
echo ${array1[1]:0}
echo ${array1[1]:1}
echo ${array1[1]:2}
echo ${array1[1]:3}
echo ${array1[1]:4}
echo ""


## 이미 선언된 배열에 원소 추가
array1[${#array1[*]}]="new.cpp"

for file in ${array1[@]}
do
	echo $file

done

declare -a colors

read -a colors 



