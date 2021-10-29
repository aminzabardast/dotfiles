#!/bin/sh
echo "Updating Packages ..."
sudo pacman --noconfirm -Suy
echo "Installing Necessary Packages ..."
sudo pacman --noconfirm -S xorg xorg-xinit arandr bspwm sxhkd dmenu feh picom firefox rxvt-unicode openssh

# Setting Up BSPWM
echo "Setting up BSPWM ..."
mkdir $HOME/.config
mkdir $HOME/.config/bspwm
mkdir $HOME/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc $HOME/.config/bspwm/bspwmrc
cp /usr/share/doc/bspwm/examples/sxhkdrc $HOME/.config/sxhkd/sxhkdrc

# Setting up .xinit
echo "Setting up .xinitrc ..."
cp xinitrc $HOME/.xinitrc
echo "setxkbmap us &\npicom -f &\nexec bspwm" >> $HOME/.xinitrc
