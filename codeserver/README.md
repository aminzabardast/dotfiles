# Code Server

[Code Server](https://github.com/coder/code-server) is a solution to remote development on a browser.

Code Server has some [perks](https://github.com/coder/code-server#highlights) over using a local IDE:
- Consistant development on multiple devices.
- Preserve battery on device by not running heavy processes on device.

There are also some shortcomings:
- Internet connection is always necessary for development, since the development environment is running on a machine in another location.

## Installation

Code Server can be easily installed on Arch Linux [through AUR](https://aur.archlinux.org/packages/code-server).

## Password Protection

The Code Server should be password protector. Edit `~/.config/code-server/config.yaml` and modele it after the following.

```yaml
bind-addr: 0.0.0.0:<PORT>
auth: password
password: <PASS>
```

## Enabling SSL

You can use [self-signed certificates](https://coder.com/docs/code-server/latest/guide#https-and-self-signed-certificates) for accessing the code server with HTTPS.

Add the following line to `~/.config/code-server/config.yaml`

```yaml
cert: true
```

## Running Code Server

The following will start a Code Server session. I suggest also passing `--disable-workspace-trust` as argument so the (annoying) Workspace Dialog is disabled.

```shell
code-server --disable-workspace-trust
```
