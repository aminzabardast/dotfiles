#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Albert ..."
git clone https://aur.archlinux.org/albert.git /opt/albert
sudo chown -R $USER:$USER /opt/albert
cd /opt/albert
makepkg -si
