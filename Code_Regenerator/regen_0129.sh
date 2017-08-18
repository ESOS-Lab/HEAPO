#	Code Regenerator
#	Author: Seongsu Lee(su880214@hanyang.ac.kr)
#	Embedded Software System Laboratory, Hanyang University
#!/bin/bash

argc=$#
argv0=$0
argv1=$1 #option

ERROR_CODE=444
SUCCESS=777
ERROR="error.msg"
ERROR_MSG=

# if there is no bashshell on current system, it returns with error code
system=$(cat /etc/issue)
[ ! -e /bin/bash ] && echo -e "bash not found in $system" && exit $ERROR_CODE

profile_file="heapo_gen_result.csv"
# if the result file does not exist in current path, returs with error code
[ ! -e $PWD/$profile_file ] && echo -e "$profile_file not found" && exit $ERROR_CODE

# sorting list entry
cat $profile_file | sort > tmp
cat tmp > $profile_file
rm tmp

# get current directory name 
dir=($(pwd | awk '{split($0, info, "/"); for(i = 2; info[i] != null; i++){  } printf("\n%s\n",info[i-1]);}'))	

#### 	object name		####
object=("\""$dir"_obj\"")

#### 	pos_create		####
pcreate="{\n\tif(pos_create($object) < 1){ \n\t\tif(pos_map($object) < 1){\n\t\t\treturn 0;\n\t\t} \n\t}\n\t}"

#### 	pos-lib.h		####
phead="#include \"pos-lib.h\""

#### 	pos_malloc  		####
pmalloc="pos_malloc($object, size)"

#### 	POS AREA region		####
pos_start="0x5FFEF8000000"
pos_end="0x7FFEF8000000"

pos_var="__attribute__ ((section(\"POS\")))"

#### 	sed variables		####
s="s"
entry=1
index="1"
add="0"
p="p"

gv_cnt=0 
hp_cnt=0 
free_cnt=0
line_cnt=0
files_pheader=()

substitute_global(){

	tokens=$1 
								####	tokens[0] = variable identifier	####
	file_name=(${tokens[1]})	####	tokens[1] = file name ####
	line_number=(${tokens[2]})	####	tokens[2] = line number	#### 
	var_name=(${tokens[3]})		####	tokens[3] = variable name	#### 
	# +-----------+--------------------------------------------------------+ 
	# | original  | int array[10], a;               					   |
	# +-----------+--------------------------------------------------------+	
	# | final     | int array[10] __attribute__ ((section(POS))), a;	   |
	# +-----------+--------------------------------------------------------+

	####	global variagle substitution ####	
	sed -i -r "$line_number's'/($var_name\s*(\[.*\])?)/\1 $pos_var /" $file > $ERROR 2>&1
	ERROR_MSG=$(cat $ERROR)

	if [ -z "$ERROR_MSG" ]; then 
			return $SUCCESS
	else 
			return $ERROR_CODE
	fi

}

substituete_heap(){

	tokens=$1 
								####	tokens[0] = variable identifier	####
	file_name=(${tokens[1]})	####	tokens[1] = file name ####
	line_number=(${tokens[2]})	####	tokens[2]= line number	#### 
	# +-----------+--------------------------------------------------------+ 
	# | original  | pi = (int *)malloc(sizeof(int)*1024);    			   |
	# +-----------+--------------------------------------------------------+	
	# | final     | pi = (int *)pos_malloc("obj_name", sizeof(int)*1024);  |
	# +-----------+--------------------------------------------------------+

	####	malloc substitution ####	
	sed -i -r "$line$s/malloc\((.*)\)/pos_malloc($object, \1)/" $file > $ERROR 2>&1
	ERROR_MSG=$(cat $ERROR)

	if [ -z "$ERROR_MSG" ]; then 
			return $SUCCESS
	else 
			return $ERROR_CODE
	fi

}

