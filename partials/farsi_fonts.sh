
#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing Farsi Fonts ..."
wget -O /tmp/fonts.tar.gz "https://github.com/behnam/fonts-farsiweb/tarball/master"
tar xvf /tmp/fonts.tar.gz -C /tmp
cd /tmp/behnam-fonts-farsiweb-018022e/ttf
cp /tmp/behnam-fonts-farsiweb-018022e/ttf/* $HOME/.local/share/fonts
