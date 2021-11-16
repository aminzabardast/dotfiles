#!/bin/sh
echo "Updating Packages ..."
sudo pacman --noconfirm --needed -Suy
echo "Installing Necessary Packages ..."
sudo pacman --noconfirm --needed -S xorg xorg-xinit arandr bspwm sxhkd dmenu feh picom firefox rxvt-unicode openssh

