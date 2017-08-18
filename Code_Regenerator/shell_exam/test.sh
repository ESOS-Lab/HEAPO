#!/bin/bash

argc=$#
argv0=$0
file=$1
echo $file
frees="$file"_frees
#file="./mobibench.c"
#awk '/\/\*\(.\|\n\)\{-\}\*\//' $file
#awk '/free/' $file

#sed -n -e '/main[[:space:]]*(/,/^}/p' $file | more
#sed -n -e '/main[[:space:]]*(/,/^}/p' $file | more
#sed -n -e '/[.\s]*\/\*.*/, /[.\s]*\*\//p' $file
#sed -n -e '/[.\s]*\/\*.*/, /[.\s]*\*\//p' $file
#sed -n -e '/[.\s]*\/*.*\*\//p' $file
#echo $free1    
       
lparen="\("
rparen="\)"
s="s" 
touch $frees
#echo [index]linenumber : string : vriable >> $frees

#sed -n '/^[\/\*/\*\*].*[\*\/]$/p' sqlite3.c
#frees1=$(sed -n '/^[^\*\/].*[^A-Za-z0-9_$\/\*]free[\_s]*(/=' $file) # //* 처음 시작 걸러짐

#frees1=$(sed -n '/[^\/\*][^A-Za-z0-9_$\*\/]free[\_s]*(.*);/=' $file) # 주석 걸짐

#frees1=$(sed -n '/^\(\s.\)*free[\_s]*(.*);/=' $file) # 주석 걸짐
#frees1=$(sed -n '/^\(\s.\)*[^\/\*][^A-Za-z0-9_$\*\/]free[\_s]*(.*);/=' $file) 

#4.18
#frees1=$(sed -n '/^\(\s.\)*.*[^A-Za-z0-9_$\*\/]free[\_s]*(.*);/=' $file) 

frees1=$(sed -n '/[^\/\*](\w|\s)*[\s*]free[\_s]*\(.*\);/=' $file)



echo $frees1 

#frees1=$(sed -n '/^[^\/\*].*[^A-Za-z0-9_$]free[\_s]*(/=' $file)
#frees1=$(sed -n '/[^A-Za-z0-9_$\/\*]free[\_s]*(.*[^\*\/]/=' $file)    #// 주석 안걸러짐
#frees1=$(sed -n '/[^A-Za-z0-9_$/*]free[\_s]*(/=' $file)
#frees1=$(sed -n '/[^A-Za-z0-9_$/*]free\s*(/=' $file)

if [ -n "$frees1" ]; then

free=($(echo $frees1 | awk '{split($0, info, " "); for(i = 1; info[i] !=null; i++){ printf("%s ",info[i]);}}'))
	cat $free >> $frees
	index="0"

		while [ -n "${free[$index]}" ]; do		

			#echo original-----${free[$index]}
			add=`expr "$index" "*" 4`
			free[$index]=`expr "${free[$index]}" "+" "$add"`
			#echo modified-----${free[$index]}
			#echo $add
			let index++
		done

	index="0"

	while [ -n "${free[$index]}" ]; do

		
		line=$(sed -n "${free[$index]}p" $file)
		echo $line 

		index1=$(echo `expr index "$line" "$lparen"`)
		index2=$(echo `expr index "$line" "$rparen"`)
 
		####    rest string after free  ####
		rest=$(echo ${line:$index2})
 
		####    variable lentgh         ####
		varlen=`expr "$index2" "-" "$index1" "-" "1"`

		####    variable extraction     ####
		variable=$(echo ${line:$index1:$varlen})

		echo [$index]${free[$index]} : $line  : $variable 
	
        	pfree="\tif($variable < 0x0113 \&\& $variable >= 0xadasd){\n\t\tpos_free($object,$variable)$rest\n\t}else{\n\t\tfree($variable)$rest\n\t}"

		echo -e $pfree
			####	free substitution 	####
        		sed -i "${free[$index]}$s/free.*;/$pfree/" $file
		let index++
			
	done
	echo $index
fi


