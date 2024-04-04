# Installation

Installing Nvidia GPU requirements is easy. Just run the following:

```shell
paru -S nvidia lib32-nvidia-utils
```

# Accessing Dedicated GPU in Hybrid Graphics System

You can use [PRIME](https://wiki.archlinux.org/title/PRIME) to access the dedicated GPU.

If you run the following, you see that the OpenGL Renderer is set to the internal greaphics
```shell
DISPLAY=:0 glxinfo | grep "OpenGL renderer"
# OpenGL renderer string: Mesa Intel(R) Graphics (ADL GT2)
```

But you can use the `prime-run` command to offload any process to the dedicated GPU.
```shell
DISPLAY=:0 prime-run glxinfo | grep "OpenGL renderer"
# OpenGL renderer string: NVIDIA GeForce RTX 3060 Laptop GPU/PCIe/SSE2
```

Additionally, programs like Blender or Steam (Proton) do not need to be executed by the `prime-run` command. They can detect the dedicated GPU and offlaod the computation to that GPU nonetheless (they may need some settings altered).