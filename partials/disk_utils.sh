#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Disk Utils ..."
sudo pacman --noconfirm --needed -S duf ncdu udisks2
