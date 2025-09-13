# Better Fonts

## Windows 11 Fonts on Arch Linux

Install [`ttf-ms-win11-auto`](https://aur.archlinux.org/packages/ttf-ms-win11-auto) from AUR using Paru.

```shell
paru -S ttf-ms-win11-auto
```

## Nerd Fonts

Install [`nerd-fonts` group](https://archlinux.org/groups/x86_64/nerd-fonts/) from the official Arch Linux repositories.

```shell
paru -S nerd-fonts
```

Or alternatively, install a specific Nerd Font you want, for example, Roboto Mono Nerd Font.

```shell
paru -S ttf-roboto-mono-nerd
```

### Nerdfornts in Alacritty

Add the following lines to your `~/.config/alacritty/alacritty.toml` file to set a Nerd Font as the default font in Alacritty.

```toml
[font]
size = 12.0

[font.bold]
family = "RobotoMonoNerdFontMono"
style = "Bold"

[font.bold_italic]
family = "RobotoMonoNerdFontMono"
style = "Bold Italic"

[font.italic]
family = "RobotoMonoNerdFontMono"
style = "Italic"

[font.normal]
family = "RobotoMonoNerdFontMono"
style = "Regular"
```

### Enabling Nerd Fonts in Kickstart Neovim

1. Open your Neovim.
2. Run the command `:e $MYVIMRC` to open your Neovim configuration file.
3. Uncomment the line `-- vim.g.have_nerd_font = true` by removing the `--` at the beginning of the line.
4. Save the file and restart Neovim to apply the changes.

