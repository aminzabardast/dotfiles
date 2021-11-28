#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Albert ..."
sudo git clone https://aur.archlinux.org/googler.git /opt/googler
sudo chown -R $USER:$USER /opt/googler
cd "/opt/googler"
makepkg --noconfirm --needed -si
