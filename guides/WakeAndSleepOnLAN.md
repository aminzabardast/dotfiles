# Wake and Sleep on LAN

## Wake on LAN (WoL)

First and for most, WoL should be supported by the Motherboard.

1. **Enable Wake on LAN in BIOS**: 
    - Restart your computer and enter the BIOS setup (usually by pressing `F2`, `DEL`, or `ESC` during boot).
    - Look for settings related to power management or advanced settings.
    - Enable "Wake on LAN" or "Power On By PCI/PCI-E Device".

2. **Check Wake on LAN Availability**:
    - Open a terminal and run the following command:
      ```bash
      sudo ethtool <interface>
      ```
    - Replace `<interface>` with your network interface name (e.g., `eth0`, `enp3s0`).
    - Look for "Supports Wake-on" and "Wake-on" lines. If it shows `g`, it means WoL is supported.

3. **Setting to Wake**:
    - Usually, the Wake-On settings is disabled (showing `d`).
    - To enable it, the following can be used:
      ```bash
      sudo ethtool -s <interface> wol g
      ```
    - This will go back to `d` after reboot.

4. **Making It Persist**:
    - There are several ways to do that. My favorite ways is using *CronTabs*.
    - Add the following line to your crontab:
      ```bash
      @reboot /usr/bin/ethtool -s <interface> wol g
      ```

## Sleep on LAN (SoL)

This is not something that is supported by Motherboards. However, there is a project that aims to achieve this.

<https://github.com/SR-G/sleep-on-lan>

1. Make sure SoL is installed.
2. Execute `sleep-on-lan` on terminal. It will tell you where the config (`sol.json`) should be.
3. The content of `sol.json` should be:
    ```
    {
        "Listeners": [
            "UDP:9"
        ],
        "LogLevel": "INFO",
        "Commands": [
            {
                "Operation": "shutdown",
                "Command": "poweroff",
                "Default": true
            }
        ]
    }
    ```
4. Install [GPTWOL](https://github.com/Misterbabou/gptwol) on RPi to be able to wake your PC remotely. I map the *GPTWOL* interface to a local domain (using *dnsmasq* and *nginx*) to have easy access.
