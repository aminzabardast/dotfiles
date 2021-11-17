#!/bin/sh

# Update
sh partials/update_or_upgrade.sh
# Install ZSH
sh partials/zsh.sh
# Install Tmux
sh partials/tmux.sh
# Install fzf
sh partials/fzf.sh
# gnome or bspwm
sh partials/gnome.sh
