#!/bin/sh

# Update
sh "$PWD/partials/update_and_upgrade.sh"
# Install ZSH
sh "$PWD/partials/zsh.sh"
# Install Tmux
sh "$PWD/partials/tmux.sh"
# Install fzf
sh "$PWD/partials/fzf.sh"
# Install yt-dlp
sh "$PWD/partials/ytdl.sh"
# Install NVM
sh "$PWD/partials/nvm.sh"
# Install Gnome
sh "$PWD/partials/gnome.sh"
