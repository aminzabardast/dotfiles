#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Setting up Gnome ..."
sudo pacman --noconfirm --needed -S gnome gnome-extra gnome-shell-extension-appindicator libappindicator-gtk2 libappindicator-gtk3

cecho "RED" "Enabling GDM ..."
sudo systemctl enable gdm

cecho "RED" "Enabling Extentions ..."
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
