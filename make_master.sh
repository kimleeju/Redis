unset GREP_OPTIONS
if [[ $@ == 'yes' ]] ; then
	make distclean
	make -j 20
fi
rm -rf /home/oslab/ext4-pmem1/redis-port-6379-1GB-AEP
rm -rf dump.rdb
rm -rf appendonly.aof
#./src/redis-server
