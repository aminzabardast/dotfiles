#!/bin/sh
echo "Updating Packages ..."
sudo su
pacman --noconfirm -Suy
echo "Installing Necessary Packages ..."
pacman --noconfirm -S xorg xorg-xinit arandr bspwm sxhkd dmenu feh picom firefox rxvt-unicode openssh

# Setting Up BSPWM
echo "Setting up BSPWM ..."
mkdir $HOME/.config
mkdir $HOME/.config/bspwm
mkdir $HOME/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc $HOME/.config/bspwm/bspwmrc
cp /usr/share/doc/bspwm/examples/sxhkdrc $HOME/.config/sxhkd/sxhkdrc

# Setting up .xinit
echo "Setting up .xinitrc ..."
curl -o $HOME/.xinitrc -L aminzabardast.github.io/dotfiles/xinitrc
echo "setxkbmap us &\npicom -f &\nexec bspwm" >> $HOME/.xinitrc
