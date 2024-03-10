# Installing Arch Linux

## Steps

1. Download [Arch Linux's ISO File](https://archlinux.org/download/) and make a bootable drive (or pass the iso to virtualization medium).
2. Boot into installation environment.
3. Load `user_configuration.json` into a file (for example `uc.json`).
4. Run the installer: `archinstall --conf uc.json`.
5. Provide a *User*.
6. Provide a *Drive Partition Schema*.

## Result

This will install [Arch Linux](https://archlinux.org/), with [BSPWM](https://wiki.archlinux.org/title/bspwm), [DMenu](https://wiki.archlinux.org/title/dmenu), and [urxvt](https://wiki.archlinux.org/title/rxvt-unicode).
