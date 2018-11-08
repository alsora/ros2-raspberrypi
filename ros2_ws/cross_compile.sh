#!/bin/bash

# clear out everything first
#rm -rf build install log

export TOOLCHAIN_PREFIX=arm-linux-gnueabih


colcon \
    build \
    --merge-install \
    --cmake-force-configure \
    --cmake-args \
    -DCMAKE_TOOLCHAIN_FILE=`pwd`/rpi3_toolchainfile.cmake \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DTHIRDPARTY=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DPYTHON_SOABI="cpython-35m-arm-linux-gnueabihf"

