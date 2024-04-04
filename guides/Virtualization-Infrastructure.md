# Virtualization

1. Make sure [KVM is enabled](https://wiki.archlinux.org/title/QEMU#Enabling_KVM)
2. Install [QEMU](https://wiki.archlinux.org/title/QEMU#Installation)
3. Install [libvirt](https://wiki.archlinux.org/title/libvirt#Installation)
4. Install [Virt-Manager](https://wiki.archlinux.org/title/Virt-manager#Installation)

Tips:
- Make sure that you meet "For network connectivity" requirements in libvirt.
- You need to start a default network in Virsh. Network will not work out of the box.
- You have to assign yourself to `libvirt-qemu` and `libvirt` groups.
- House your iso files in `/var/lib/libvirt/images` directory. Give the ownership to `libvirt-qemu` user and group.
- Add `/var/lib/libvirt` to be ignored by backup operations.
