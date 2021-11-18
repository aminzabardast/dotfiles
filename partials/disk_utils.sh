#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Disk Utils ..."
sudo pacman -S duf ncdu udisks2
