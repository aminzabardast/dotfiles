#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing yt-dlp ..."
sudo pacman --noconfirm --needed -S yt-dlp
