#!/bin/bash

# /etc/ld.so.conf includes using a regex all the files inside ros2-raspbian-rootfs/etc/ld.so.conf.d
# the regex does not work when cross-compiling, so manually include all the files

# clear the file
 > ros2-raspbian-rootfs/etc/ld.so.conf

# copy included files
for filename in ros2-raspbian-rootfs/etc/ld.so.conf.d/*; do
    #echo "FILE IS: ${filename}"
    cat ${filename} >> ros2-raspbian-rootfs/etc/ld.so.conf
done
