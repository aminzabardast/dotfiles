# Docker

## Installation

Installing Docker, and Docker Compose on ArchLinux is easy.

```shell
sudo pacman -S docker docker-compose
```

You have to enable the Docker service after installation.

```shell
systemctl enable --now docker.service
```

For more information, check [the ArchWiki page for Docker](https://wiki.archlinux.org/title/docker).

It is best to add your user to the `docker` so you can control docker without *sudo*.

```shell
sudo usermod -aG docker <username>
```

You need to reboot for the group modification to take effect.

## Testing

Create the following file `test_docker/docker-compose.yaml` and add the following to it.

```yaml
services:
  hello_world:
    image: hello-world
```

then bring up the containers using `docker-compose up`. The result should be like the following:

```shell
[+] Running 2/0
 ✔ Network test_default          Created                                                                                                                                                                       0.0s
 ✔ Container test-hello_world-1  Created                                                                                                                                                                       0.1s
Attaching to hello_world-1
hello_world-1  |
hello_world-1  | Hello from Docker!
hello_world-1  | This message shows that your installation appears to be working correctly.
hello_world-1  |
hello_world-1  | To generate this message, Docker took the following steps:
hello_world-1  |  1. The Docker client contacted the Docker daemon.
hello_world-1  |  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
hello_world-1  |     (arm64v8)
hello_world-1  |  3. The Docker daemon created a new container from that image which runs the
hello_world-1  |     executable that produces the output you are currently reading.
hello_world-1  |  4. The Docker daemon streamed that output to the Docker client, which sent it
hello_world-1  |     to your terminal.
hello_world-1  |
hello_world-1  | To try something more ambitious, you can run an Ubuntu container with:
hello_world-1  |  $ docker run -it ubuntu bash
hello_world-1  |
hello_world-1  | Share images, automate workflows, and more with a free Docker ID:
hello_world-1  |  https://hub.docker.com/
hello_world-1  |
hello_world-1  | For more examples and ideas, visit:
hello_world-1  |  https://docs.docker.com/get-started/
hello_world-1  |
hello_world-1 exited with code 0
```

You can run the following to remove all the traces of this test image.

```shell
doocker-compose down --rmi all
```
