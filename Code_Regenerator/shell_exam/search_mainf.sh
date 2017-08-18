#!/bin/bash
# search_mainf.sh
# 소스 파일에서 main 함수와 main 함수의 첫번째 줄을 찾습니다.


file=susan.c

echo "file name: $file" 

# 주석제거
$(sed -i -r "s/(\/\*(.|\n|\r)*\*\/)|(\/\/.*)/ /" $file)
# main 함수 검색
mainf_line=$(sed -n '/\s*\bmain\b\s*(.*/p' $file)


if [ -n "$mainf_line" ]
then
	curly=$(echo $mainf_line | sed -n -e '/{/p')
	echo "curly: $curly"
	line=$(sed -n '/\s*\bmain\b\s*(.*/=' $file)
	echo "line: $line"
		while [ -z "$curly" ]; do
			line=`expr "$line" "+" "1"`
			curly=$(sed -n $line'p' $file | sed -n -e '/{/p')
		done
	echo "curlies of main func start at: $line"

fi

