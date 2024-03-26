# Installing Arch Linux

## Steps

1. Download [Arch Linux's ISO File](https://archlinux.org/download/) and make a bootable drive (or pass the ISO to virtualization medium).
2. Boot into installation environment.
3. Load `user_configuration.json` into a file (for example `uc.json`).
    ```shell
    curl -L aminzabardast.github.io/dotfiles/archinstall/user_configuration.json > uc.json
    ```
    1. If using a Virtual Machine (VM), uncomment related lines in `user_configuration.json`.
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

## ZSH and OMZ

`ZSH` is already installed. You need to set `zsh` as the main shell and setup `oh-my-zsh`.

Steps:
1. `cd` to home directory.
2. `sh omz.sh`
4. `mv zshrc .zshrc`
5. `mv zprofile .zprofile`
6. `mv personal .personal`
7. Reboot.

## Increase Swap Size

To check different swaps, you can use the `swapon -s`. The _size_ is in Kibibyte (KiB = `1024^2` bytes).

In a fresh installation, the OS will only use `zram`.

To extend the swap strategy, you can add a `swapfile` of your own choosing size.

Steps:
1. All the necessary commands should be executed with a _sudoer_ user. I suggest becoming the _root user_.
    ```shell
    sudo su
    ```
2. Create File. The following creates a file with 4 GiBs (Gibibyte = `2^30` or `1024^3`). You can use GBs (Gigabyte = `10^9` or `1000^3`) as well.
    ```shell
    dd if=/dev/zero of=/swapfile bs=1GiB count=4 status=progress
    ```
3. Set the right permissions.
    ```shell
    chmod 0600 /swapfile
    ```
4. Format the file to swap.
    ```shell
    mkswap -U clear /swapfile
    ```
5. Activate the swap.
    ```shell
    swapon /swapfile
    ```

This will increase your swap for this session only. To make the swap activate in the boot, you need to change the `/etc/fstab` file. Take a backup of this file since messing this file up will be hard to recover from. Add the following to the file.
```txt 
/swapfile none swap defaults 0 0
```

## Result

This will install [Arch Linux](https://archlinux.org/), with [BSPWM](https://wiki.archlinux.org/title/bspwm), [DMenu](https://wiki.archlinux.org/title/dmenu), and [urxvt](https://wiki.archlinux.org/title/rxvt-unicode).
