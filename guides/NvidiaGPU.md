# Nvidia GPU

If you are using the `archinstall` for installing, you should have an option to install the Nvidia drivers. This will be done for you automatically.

## Installation

Installing Nvidia GPU requirements is easy. Just run the following:

```shell
paru -S nvidia-dkms nvidia-utils lib32-nvidia-utils
```

### What is `dkms`?

`dkms` is a framework that allows you to automatically rebuild kernel modules when a new kernel is installed. This is particularly useful for Nvidia drivers, as they often need to be rebuilt for each new kernel version.

### What is `lib32-nvidia-utils`?

`lib32-nvidia-utils` is a package that provides 32-bit Nvidia libraries. This is necessary for running 32-bit applications that require Nvidia drivers, such as some games or software.

## Accessing Dedicated GPU in Hybrid Graphics System (Mostly Laptops)
If you have a hybrid graphics system (like Intel + Nvidia), you may need to configure your system to use the dedicated GPU for certain applications. This is common in laptops that have both integrated and dedicated graphics.

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
