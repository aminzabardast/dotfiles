#!/bin/sh

git clone https://github.com/aminzabardast/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"

source "$PWD/utils.sh"

# Install ZSH
cecho "RED" "Installing ZSH  ..."
sudo pacman --noconfirm --needed -S zsh
cecho "RED" "Setting ZSH as default ..."
chsh -s "$(which zsh)"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

# Update
sh "$PWD/partials/update_and_upgrade.sh"
# Install Tmux
sh "$PWD/partials/tmux.sh"
# Install fzf
sh "$PWD/partials/fzf.sh"
# gnome or bspwm
sh "$PWD/partials/gnome.sh"