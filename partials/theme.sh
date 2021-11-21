#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Icons ..."
sudo git clone https://aur.archlinux.org/numix-circle-icon-theme-git.git "/opt/numix-circle-icon-theme-git"
sudo chown -R $USER:$USER "/opt/numix-circle-icon-theme-git"
cd "/opt/numix-circle-icon-theme-git"
makepkg --noconfirm --needed -si

cecho "RED" "Installing Theme ..."
sudo git clone https://aur.archlinux.org/whitesur-gtk-theme-git.git "/opt/whitesur-gtk-theme-git"
sudo chown -R $USER:$USER "/opt/whitesur-gtk-theme-git"
cd "/opt/whitesur-gtk-theme-git"
makepkg --noconfirm --needed -si

cd "$HOME/.dotfiles"
#dconf write /org/gnome/desktop/interface/ dconf.conf
