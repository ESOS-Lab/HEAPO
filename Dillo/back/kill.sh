pid=2058
times=5
while [ $times -lt 10 ];
do
echo "times = $times, $times,pid = $pid"
kill -KILL $pid
times=$(($times+1))
pid=$(($pid+1))
done

