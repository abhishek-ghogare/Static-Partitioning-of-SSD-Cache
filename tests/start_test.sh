#!/bin/bash

#while [ `dmsetup status /dev/mapper/home-cached | awk '{print $7}' | tr '/' ' ' | awk '{print $1}'` -ne 818 ]
#do
	#dd of=/dev/null if=/mnt/cache/fro1 bs=`echo 512*512 | bc` count=400 skip=3000 #iflag=direct
	sync && echo 1 > /proc/sys/vm/drop_caches
	#dd of=/dev/null if=/mnt/cache/fro2 bs=`echo 512*512 | bc` count=400 skip=3000 #iflag=direct
	sync && echo 1 > /proc/sys/vm/drop_caches
#done


# 10G = 40960 blocks
#RANGE=40960
RANGE=2000
count=40
let "RANGE -= $count"

for i in {1..200}
do
	number=$RANDOM
	let "number %= $RANGE"

	sync && echo 1 > /proc/sys/vm/drop_caches 
	dd of=/dev/null if=/mnt/cache/fro1 bs=`echo 512*512 | bc` count=$count skip=$number
	sync && echo 1 > /proc/sys/vm/drop_caches
	dd of=/dev/null if=/mnt/cache/fro2 bs=`echo 512*512 | bc` count=$count skip=$number
	sync && echo 1 > /proc/sys/vm/drop_caches
done
