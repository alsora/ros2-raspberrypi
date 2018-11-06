#!/bin/bash

echo "Build Docker image"

docker build -t rpi3_cross_compile -f Dockerfile_cross_compile .


docker run -it \
  --volume $PWD/ros2-raspbian-rootfs:/root/rootfs \
  --volume $PWD/ros2_ws:/root/ros2_ws \
  -w /root/ros2_ws \
  rpi3_cross_compile \
  bash cross_compile.sh
