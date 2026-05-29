# i3 dotfiles

i3 window manager setup, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

- **i3** — window manager config, gaps, keybindings, workspace layout
- **polybar** — status bar using the `pando` theme (custom, based on [adi1090x/polybar-themes](https://github.com/adi1090x/polybar-themes))
- **rofi** — app launcher and powermenu (based on [adi1090x/rofi](https://github.com/adi1090x/rofi))
- **picom** — compositor (config based on [jamescherti's picom config](https://gist.github.com/jamescherti/59f61eeaf17ccc16e1eab2c98d699d31))
- **dunst** — notification daemon (based on [EndeavourOS i3 setup](https://github.com/endeavouros-team/endeavouros-i3wm-setup))

## Install

```bash
cd ~/.dotfiles
git clone https://github.com/spreadpando/i3
stow i3
```

## Dependencies
install with your package manager:
- [i3-wm](https://i3wm.org/)
- [polybar](https://github.com/polybar/polybar)
- [rofi](https://github.com/davatorium/rofi)
- [picom](https://github.com/yshui/picom)
- [dunst](https://github.com/dunst-project/dunst)
- [feh](https://feh.finalrewind.org/) — wallpaper
- [autotiling](https://github.com/nwg-piotr/autotiling)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- [Qogir icon theme](https://github.com/vinceliuice/Qogir-icon-theme) — dunst notification icons

## Notes

- monitor outputs (`DP-0`, etc.) in `i3/config` and `polybar/launch.sh` need adjusting for different displays.
