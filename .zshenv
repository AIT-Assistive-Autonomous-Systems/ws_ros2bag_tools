#!/usr/bin/env zsh
SCRIPTPATH="${0:a:h}"
ext=".zsh"

export OLD_ZDOTDIR=${OLD_ZDOTDIR:-$HOME}

if [ -f $OLD_ZDOTDIR/.zshenv ]; then
    source $OLD_ZDOTDIR/.zshenv
fi

source $SCRIPTPATH/.vscrc

# in rolling seems not to be enabled after sourcing zsh
eval "$(register-python-argcomplete ros2)"
eval "$(register-python-argcomplete colcon)"
