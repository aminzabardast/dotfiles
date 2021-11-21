#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing ZSH  ..."
sudo pacman --noconfirm --needed -S zsh
cecho "RED" "Setting ZSH as default ..."
chsh -s "$(which zsh)"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
ln -s "$PWD/.zshrc" "$HOME/.zshrc"
ln -s "$PWD/.profile" "$HOME/.profile"
ln -s "$PWD/.personal" "$HOME/.personal"