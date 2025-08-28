#!/bin/sh

if [ -z $ROS_DISTRO ]; then
    ROS_DISTRO=$(ls /opt/ros/ | grep -v rolling | sort -r | head -n 1)

    if [ -z $ROS_DISTRO ]; then
      if [ -d /opt/ros/rolling ]; then
        ROS_DISTRO=rolling
      else
        echo "ROS_DISTRO not found"
        return
      fi
    fi
    export ROS_DISTRO=$ROS_DISTRO
fi

. /opt/ros/$ROS_DISTRO/setup.sh

set -ex

if [ -z "$INSTALL_TYPE" ]; then
    INSTALL_TYPE="install"
fi

if [ "$INSTALL_TYPE" = "install" ]; then
    DEVEL_PATH="install"
    EXTRA_ARGS="--symlink-install"
fi

if [ -z "$BUILD_TYPE" ]; then
    BUILD_TYPE="RelWithDebInfo"
fi

if [ ! -z "$PACKAGES_SELECT"]; then
    PACKAGES_SELECT="--packages-select $PACKAGES_SELECT"
else
    PACKAGES_SELECT=""
fi

colcon build ${EXTRA_ARGS} $PACKAGES_SELECT --event-handlers console_cohesion+ compile_commands+ \
    --cmake-args -DCMAKE_BUILD_TYPE="$BUILD_TYPE" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
