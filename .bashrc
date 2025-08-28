#!/usr/bin/env bash
SCRIPTPATH="$( cd -- "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 ; pwd -P )"
ext=".bash"


if [ -f /etc/profile ]; then
    source /etc/profile
elif [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

if [ -f $HOME/.profile ]; then
    source $HOME/.profile
elif [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

source $SCRIPTPATH/.vscrc
export HISTFILE=${WS_HISTFILE:-${HISTFILE:-}}
