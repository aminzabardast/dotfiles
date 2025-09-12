# Wireguard Client

I use `wg-quick` to manage my Wireguard connections. It is a simple and easy-to-use tool. To install it, run the following command:

```bash
sudo pacman -S wireguard-tools
```

## Trouble Shooting

There is an issue related to DNS resolution when using `wg-quick` when using `systemd-resolved`. To fix this, you need to create a simbolic link to the `resolv.conf` file used by `systemd-resolved`. Run the following command:

```bash
sudo ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf
```

