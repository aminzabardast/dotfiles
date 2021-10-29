#!/bin/sh
echo "Updating Packages ..."
sudo su
pacman --noconfirm -Suy
echo "Installing Necessary Packages ..."
pacman --noconfirm -S xorg xorg-xinit arandr bspwm sxhkd dmenu feh picom firefox rxvt-unicode openssh

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
curl -o ~/.xinitrc -L aminzabardast.github.io/dotfiles/xinitrc
echo "setxkbmap us &\npicom -f &\nexec bspwm" >> ~/.xinitrc
