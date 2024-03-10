# Auto Login

Auto login is not enabled by installation. If you need to do this, follow [the guide in Arch Wiki](https://wiki.archlinux.org/title/LightDM#Enabling_autologin).

# Disabling/Enabling GUI

You can enable or disable the GUI by enabling or disabling the LightDM service.

```shell
# Disabling
systemctl disable lightdm.service

# Enabling
systemctl enable --now lightdm.service
```

# Auto Background Set

You can use Feh to setup background images. Check [the guide on ArchWiki](https://wiki.archlinux.org/title/Feh#Set_the_wallpaper) for more detail.
