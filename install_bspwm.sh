#!/bin/sh

# Install ZSH
sh "$PWD/partials/zsh.sh"
# Update
sh "$PWD/partials/update_and_upgrade.sh"
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
# Install Flameshot
sh "$PWD/partials/flameshot.sh"
# Install FDM
sh "$PWD/partials/fdm.sh"
# Install BSPWM
sh "$PWD/partials/bspwm.sh"
# Install Ploybar
sh "$PWD/partials/polybar.sh"
# Video Player
sh "$PWD/partials/mpv.sh"
# List Hardware
sh "$PWD/partials/lshw.sh"
# Install Googler
sh "$PWD/partials/googler.sh"
# Install Virtualization Requirements
sh "$PWD/partials/virt.sh"
# Install WMName
sh "$PWD/partials/wmname.sh"
# Install Terminal Emulator
sh "$PWD/partials/terminal.sh"
