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
RANGE1=200000
RANGE2=1000
count=10
let "RANGE1 -= $count"
let "RANGE2 -= $count"

for i in {1..200}
do
	number1=$RANDOM
	let "number1 %= $RANGE1"
	number2=$RANDOM
	let "number2 %= $RANGE2"

	sync && echo 1 > /proc/sys/vm/drop_caches 
	dd of=/dev/null if=/mnt/cache/fro1 bs=`echo 512*512 | bc` count=$count skip=$number1
	sync && echo 1 > /proc/sys/vm/drop_caches
	dd of=/dev/null if=/mnt/cache/fro2 bs=`echo 512*512 | bc` count=$count skip=$number2
	sync && echo 1 > /proc/sys/vm/drop_caches
	dd of=/dev/null if=/mnt/cache/fro3 bs=`echo 512*512 | bc` count=$count skip=$number2
	sync && echo 1 > /proc/sys/vm/drop_caches
done
