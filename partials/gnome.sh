#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "<><><> Setting up Gnome ..."
sudo pacman --noconfirm --needed -S gnome gnome-extra

cecho "RED" "<><><> Enabling GDM ..."
sudo systemctl enable gdm
