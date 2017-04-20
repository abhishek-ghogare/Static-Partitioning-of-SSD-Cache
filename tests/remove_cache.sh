umount /dev/mapper/home-cached
dmsetup table home-cached
dmsetup status home-cached
dmsetup suspend home-cached
dmsetup remove home-cached
dmsetup remove ssd-metadata
dmsetup remove ssd-blocks
