#!/bin/sh

echo "Cleaning up..."

# delete old containers that are stopped but not removed
docker rm $(docker ps -a -q)

# delete old images that are taking up space.
docker rmi $(docker images | grep "0.1." | awk "{print $3}")
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")


