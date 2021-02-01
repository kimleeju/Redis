unset GREP_OPTIONS
pid=$(ps -ef | grep "redis" | grep "3000" | awk '{print $2}') 
kill -9 $pid
pid=$(ps -ef | grep "redis" | grep "3001" | awk '{print $2}')
kill -9 $pid
pid=$(ps -ef | grep "redis" | grep "3002" | awk '{print $2}')
kill -9 $pid
pid=$(ps -ef | grep "redis" | grep "3003" | awk '{print $2}')
kill -9 $pid
pid=$(ps -ef | grep "redis" | grep "3100" | awk '{print $2}')
kill -9 $pid

cp 3000_bak.conf 3000.conf
cp 3001_bak.conf 3001.conf
cp 3002_bak.conf 3002.conf
cp 3003_bak.conf 3003.conf
cp sentinel_0_bak.conf sentinel_0.conf

find / -name "*dump.rdb" -exec rm {} \;
find / -name "*appendonly.aof" -exec rm {} \;
#rm -rf /dev/pmem1/redis-port-7001-1GB-AEP
#rm -rf /dev/pmem1/redis-port-7002-1GB-AEP
#rm -rf /dev/pmem1/redis-port-7000-1GB-AEP

../src/redis-sentinel sentinel_0.conf &

../src/redis-server 3000.conf &

../src/redis-server 3001.conf & 

#../src/redis-server 3002.conf &
#../src/redis-server 3003.conf &
#/home/ljkim/redis_switch_master/pmem-redis-test/src/redis-server /home/ljkim/redis_switch_master/pmem-redis-test/KLJ/3001.conf
#/home/ljkim/redis_switch_master/pmem-redis-test/src/redis-server /home/ljkim/redis_switch_master/pmem-redis-test/KLJ/3000.conf
