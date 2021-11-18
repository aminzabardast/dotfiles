# Install NVM

source "$PWD/utils.sh"

cecho "RED" "Installing Pyenv ..."
pacman -S --needed base-devel openssl zlib xz
curl https://pyenv.run | sh