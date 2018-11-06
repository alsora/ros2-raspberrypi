# ros2-raspberrypi
Docker environment for cross compiling ROS2 Bouncy for Raspberry Pi


## Usage

##### Get a RaspberryPi Raspbian Stretch sysroot.

You can copy your own or create one with the provided script

    $ bash create_sysroot.sh

If you want to add a specific dependency, you can do it in `Dockerfile_sysroot`.

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

This last command will mount the ros2_ws directory as a volume. You will find the built SDK inside that folder.
