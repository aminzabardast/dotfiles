#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Albert ..."
sudo git clone https://aur.archlinux.org/albert.git /opt/albert
sudo chown -R $USER:$USER /opt/albert
cd /opt/albert
makepkg --noconfirm --needed -si
cp "config/albert" "$HOME/.config/albert"
mkdir -p "$HOME/.config/autostart"
cp "config/autostart/albert.desktop" "$HOME/.config/autostart/albert.desktop"
