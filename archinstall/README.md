# Installing Arch Linux

## Steps

1. Download [Arch Linux's ISO File](https://archlinux.org/download/) and make a bootable drive (or pass the ISO to virtualization medium).
2. Boot into installation environment.
3. Load `user_configuration.json` into a file (for example `uc.json`).
    ```shell
    curl -L aminzabardast.github.io/dotfiles/archinstall/user_configuration.json > uc.json
    ```
    1. Uncomment (Virtual Machine) VM related lines in `user_configuration.json`.
4. Run the installer: `archinstall --conf <config_file>`.
5. Provide a *Disk Configuration*. `Disk Configuration > Use a best-effort default partition layout > Select devices > ext4 type`.
6. Create a `sudoer` *User*.
    1. Make sure to replace the username in the file (`custom-commands` section) with the *User* you created.
7. Reboot after installation is done.

## [Paru](https://github.com/Morganamilo/paru) as Package Manager

*Paru* is already pulled to `/opt/paru` via `user_configuration.json`.

Follow these steps:
1. Go to `/opt/paru`.
2. Make and install `makepkg -si`.

## Disable SSH with Password

Having SSH with password is not as secure. The following steps are for disabling the password authentication.

1. Edit `/etc/ssh/sshd_config` and change `PasswordAuthentication` to `no`.
2. Restart the `sshd` service:
    ```shell
    systemctl restart sshd
    ``` 

## Result

This will install [Arch Linux](https://archlinux.org/), with [BSPWM](https://wiki.archlinux.org/title/bspwm), [DMenu](https://wiki.archlinux.org/title/dmenu), and [urxvt](https://wiki.archlinux.org/title/rxvt-unicode).
