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
