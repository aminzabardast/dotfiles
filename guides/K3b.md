# K3b

## What is K3b?

**K3b** (from KDE Burn Baby Burn) is a CD, DVD and Blu-ray authoring application by KDE for Unix-like computer operating systems.
The actual disc recording in K3b is done by the command line utilities `cdrecord` or `cdrkit`, `cdrdao`, and `growisofs`. 

## Installation

Before installing the software, add the user to the `optical` groups.
This will allow the software to see any Optical Drives connected to the computer.

```shell
sudo usermod -aG optical <user-name>
```

Main Software and Dependencies:

1. Install the main software `sudo pacman -S k3b`
2. Install terminal software dependencies `sudo pacman -S cdrecord cdrtools libisoburn dvd+rw-tools libburn cdrdao`
