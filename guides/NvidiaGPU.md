# Nvidia GPU

## Installation

Installing Nvidia GPU requirements is easy. Just run the following:

```shell
paru -S nvidia lib32-nvidia-utils
```

## Accessing Dedicated GPU in Hybrid Graphics System

You can use [PRIME](https://wiki.archlinux.org/title/PRIME) to access the dedicated GPU.

If you run the following, you see that the OpenGL Renderer is set to the internal graphics

```shell
DISPLAY=:0 glxinfo | grep "OpenGL renderer"
# OpenGL renderer string: Mesa Intel(R) Graphics (ADL GT2)
```

But you can use the `prime-run` command to offload any process to the dedicated GPU.

```shell
DISPLAY=:0 prime-run glxinfo | grep "OpenGL renderer"
# OpenGL renderer string: NVIDIA GeForce RTX 3060 Laptop GPU/PCIe/SSE2
```

Additionally, programs like Blender or Steam (Proton) do not need to be executed by the `prime-run` command. They can detect the dedicated GPU and offload the computation to that GPU nonetheless (they may need some settings altered).

## Tweaking Some Boot Params

⚠️ These are specific to my workstation and may vary depending on the hardware.

`ibt=off` and `split_lock_detect=off` should be added to the end of `options` section in the `/boot/loader/entries/<filename>.conf` (assuming you are using `systemd-boot`).

Example:

```conf
# Created by: archinstall
# Created on: yyyy-mm-dd_hh-mm-ss
title Arch Linux (linux)
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options root=PARTUUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx zswap.enabled=0 rw intel_pstate=no_hwp rootfstype=ext4 ibt=off split_lock_detect=off
```

If you are interested to know the reasons, check [here](https://wiki.archlinux.org/title/NVIDIA#Installation) and [here](https://www.reddit.com/r/VFIO/comments/zqesqm/psa_use_split_lock_detectoff_to_avoid_substantial/)
