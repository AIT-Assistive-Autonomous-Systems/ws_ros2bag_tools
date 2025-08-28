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

if [ ! -z "$PACKAGES_SELECT"]; then
    PACKAGES_SELECT="--packages-select $PACKAGES_SELECT"
else
    PACKAGES_SELECT=""
fi

colcon test --event-handlers console_direct+ console_cohesion+ $PACKAGES_SELECT
