#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing WMName ..."
sudo pacman --noconfirm --needed -S wmname

