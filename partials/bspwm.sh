#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing BSP Window Manager ..."
sudo pacman --noconfirm --needed -S bspwm \
                                    sxhkd \
                                    dmenu \
                                    picom

cecho "RED" "Setting up BSPWM ..."
mkdir "$HOME/.config"
mkdir "$HOME/.config/bspwm"
mkdir "$HOME/.config/sxhkd"
cp /usr/share/doc/bspwm/examples/bspwmrc $HOME/.config/bspwm/bspwmrc
cp /usr/share/doc/bspwm/examples/sxhkdrc $HOME/.config/sxhkd/sxhkdrc

# Setting up wallpaper
echo "#!/bin/sh
feh --no-fehbg --bg-fill $HOME/.dotfiles/wallpaper.png" > "$HOME/.fehbg"
chmod +x "$HOME/.fehbg"

# Setting up .xinit
cecho "RED" "Setting up .xinitrc ..."
cp xinitrc $HOME/.xinitrc
echo "
setxkbmap us &
$HOME/.fehbg &
xsetroot -cursor_name left_ptr
picom -f &
exec bspwm
" >> $HOME/.xinitrc

cecho "RED" "Setting Initial Local ..."
sudo cp "$PWD/etc/locale.conf" "/etc/locale.conf"