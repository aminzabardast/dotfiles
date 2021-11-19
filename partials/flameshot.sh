#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Flameshot ..."
sudo git clone https://aur.archlinux.org/flameshot-git.git /opt/flameshot
sudo chown -R $USER:$USER /opt/flameshot
cd "/opt/flameshot"
makepkg --noconfirm --needed -si
cd "$HOME/.dotfiles"
mkdir -p "$HOME/.config/autostart"
cp "$PWD/config/autostart/flameshot.desktop" "$HOME/.config/autostart/flameshot.desktop"
