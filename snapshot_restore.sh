#!/bin/bash

BPATH=/var/lib/backups-cassandra

if [ "$1" != "" ]; then
	SNAPSHOT=$1

	if [ -e $BPATH/$SNAPSHOT.tar.bz2 ]; then
		echo "Restoring snapshot $SNAPSHOT"

		bzcat $BPATH/$SNAPSHOT.tar.bz2|tar xf -
		DIRS=`/usr/bin/find /var/lib/cassandra/data/*/* -maxdepth 0 -type d`

		for i in $DIRS; do
  		echo -- $i
  		find ${i}  -path "*/snapshots/$SNAPSHOT/*" -type f -exec bash -c "mv {} $i" \;
		done
	else
		exit 1
	fi
else
	exit 1
fi
