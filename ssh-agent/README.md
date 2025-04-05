# Running SSH Agent automatically

This solution is from the following source:
<https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login>

## Solution

Create the following `~/.config/systemd/user/ssh-agent.service` with this content.

```text
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

Also add this to `~/.ssh/config`

```text
AddKeysToAgent  yes
```

then start the processes

```shell
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
```
