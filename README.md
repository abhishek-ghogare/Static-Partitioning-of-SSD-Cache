Implementation of Static Partitioning of SSD Cache
==================================================

### Motivation

A program spends most of time performing the disk I/O. Although RAM is a faster device, its interaction with HDD kills its performance. Since HDD's are cheaper storage devices for storing a large amount of data, it cannot be replaced completely with much costlier SSD's. Therefore SSD's are nowadays increasingly used as caches for HDD's for improving the I/O performance. 

SSD cache is a shared resource. When multiple processes or files are sharing this cache, all processes may not get adequate amount of cache according to their needs. Therefore there is a need to support cache-partitioning, so that each process gets its share of cache. We aim to partition the SSD cache based on the files being used by the processes, so that every process gets fair share of the cache and improve overall performance of the system.


### Execution Flow
Following diagram shows the existing execution flow of SMQ policy. The coloured elements shows our modifications to the policy.

![alt text](https://github.com/avg598/Static-Partitioning-of-SSD-Cache/blob/master/flow_diag_changes.svg "Flow diagram")
