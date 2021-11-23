#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Icons ..."
sudo git clone https://aur.archlinux.org/numix-icon-theme-git.git "/opt/numix-icon-theme-git"
sudo chown -R $USER:$USER "/opt/numix-icon-theme-git"
cd "/opt/numix-icon-theme-git"
makepkg --noconfirm --needed -si
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
dconf load /org/gnome/desktop/interface/ < org.gnome.desktop.interface.conf

cecho "RED" "Setting Background ..."
ln -sf "$PWD/wallpapers/bg1.png" "$HOME/.config/background"

echo "[/]
color-shading-type='solid'
picture-options='zoom'
picture-uri='$HOME/.config/background'
primary-color='#000000000000'
secondary-color='#000000000000'
" > /tmp/org.gnome.desktop.background.dconf
dconf load /org/gnome/desktop/background/ < /tmp/org.gnome.desktop.background.conf
