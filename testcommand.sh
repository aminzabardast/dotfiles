#!/bin/sh
echo "Updating Packages ..."
sudo su
pacman -Suy --noconfirm
#echo "Installing Necessary Packages ..."
#pacman -S --noconfirm xorg xorg-xinit arandr bspwm sxhkd dmenu feh picom firefox rxvt-unicode
exit

# Setting Up BSPWM
#echo "Setting up BSPWM ..."
#mkdir ~/.config
#mkdir ~/.config/bspwm
#mkdir ~/.config/sxhkd
#cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
#cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Setting up .xinit
#echo "Setting up .xinitrc ..."
#cp /etc/X11/xinit/xinitrc ~/.xinitrc
