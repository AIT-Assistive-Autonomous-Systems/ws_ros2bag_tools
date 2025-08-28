#!/usr/bin/env zsh
SCRIPTPATH="${0:a:h}"
ext=".zsh"

export OLD_ZDOTDIR=${OLD_ZDOTDIR:-$HOME}

if [[ -o login && -f $OLD_ZDOTDIR/.zprofile ]]; then
    source $OLD_ZDOTDIR/.zprofile
fi

if [[ -o interactive && -f $OLD_ZDOTDIR/.zshrc ]]; then
    source $OLD_ZDOTDIR/.zshrc
fi

if [[ -o login && -f $OLD_ZDOTDIR/.zlogin ]]; then
    source $OLD_ZDOTDIR/.zlogin
fi

export HISTFILE=${WS_HISTFILE:-${HISTFILE:-}}
