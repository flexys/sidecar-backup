#!/bin/sh

while inotifywait -e create /var/lib/cassandra/data/akka/*/; do
  sleep 5
  NOW=`date +%Y%m%d%H%M%S`
  /usr/bin/find /var/lib/cassandra/data/*/*/snapshots -type f > ./file_list
  /bin/tar cf /var/lib/backups-cassandra/$NOW.tar --files-from ./file_list
  echo "Created tarfile /var/lib/backups-cassandra/$NOW.tar"
done

