#!/bin/sh

# Installing ZSH
echo "Installing ZSH ..."
sudo pacman --noconfirm --needed -S zsh
echo "Setting ZSH as default ..."
chsh -s $(which zsh)
echo "Creating the Default '.zshrc' ..."
echo "" > "$HOME/.zshrc"

