#!/bin/sh

# Installing ZSH
echo "Installing ZSH ..."
sudo pacman --noconfirm --needed -S zsh
echo "Setting ZSH as default ..."
chsh -s $(which zsh)
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
