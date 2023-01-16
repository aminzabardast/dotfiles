#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Polybar ..."
#sudo git clone https://aur.archlinux.org/polybar.git /opt/polybar
#sudo chown -R $USER:$USER /opt/polybar
#cd "/opt/polybar"
#makepkg --noconfirm --needed -si
sudo pacman -S polybar
cd "$HOME/.dotfiles"
mkdir -p "$HOME/.config/polybar"
ln -s "$PWD/config/polybar/config" "$HOME/.config/polybar/config"
ln -s "$PWD/config/polybar/launch.sh" "$HOME/.config/polybar/launch.sh"
