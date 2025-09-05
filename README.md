# Workspace template
This is a workspace template for [ros2bag_tools](https://github.com/AIT-Assistive-Autonomous-Systems/ros2bag_tools).

It allows you to run and debug tests and provides tasks to generate the `.env` file for the python tools as well as a bash or zsh profile to run within the ROS environment.

# Building

This is an ordinary [ROS workspace](https://docs.ros.org/en/rolling/Tutorials/Beginner-Client-Libraries/Creating-A-Workspace/Creating-A-Workspace.html). [Clone repos](https://docs.ros.org/en/rolling/Installation/Maintaining-a-Source-Checkout.html) and source your desired ROS distro environment:

```sh
# ROS needs to be installed
vcs import [-w 1] --recursive src < src/ros2.repos
source /opt/ros/<ROS_DISTRO>/setup.<shext>
# install deps if necessary
sudo apt-get update
rosdep update --rosdistro=$ROS_DISTRO 
rosdep install --from-paths src -i -y
./build.sh
source install/setup.<shext>
```

You may also use the devcontainer and vscode. If you are not using a devcontainer you must make sure your `ROS_DISTRO` env var is set to or autodetect in the workspace scripts will choose some installed distro in `/opt/ros`, preferring a non-rolling distro currently. You can set the environment either in vscode or devcontainer settings or source your distro before opening vscode. You can adapt it anyway you like.

# Devcontainer

For ease of use a devcontainer has been provided. After the devcontainer is up you may either run manual tasks using the provided shell profiles or use [predefined tasks](.vscode/tasks.json). For vscode extensions to correctly work the `source ros` task must be executed once at will also build the workspace and provide the `.env` file.

# Testing

You may use the auto discovered tests to run them manually or debug them or you may run the test script or task.
