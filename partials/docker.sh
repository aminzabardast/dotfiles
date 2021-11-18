#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Docker ..."
sudo pacman --noconfirm --needed -S docker
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
