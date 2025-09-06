# Dualboot with Windows

Steps:

1. Install Windows first. Keep enough space for Linux.
2. Install Linux (Arch Linux) using `archinstall`.
    - When asked about partitioning, choose "Manual".
    - Create a partition for root (`/`), swap, and one for EFI.
    - Make sure to format the EFI partition as FAT32 and set the mount point to `/boot`.
3. Make the linux partition the first boot option in BIOS.

## Switching to Windows

You can switch to Windows from Linux by using the following command:

```bash
sudo efibootmgr --bootnext xxxx
```

Replace `xxxx` with the boot number of Windows. You can find the boot number by running:

```bash
sudo efibootmgr
```

