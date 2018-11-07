#!/bin/bash

# clear out everything first
#rm -rf build install log

export TOOLCHAIN_PREFIX=arm-linux-gnueabih


colcon \
    build \
    --merge-install
    --cmake-force-configure \
    --cmake-args \
    -DCMAKE_TOOLCHAIN_FILE=`pwd`/rpi3_toolchainfile.cmake \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DTHIRDPARTY=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DEIGEN3_INCLUDE_DIR="${CMAKE_SYSROOT}/usr/include/eigen3" \
    -DEigen3_DIR="${CMAKE_SYSROOT}/usr/lib/cmake/eigen3" \
    -DCURL_INCLUDE_DIR="${CMAKE_SYSROOT}/usr/include/${TOOLCHAIN_PREFIX}" \
    -DCURL_LIBRARY="${CMAKE_SYSROOT}/usr/lib/${TOOLCHAIN_PREFIX}/libcurl.so"

