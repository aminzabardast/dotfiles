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

The easiest way is to add the following line to `~/.config/code-server/config.yaml`

```yaml
cert: true
```

However, if the certificates are generated separately, they can be used in `nginx` proxy settings.

To do that, you can use the following line.

```shell
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/.config/code-server/MyKey.key -out ~/.config/code-server/MyCertificate.crt
```

and add the following lines to  `~/.config/code-server/config.yaml`.

```yaml
cert: .config/code-server/MyCertificate.crt
cert-key: .config/code-server/MyKey.key
```

## Running Code Server

The following will start a Code Server session. I suggest also passing `--disable-workspace-trust` as argument so the (annoying) Workspace Dialog is disabled.

```shell
code-server --disable-workspace-trust
```

### Running as a service

You can run the Code Server as a service.

You can enable the service to auto start during boot, or manually start and stop it on demand. Keep in mind that this service will not be enabled for all the users, only your user (you have to use `--user` argument).

```shell
# Enable for boot
systemctl --user enable code-server.service

# Start on demand
systemctl --user start code-server.service

# Stop on demand
systemctl --user stop code-server.service

# Restart the service
systemctl --user restart code-server.service

# Check service status and logs
systemctl --user status code-server.service
```

## Accessing Code Server through a local domain

You can access the running code server using a local domain if you have a local DNS available, and has `nginx` set up.

One option for a local DNS is [`dnsmasq`](https://wiki.archlinux.org/title/dnsmasq).

Although it is possible to host the DNS domain on the same machine as the Code Server, we assume the DNS will be set up on a separate server (I personally use a Raspberry Pi 4).

Steps:
1. Install the `dnsmasq` and `bind`.
2. Start Service.
    ```shell
    systemctl enable --now dnsmasq.service
    ```
3. Edit configuration in `/etc/dnsmasq.conf`.
    ```conf
    # Add other name servers here.
    server=1.1.1.1
    server=1.0.0.1

    # Add domains which you want to force to an IP address here.
    # The IP can be the location of nginx proxy server or the Workstation machine itself.
    address=/example.com/192.168.0.2

    # If you want dnsmasq to listen for DHCP and DNS requests only on specified interfaces (and the loopback) give the name of the interface (eg eth0) here. Repeat the line for more than one interface.
    interface=eth0
    interface=wlan0
    ```
4. Syntax check.
    ```shell
    systemctl restart dnsmasq.service
    dnsmaq --test
    # The response should be: > syntax check OK.
    ```
5. Test dns request to domains using local DNS (127.0.0.1) and cloudflare DNS (1.1.1.1).
    ```shell
    dig example.com @127.0.0.1

    # The response example:
    # ; <<>> DiG xxx <<>> example.com @127.0.0.1
    # ...

    # ;; ANSWER SECTION:
    # example.com.		0	IN	A	192.168.0.2

    # ...

    dig example.com @1.1.1.1

    # The response example:
    # ; <<>> DiG xxx <<>> example.com @1.1.1.1
    # ...

    # ;; ANSWER SECTION:
    # example.com.		0	IN	A	93.184.216.34

    # ...
    ```
6. Set DNS to local DNS by changing it to the IP of the DNS machine (either manually or by setting the local DNS on the router).

### Explaining the configuration

- `server=1.1.1.1` and `server=1.0.0.1` are the backup DNS servers. If the local DNS server cannot find the record to location of a domain (which is almost all domain), your request will be asked from the one up the chain.
- `address=/example.com/192.168.0.2` is to remap the domain `example.com` to a new IP.
- `interface=eth0` and `interface=wlan0` are the interfaces the DNS listens to DNS requests (the port will be the default port *53*).

## Setting up `nginx`

Create the `~/nginx/docker-compose.yaml` and populate it with the following.

```yaml
version: '3'
services:
  nginx:
    image: nginx:latest
    volumes:
      - ./conf.d/:/etc/nginx/conf.d/
    ports:
      - 80:80
      - 443:443
    restart: unless-stopped
```

and create the `~/nginx/conf.d/example.com.conf` populated with the following.

```conf
server {
    listen          80;
    server_name     example.com;

    return 301 https://example.com$request_uri; # Redirect HTTP requests to HTTPS address
}

server {
    listen          443 ssl;
    server_name     example.com;

    # These needs to be hthe files you generated. You have to move the if the WS machine and DNS/nginx machine are not the same.
    ssl_certificate         /etc/nginx/conf.d/example.com.crt;
    ssl_certificate_key     /etc/nginx/conf.d/example.com.key;

    ssl_protocols           TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;

    location / {
        allow                   all;
        proxy_pass              https://192.168.0.3:8080/; # 192.168.0.3 is the Workstation machine and 8080 is the port for code-server
        proxy_http_version      1.1;
        proxy_set_header        Host $host;
        proxy_set_header        Upgrade $http_upgrade;
        proxy_set_header        Connection upgrade;
    }
}
```

One more thing you need to do is to move the key and certificate files you generated to `/etc/nginx/conf.d` and use them as `ssl_certificate` and `ssl_certificate_key`.

After all this, create the system by the following command.

```shell
docker-compose up -d
```

Note that:
-   The 80 and 443 ports should be open and accessible on all devices (Workstation and DNS Server).
