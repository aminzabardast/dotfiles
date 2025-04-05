# WirePlumber Auto-switch Disable

WirePlumber is a session manager for PipeWire, which is used for handling audio and video streams. By default, WirePlumber may automatically switch audio codecs for Bluetooth devices, which can be inconvenient in some cases. This guide will help you disable the auto-switching feature for Bluetooth devices in WirePlumber.

## Steps to Disable Auto-switching

1. **Create or Edit the Configuration File**:
    Create a new configuration file or edit an existing one.
     ```bash
     vim ~/.config/wireplumber/wireplumber.conf.d/11-bluetooth-policy.conf
     ```
3. **Disable Auto-switching**:
    Add the following lines to the configuration file to disable auto-switching:
     ```conf
     wireplumber.settings = {
        bluetooth.autoswitch-to-headset-profile = false
    }
     ```
4. **Save and Exit**:
    Save the changes and exit the text editor.
5. **Reboot**:
    Reboot your system.
