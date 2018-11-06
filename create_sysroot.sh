#!/bin/bash


echo "Build Docker image"

docker build -t raspbian -f Dockerfile_sysroot .

echo "Remove old Docker containers"

docker kill ros2-raspbian

docker rm ros2-raspbian

echo "Create new Docker container"

docker create --name ros2-raspbian raspbian

#docker run -t \
#  --name ros2-raspbian \
#  raspbian \
#  bash

echo "Exporting Docker container..."

if [ -d ros2-raspbian-rootfs.tar ]; then
    rm ros2-raspbian-rootfs.tar
fi


docker container export -o ros2-raspbian-rootfs.tar ros2-raspbian

docker rm ros2-raspbian

echo "Uncompress sysroot..."

chmod 777 ros2-raspbian-rootfs.tar

if [ -d ros2-raspbian-rootfs ]; then
    chmod 777 ros2-raspbian-rootfs
    rm -rf ros2-raspbian-rootfs
fi



mkdir ros2-raspbian-rootfs

tar -xf ros2-raspbian-rootfs.tar -C ros2-raspbian-rootfs lib opt usr
