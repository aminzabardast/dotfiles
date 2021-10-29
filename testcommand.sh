#!/bin/sh
echo "Updating Packages ..."
sudo pacman -Suy
echo "Installing Necessary Packages ..."
sudo pacman -S xorg xorg-xinit arandr bspwm sxhkd dmenu feh picom firefox rxvt-unicode

# Setting Up BSPWM
echo "Setting up BSPWM ..."
mkdir ~/.config
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Setting up .xinit
echo "Setting up .xinitrc ..."
cp /etc/X11/xinit/xinitrc ~/.xinitrc
