set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
set(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc-6)
set(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++-6)

set(CMAKE_SYSROOT /root/rootfs)


set(CMAKE_FIND_ROOT_PATH
  /root/ros2_ws/install
)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#set(CMAKE_BUILD_RPATH /root/rootfs/opt/vc)


# This assumes that pthread will be available on the target system
# (this emulates that the return of the TRY_RUN is a return code "0"
set(THREADS_PTHREAD_ARG "0"
  CACHE STRING "Result from TRY_RUN" FORCE)


