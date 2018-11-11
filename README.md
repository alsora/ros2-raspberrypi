# ros2-raspberrypi
Docker environment for cross compiling ROS2 Bouncy for Raspberry Pi


## Build instructions

##### Get a RaspberryPi Raspbian Stretch sysroot.

    $ bash create_sysroot.sh
    
If you want to add a specific dependency, you can do it in `Dockerfile_sysroot`.

If you already have your own sysroot, you can use it. You only have to rename it `ros2-raspbian-rootfs`.
If you experience any build issue, try again using the sysroot created by the provided bash script.

##### Get the ROS2 sources

    $ cd ros2_ws
    $ mkdir src
    $ wget https://raw.githubusercontent.com/ros2/ros2/release-latest/ros2.repos
    $ vcs import src < ros2.repos


##### Ignore some packages

    $ touch \
        src/ros2/ros1_bridge/COLCON_IGNORE \
        src/ros2/rviz/COLCON_IGNORE \
        src/ros2/urdfdom/COLCON_IGNORE \
        src/ros2/urdf/COLCON_IGNORE \
        src/ros2/kdl_parser/COLCON_IGNORE \
        src/ros/resource_retriever/COLCON_IGNORE \
        src/ros2/robot_state_publisher/COLCON_IGNORE \
        src/ros2/demos/COLCON_IGNORE


##### Cross-compile ROS2 Bouncy

    $ cd ..
    $ bash build_ros2_raspberry.sh

This last command will mount the ros2_ws directory as a volume. You will find the compiled SDK inside that folder.


## Usage

##### Copy the SDK to the Raspberry

    $ rsync -avz -e 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null' --progress ros2_ws/install pi@192.168.0.147:/home/pi/ros2_bouncy_sdk

Check the IP address of your Raspberry Pi and the path where you want to copy the SDK.

##### Source ROS2 SDK

    $ export COLCON_CURRENT_PREFIX=/home/pi/ros2_bouncy_sdk/install
    $ source /home/pi/ros2_bouncy_sdk/install/setup.sh

##### Run publisher node

    $ ros2 run examples_rclcpp_minimal_publisher publisher_lambda


## Missing features

 - `libc6.so` error when building packages depending on `vc` and `libmmal`
