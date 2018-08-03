#!/bin/bash

while inotifywait -e create /var/lib/cassandra/data/akka/*/; do
  sleep 5
  echo "A new snapshot."
done

