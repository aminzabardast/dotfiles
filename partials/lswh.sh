#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing lshw ..."
sudo pacman --noconfirm --needed -S lshw