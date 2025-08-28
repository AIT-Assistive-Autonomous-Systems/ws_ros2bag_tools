# Workspace template
This is a workspace template for [ros2bag_tools](https://github.com/AIT-Assistive-Autonomous-Systems/ros2bag_tools).

It allows you to run and debug tests and provides tasks to generate the `.env` file for the python tools as well as a bash or zsh profile to run within the ROS environment.

# Usage

For ease of use a devcontainer has been provided. After the devcontainer is up you may either run manual tasks using the provided shell profiles or use predefined tasks. For vscode extensions to correctly work the `source ros` task must be executed once at will also build the workspace and provide the `.env` file.

# Testing

You may use the auto discovered tests to run them manually or debug them or you may run the test script or task. Be sure to compile your 
