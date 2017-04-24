dmsetup create ssd-metadata --table '0 10752 linear /dev/sdb 0'
dd if=/dev/zero of=/dev/mapper/ssd-metadata
#dmsetup create ssd-blocks --table '0 41932288 linear /dev/sdb 10752'
dmsetup create ssd-blocks --table '0 419322 linear /dev/sdb 10752'
dmsetup create home-cached --table '0 209715200 cache /dev/mapper/ssd-metadata /dev/mapper/ssd-blocks /dev/sdc 512 1 writeback default 2 migration_threshold 204800000'
#echo y | mkfs.ext4 /dev/mapper/home-cached
mount /dev/mapper/home-cached /mnt/cache

echo "12" > /proc/smqp_file_track_list
echo "15" > /proc/smqp_file_track_list

cat /proc/smqp_file_track_list


