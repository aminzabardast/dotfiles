#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Updating Packages ..."
sudo pacman --noconfirm --needed -Suy
cecho "RED" "Installing Necessary Packages ..."
sudo pacman --noconfirm --needed -S xorg \
                                    xorg-xinit \
                                    arandr \
                                    bspwm \
                                    sxhkd \
                                    dmenu \
                                    feh \
                                    picom \
                                    firefox \
                                    rxvt-unicode \
                                    openssh \
                                    base-devel \
                                    openssl \
                                    zlib \
                                    xz \
                                    neofetch /
                                    cmatrix
