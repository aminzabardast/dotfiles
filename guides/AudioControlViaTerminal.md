# Pamixer

`pamixer` is a terminal program that allows you to control audio levels.

Make sure you have it installed.

```shell
sudo pacman -S pamixer
```

## Mute and Unmute

You can check the mute status by `pamixer --get-mute`. You can force Mute and Unmute by `pamixer -m` and `pamixer -u` respectively. You can also toggle the mute status by `pamixer -t`

## Volume Control

You can check the volume control by `pamixer --get-volume` or `pamixer --get-volumen-human`.

You can increase the volume by `pamixer -i <number>` where number is between 1 and 100. For example, if the volume level is 10, then `pamixer -i 40` will increase the volume to 50.
Decreasing the volume works the same way, but you have to use the `-d` argument instead of `-i`.