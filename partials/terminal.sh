#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Alacritty  ..."
sudo pacman --noconfirm --needed -S alacritty
ln -s "$PWD/config/alacritty" "$HOME/.config/alacritty"
