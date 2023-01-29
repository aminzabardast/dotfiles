# Dotfiles

## Steps

- Use `archinstall` config.
- Reboot.
- Change the ownership of `~/.dotfiles` and `~/.config` to the user.
- `cd ~/.dotfiles; sh install.sh`
    - partials/zsh
    - partials/pyen
    - partials/nvm
    - partials/bspwm
- Disable `lightdm` through `systemctl`
- Enable `iwd` through `systemctl`
- Enable `ssh-agent`: `systemctl --user enable --now ssh-agent`

## Fonts

Installing [Microsoft Fonts](https://wiki.archlinux.org/title/Microsoft_fonts) is a good idea.


## Color Schema for Ricing (future project)

- `#0d1e34`
- `#f9f8d4`
- `#f9f8d4`
- `#0d1e34`
- `#0d1e34`
- `#0d1e34`
- `#0d1e34`
