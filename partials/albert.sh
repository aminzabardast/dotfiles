#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Albert ..."
sudo git clone https://aur.archlinux.org/albert.git /opt/albert
sudo chown -R $USER:$USER /opt/albert
cd "/opt/albert"
makepkg --noconfirm --needed -si
cd "$HOME/.dotfiles"
mkdir -p "$HOME/.config/albert"
ln -s "$PWD/config/albert/albert.conf" "$HOME/.config/albert/albert.conf"
ln -s "$PWD/config/albert/last_used_version" "$HOME/.config/albert/last_used_version"
mkdir -p "$HOME/.config/autostart"
cp "$PWD/config/autostart/albert.desktop" "$HOME/.config/autostart/albert.desktop"
