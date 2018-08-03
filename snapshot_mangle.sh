#!/bin/bash

/usr/bin/find /var/lib/backups-cassandra/*.tar.bz2 -mtime +2 -exec rm {} \;

NOW=`date +%Y%m%d%H%M%S`
/usr/bin/find /var/lib/cassandra/data/*/*/snapshots -type f > ./file_list
/bin/tar --create --file /var/lib/backups-cassandra/$NOW.tar.bz2 --bzip2 --files-from ./file_list
echo "Created tarfile /var/lib/backups-cassandra/$NOW.tar.bz2"
