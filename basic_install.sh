#!/bin/sh

git clone https://github.com/aminzabardast/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"

# Install ZSH
sh "$PWD/partials/zsh.sh"
# Update
sh "$PWD/partials/update_and_upgrade.sh"
# Install Tmux
sh "$PWD/partials/tmux.sh"
# Install fzf
sh "$PWD/partials/fzf.sh"
# gnome or bspwm
sh "$PWD/partials/gnome.sh"