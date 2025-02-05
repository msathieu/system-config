#!/bin/sh
mesg n
unset HISTFILE
export LESSHISTFILE=-
if [ -f /usr/bin/vim ]; then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export PATH="$PATH:~/.local/bin"
