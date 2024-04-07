# Virtualization

1. Make sure [KVM is enabled](https://wiki.archlinux.org/title/QEMU#Enabling_KVM)
2. Install [QEMU](https://wiki.archlinux.org/title/QEMU#Installation)
    ```shell
    paru -S qemu-full
    ```
3. Install [libvirt](https://wiki.archlinux.org/title/libvirt#Installation)
    ```shell
    paru -S libvirt iptables-nft dnsmasq openbsd-netcat
    ```
4. Add your user to libvirt groups.
    ```shell
    sudo usermod -aG libvirt-qemu,libvirt <username>
    ```
5. Start `libvirt` Service.
    ```shell
    systemctl enable --now libvirtd.service
    ```
6. Make sure that the default network auto starts.
    ```shell
    sudo virsh net-start default
    sudo virsh net-autostart default
    ```
7. Install [Virt-Manager](https://wiki.archlinux.org/title/Virt-manager#Installation) for GUI Access. You can also install Virt-Manager [via Homebrew](https://formulae.brew.sh/formula/virt-manager) for MacOS, then access your virtualizations via SSH.

Tips:
- House your iso files in `/var/lib/libvirt/images` directory. Give theie ownership to `libvirt-qemu` user and group.
    ```shell
    sudo chown -R libvirt-qemu:libvirt-qemu <filename>
    ```
- Add `/var/lib/libvirt` to be ignored by backup operations.
