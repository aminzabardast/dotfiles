#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Tmux ..."
sudo pacman --noconfirm --needed -S tmux

