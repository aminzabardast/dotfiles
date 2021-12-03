#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Virtualization Requirements ..."
yes | paru --needed -S iptables-nft
sudo pacman --noconfirm --needed -S virt-manager virt-viewer libvirt qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
