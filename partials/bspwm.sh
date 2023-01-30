#!/bin/sh

source "$PWD/utils.sh"

#cecho "RED" "Installing BSP Window Manager ..."
#sudo pacman --noconfirm --needed -S bspwm \
#                                    sxhkd \
#                                    dmenu \
#                                    picom \
#                                    xsecurelock \

cecho "RED" "Setting up BSPWM ..."
mkdir "$HOME/.config"
mkdir "$HOME/.config/bspwm"
mkdir "$HOME/.config/sxhkd"
ln -sf "$PWD/config/bspwm/bspwmrc" "$HOME/.config/bspwm/bspwmrc"
ln -sf "$PWD/config/sxhkd/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"

# Setting up wallpaper and autoranr postswitch
cecho "RED" "Setting up wallpaper ..."
echo "#!/bin/sh
feh --no-fehbg --bg-fill $HOME/.dotfiles/wallpaper.png" > "$HOME/.fehbg"
chmod +x "$HOME/.fehbg"
mkdir -p "$HOME/.config/autorandr"
ln -sf "$PWD/config/autorandr/postswitch" "$HOME/.config/autorandr/postswitch"

# Setting up .xinit
cecho "RED" "Setting up .xinitrc ..."
ln -sf "$PWD/xinitrc" "$HOME/.xinitrc"

cecho "RED" "Setting Initial Local ..."
sudo cp "$PWD/etc/locale.conf" "/etc/locale.conf"

#cecho "RED" "Installing Polybar ..."
#sudo git clone https://aur.archlinux.org/polybar.git /opt/polybar
#sudo chown -R $USER:$USER /opt/polybar
#cd "/opt/polybar"
#makepkg --noconfirm --needed -si
#sudo pacman --noconfirm --needed -S polybar
cecho "RED" "Setting up polybar ..."
cd "$HOME/.dotfiles"
mkdir -p "$HOME/.config/polybar"
ln -sf "$PWD/config/polybar/config" "$HOME/.config/polybar/config"
ln -sf "$PWD/config/polybar/launch.sh" "$HOME/.config/polybar/launch.sh"

#cecho "RED" "Installing Rofi ..."
#sudo pacman --noconfirm --needed -S rofi
cecho "RED" "Setting up Rofi ..."
cd "$HOME/.dotfiles"
mkdir -p "$HOME/.config/rofi"
ln -sf "$PWD/config/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
