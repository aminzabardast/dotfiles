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
# Install NVM
sh "$PWD/partials/pyenv.sh"
# Install Disk Utils
sh "$PWD/partials/disk_utils.sh"
# Install Docker
sh "$PWD/partials/docker.sh"
# Install Albert
sh "$PWD/partials/albert.sh"
# Install Flameshot
sh "$PWD/partials/flameshot.sh"
# Install FDM
sh "$PWD/partials/fdm.sh"
# Install Gnome
sh "$PWD/partials/gnome.sh"
# Theme and Icon
sh "$PWD/partials/theme.sh"
# Video Player
sh "$PWD/partials/mpv.sh"
# List Hardware
sh "$PWD/partials/lshw.sh"
# Install Googler
sh "$PWD/partials/googler.sh"
