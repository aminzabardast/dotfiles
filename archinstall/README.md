# Installing Arch Linux

This is based on [**ArchInstall**](https://wiki.archlinux.org/title/Archinstall) version `3.0.4`.

## Steps

1. Download [Arch Linux's ISO File](https://archlinux.org/download/) and make a bootable drive (or pass the ISO to virtualization medium).
1. Boot into installation environment.
1. Make sure there is internet connection.
    - Ping Google: `ping google.com`
    - If necessary, connect to WiFi using `iwctl`.
1. Run the installer: `archinstall`.
1. Select the region appropriate *Mirrors and repositories*. You can search within the list by using `/` key.
1. Provide a *Disk Configuration*. I suggest using the `best-effort` with `ext4` type.
1. Change the *hostname* if necessary.
1. Set *Root password*.
1. Create at least a `sudoer` user in the *user account* section.
1. Select appropriate *Profile*.
    - I use `Desktop Gnome` with *Nvidia* drivers and use `dgm` as greeter.
1. Use `pipewire` as audio.
1. If you are on a laptop or need to use the WiFi, make sure the network configs are set to *Network Manager*.
    - I find the default `systemd-networkd` faster so I just select *Copy ISO network settings*. But I use a Desktop with a wired connection.
1. Additional packages. You can search within the list by using `/` key.
    - I choose the following for Gnome:
        - `zsh`
        - `clang`
        - `cronie`
        - `duf`
        - `ncdu`
        - `zip`
        - `mc`
        - `aria2`
        - `fzf`
        - `tmux`
        - `btop`
        - `nvtop`
        - `git`
        - `neofetch`
        - `rsync`
        - `lshw`
    - The following may ro may not be installed depending on my Profile choice.
        - `unzip`
        - `zlib`
        - `xz`
        - `vim`
        - `udisks2`
        - `wget`
        - `htop`
        - `bind`
1. Select the correct timezone. You can search within the list by using `/` key.
1. Reboot after installation is done.

## [Paru](https://github.com/Morganamilo/paru) as Package Manager

Pull the *Paru* to `/opt/paru` the following.

```shell
sudo git clone https://aur.archlinux.org/paru.git /opt/paru
sudo chown -R <USER>:<USER> /opt/paru
```

run the following before build:

```shell
sudo sed -i 's/#MAKEFLAGS/MAKEFLAGS/g' /etc/makepkg.conf
sudo sed -i 's/-j2/-j$(nproc)/g' /etc/makepkg.conf
```

then build

```shell
cd /opt/paru
makepkg -si
```

## Disable SSH with Password

Having SSH with password is not as secure. The following steps are for disabling the password authentication.

1. Edit `/etc/ssh/sshd_config` and change `PasswordAuthentication` to `no`.
2. Restart the `sshd` service:
    ```shell
    systemctl restart sshd
    ``` 

## ZSH and OMZ

Make sure `ZSH` is already installed.

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then I load my personal configs.

```shell
curl -L https://aminzabardast.github.io/dotfiles/zsh/zshrc > /home/amin/.zshrc
curl -L https://aminzabardast.github.io/dotfiles/zsh/zprofile > /home/amin/.zprofile
curl -L https://aminzabardast.github.io/dotfiles/zsh/personal > /home/amin/.personal
```

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

## Remove Boot Loader Countdown

As it is explained [here](https://wiki.archlinux.org/title/systemd-boot#Loader_configuration), you can remove the boot loader page countdown by editing the `/boot/loader/loader.conf ` and assigning zero to `timeout`.

## Running Certain Services

Some services may not be active from the beginning. Activate them.

- `systemctl enable --now cronie.service`
- `systemctl enable --now sshd.service`
- `systemctl enable --now bluetooth.service`