#!/bin/bash

./remove_cache.sh

cp /home/thor/Documents/linux-4.9/drivers/md/dm-cache.ko /lib/modules/4.9.0/kernel/drivers/md/
cp /home/thor/Documents/linux-4.9/drivers/md/dm-cache-smq.ko /lib/modules/4.9.0/kernel/drivers/md/
modprobe -r dm-cache-smq
modprobe -r dm-cache
modprobe dm-cache
modprobe dm-cache-smq

./setup_cache.sh

