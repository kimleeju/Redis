data="1000 2500 5000 10000 25000 50000 100000"
data="10000"


NDIR=`mount | grep pmem1 | awk '{print $3}' | tail -n 1`
echo $NDIR

for i in $data;do
#redis-benchmark -d "$i" -q -t get,set,lpush,lpop,sadd,spop > result/"$@"_redis_"$i"
	redis-benchmark -d "$i" -q -t --nvm-dir $NDIR  set> result/redis_"$i"_"$@"
done
