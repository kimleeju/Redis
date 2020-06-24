unset GREP_OPTIONS
if [[ $@ == 'yes' ]] ; then
	make distclean
	make USE_NVM=yes -j 20
fi
rm -rf /home/oslab/ext4-pmem1/redis-port-6379-1GB-AEP
rm -rf dump.rdb
rm -rf appendonly.aof
./src/redis-server failover/slave_0.conf --nvm-maxcapacity 1 --nvm-dir /home/oslab/ext4-pmem1
