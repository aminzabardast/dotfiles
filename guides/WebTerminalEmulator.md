# Wetty - Terminal on Browser

[Wetty](https://github.com/butlerx/wetty) is a minimal terminal emulator that runs on browsers. You can self-host this emulator using docker.

## Why you may need this?

If you have a Work Station PC somewhere on your network and you want ssh access to it, you need a Terminal Emulator.
Terminal Emulators are easy to come by on Laptops or PCs, but on Smart Phone and other devices you may not be so lucky. A Terminal Emulator on browser is accessible everywhere.

## How to implement?

The following `docker-compose.yaml` is to run Wetty. You need to point to the work station, it can be the same machine or another machine on the network.

```yaml
services:
  wetty:
    image: wettyoss/wetty
    command:
      - --base=/
      - --ssh-host=192.168.0.3 # Workstation IP or Domain
    network_mode: "host"
    restart: unless-stopped
```

You can access it by going to `http://<machine-ip>:3000/`.

## Using `dnsmasq`, `nginx` and a custom domain

The following is an example of how you can do this.

Use `dnsmasq` to point the domain (here `ssh.example.com`) to the `nginx` machine. In my case, the DNS machine and the nginx machine are the same. So, `ssh.example.com -> nginx machine`.

Then use `nginx` to forward the request to `http://<wetty-machine-ip>:3000/`

```conf
server {
    listen              80;
    server_name         ssh.example.com;

    gzip                on;
    gzip_types          text/plain application/xml;
    gzip_proxied        no-cache no-store private expired auth;
    gzip_min_length     1000;

    location / {
        proxy_pass    http://<wetty-machine-ip>:3000/;
    }
}
```

Now you can go to `ssh.example.com` and SSH to your workstation.