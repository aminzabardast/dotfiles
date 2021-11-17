#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing fzf ..."
sudo pacman --noconfirm --needed -S fzf
