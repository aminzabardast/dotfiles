# Audio

## Pamixer

`pamixer` is a terminal program that allows you to control audio levels.

Make sure you have it installed.

```shell
sudo pacman -S pamixer
```

### Mute and Unmute

You can check the mute status by `pamixer --get-mute`. You can force Mute and Unmute by `pamixer -m` and `pamixer -u` respectively. You can also toggle the mute status by `pamixer -t`

### Volume Control

You can check the volume control by `pamixer --get-volume` or `pamixer --get-volume-human`.

You can increase the volume by `pamixer -i <number>` where number is between 1 and 100. For example, if the volume level is 10, then `pamixer -i 40` will increase the volume to 50.
Decreasing the volume works the same way, but you have to use the `-d` argument instead of `-i`.

You can also set an absolute level for the volume by `pamixer --set-volume <number>`. For example, `pamixer --set-volume 50` will set the volume level to 50% no matter the previous state.

## Checking Audio

If you want to make sure that the Sound and Audio setup (drivers etc) are installed correctly, you can use `mpv` to play audios from terminal.

Steps:

1. Make sure `mpv` is installed.

    ```shell
    sudo pacman -S mpv
    ```

2. Make sure the system is not muted and the volume is heigh enough.

    ```shell
    pamixer -u; pamixer --set-volume 50;
    ```

3. Test your audio byt the following command. If you don't hear anything, something might be wrong.

    ```shell
    mpv "https://file-examples.com/storage/fe0e2ce82f660c1579f31b4/2017/11/file_example_MP3_5MG.mp3"
    ```
