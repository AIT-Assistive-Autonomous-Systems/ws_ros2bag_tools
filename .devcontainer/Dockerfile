ARG VARIANT=rolling-ros-base
FROM ros:${VARIANT}

ARG DEBIAN_FRONTEND=noninteractive

# delete user
RUN userdel -fr $(id -un 1000) || true

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && apt-get install -y \
      python3-pip python3-venv \
      python3-vcstool \
      wget

# # similar to ros-ci / setup-ros install pakcages for testing
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update \
    && apt-get install --no-install-recommends --quiet --yes \
      python3-pip \
      python3-pytest-cov \
      python3-flake8-blind-except \
      python3-flake8-class-newline \
      python3-flake8-deprecated \
      python3-pytest-repeat \
      python3-pytest-rerunfailures \
      ros-dev-tools \
      python3-colcon-coveragepy-result \
      python3-colcon-lcov-result \
      python3-colcon-meson \
      python3-colcon-mixin \
      python3-importlib-metadata \
      libclang-rt-dev

RUN --mount=from=workspace,source=./,target=/ws_dev/src,type=bind \
    --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && rosdep update --rosdistro=${ROS_DISTRO} \
    && rosdep install --from-paths /ws_dev/src --ignore-src -y
