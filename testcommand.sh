#!/bin/sh

# Update
sh "$PWD/partials/update_and_upgrade.sh"
# Install ZSH
sh "$PWD/partials/zsh.sh"
# Install Tmux
sh "$PWD/partials/tmux.sh"
# Install fzf
sh "$PWD/partials/fzf.sh"
# gnome or bspwm
sh "$PWD/partials/gnome.sh"
