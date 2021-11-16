#!/bin/sh

# Installing Gnome
echo "Setting up Gnome ..."
sudo pacman --noconfirm --needed -S gnome gnome-extra

echo "Enabling GDM ..."
sudo systemctl enable gdm
