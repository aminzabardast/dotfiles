#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Free Download Manager ..."
sudo git clone https://aur.archlinux.org/freedownloadmanager.git /opt/fdm
sudo chown -R $USER:$USER /opt/fdm
cd "/opt/fdm"
makepkg --noconfirm --needed -si
cd "$HOME/.dotfiles"
mkdir -p "$HOME/.config/autostart"
cp "$PWD/config/autostart/FDM.desktop" "$HOME/.config/autostart/FDM.desktop"