add_phead_list(){

	file=$1
	phead_flag=0	
	for file_ in $files_pheader 
	do
 		if [ $file_ = $file ]; then
			phead_flag=1		
		fi
	done
			
	if [ $phead_flag -eq 1 ]; then
		files_pheader[${#files_pheader[*]}]=$file
	fi

}

# make a list of source files in current directory and sub directories
find `pwd` -name "*.c" -print > files.regen
find `pwd` -name "*.cpp" -print >> files.regen

# get a first file from the list
file=$(sed -n '1p' files.regen)

index=1
record=$(sed -n $index'p' $profile_file)

while [ -n "$record" ]; do

	columns=($(echo $record | awk '{split($0, info, ":"); for(i = 0; info[i] !=null; i++){ printf("%s ",info[i]);}}'))
	pheader_flag=0

	if [ ${columns[0]}  = "global" ]; then 
		substitute_global $columns
		return_var=$?

		if [ "$return_var" -eq "$SUCCESS" ]; then
			let gv_cnt++
			let line_cnt++
			add_phead_list ${columns[1]}

		elif [ "$retrun_var" -eq "$ERROR_CODE" ]; then
			echo "${columns[1]}: ${columns[2]}: Code generating error: can't generate $pos_var for ${columns[3]}"
			exit $ERROR_CODE
		else 
			echo "${columns[1]}: ${columns[2]}: Unexpected error: $return_var"
			exit $ERROR_CODE
		fi

	elif [ ${columns[0]} = "heap" ]; then 
		substitue_heap $columns
		return_var=$?

		if [ "$return_var" -eq "$SUCCESS" ];
		then

			let hp_cnt++
			let line_cnt++
			add_phead_list ${columns[1]}

		elif [ "$retrun_var" -eq "$ERROR_CODE" ]; then
				echo "${columns[1]}: ${columns[2]}: Code generating error: can't generate $pmalloc for mallco()"
			exit $ERROR_CODE
		else 
			echo "${columns[1]}: ${columns[2]}: Unexpected error: $return_var"
			exit $ERROR_CODE
		fi
	else
		echo "${columns[1]}: ${columns[2]}: Unexpected error: $return_var"
		exit $ERROR_CODE	
	fi

	let index++
	record=$(sed -n $index'p' $profile_file)

done

file=$(sed -n $entry'p' files.regen)

####	tour all files		####
while [ -n "$file" ]; do

	### delete comments in the file
	sed -i -r "s/(\/\*(.|\n|\r)*\*\/)|(\/\/.*)/ /" $file

	####	lookup main		####
	mainf_line=$(sed -n '/\s*\bmain\b\s*(.*/p' $file)
	
	if [ -n "$mainf_line" ]; then

		# get the line number where main func starts
		curly=$(echo $mainf_line | sed -n -e '/{/p')
		line=$(sed -n '/\s*\bmain\b\s*(.*/=' $file)

		# look up each line for curly bracket
		while [ -z "$curly" ]; do
			
			line=`expr $line + 1`	
			curly=$(sed -n $line'p' $file | sed -n -e '/{/p')
		done

		# insert pos_create at the start line of main func	
		sed -i "$line'p'/{/$pcreate/" $file
					
		line_cnt=`expr $line_cnt + 7`
		add_phead_list $file

	fi

	frees1=$(sed -n '/^\(\s.\)*.*[^A-Za-z0-9_$\*\/]free[\_s]*(.*);/=' $file)
	
	if [ -n "$frees1" ]; then 
		free=($(echo $frees1 | awk '{split($0, info, " "); for(i = 1; info[i] !=null; i++){ printf("%s ",info[i]);}}'))
			
		index="0"

		while [ -n "${free[$index]}" ]; do	
	
			add=`expr "$index" "*" 6` # added line number
			free[$index]=`expr "${free[$index]}" "+" "$add"`
			let index++
		done
		
		index="0"
	
		while [ -n "${free[$index]}" ]; do


        		#echo get sing free line
        		line=$(sed -n "${free[$index]}p" $file)
				
        		####    parenthesis extraction  ####
        		index1=$(echo `expr index "$line" "\("`)
        		index2=$(echo `expr index "$line" "\)"`)

			####	rest string after free	####
			rest=$(echo ${line:$index2})

        		####    variable lentgh 	####
        		varlen=`expr "$index2" "-" "$index1" "-" "1"`

        		####    variable extraction     ####
        		variable=$(echo ${line:$index1:$varlen})

        		####    pos_free  string        ####
        		pfree="\t{\n\t\tif($variable < $pos_end \&\& $variable >= $pos_start){\n\t\t\tpos_free($object,$variable)$rest\n\t\t}else{\n\t\t\tfree($variable)$rest\n\t\t}\n\t}"

				####	free substitution 	####
        		sed -i "${free[$index]}$s/free.*;/$pfree/" $file > $ERROR 2>&1
				ERROR_MSG=$(cat $ERROR)

				if [ -z "$ERROR_MSG" ]; then
						exit $ERROR_CODE
				else
					line_cnt=`expr $line_cnt + 7`
				fi
        		let index++

		done

		add_phead_list $file

	fi


done


for file_ in $files_pheader 
do
	first_line=$(sed -n 1'p' $file_)

	if ["$first_line" != "$pheade" ]; then

		touch temp.regen
		echo $phead | cat > temp.regen
		cat $file_ >> temp.regen
		rm $file_
		mv temp.regen $file_
	fi

done

############################################
### print regen info
echo "[modified files]"
for file_ in $files_pheader
do
	echo $file_
done
###########################################
