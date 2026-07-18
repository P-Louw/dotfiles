# Hyprland — Wulingyuan rice

A complete [Hyprland](https://hypr.land) desktop setup themed with **Wulingyuan**, a
custom soft-dark "misty-peak" palette (Everforest-soft family, base16-compatible)
sampled from Zhangjiajie / Yangshuo mountain photos.

Each subfolder mirrors its target under `~/.config/`, matching the repo's per-app
layout. Nothing here is auto-installed — copy or symlink each folder yourself.

## Contents

| Folder     | Deploys to                     | What it is                                    |
|------------|--------------------------------|-----------------------------------------------|
| `hypr/`    | `~/.config/hypr/`              | Hyprland compositor config (Lua)              |
| `waybar/`  | `~/.config/waybar/`            | Status bar: `config.jsonc` + `style.css` + `colors.css`, plus `scripts/scnp.lua` |
| `wofi/`    | `~/.config/wofi/`             | App launcher config + style                   |
| `ghostty/` | `~/.config/ghostty/`          | Terminal color theme                          |
| `dunst/`   | `~/.config/dunst/`            | Notification daemon config                    |
| `eww/`     | `~/.config/eww/`             | Soundcraft audio widget (`eww.yuck` + `eww.scss`) |
| `themes/`  | —                              | Palette reference + the design artifact       |

## Deploy

Symlink (recommended, so edits track the repo) or copy each folder's **contents**
into the matching `~/.config/<app>/`:

```sh
cd ~/Documents/dotfiles/hyprland
for app in hypr waybar wofi dunst eww; do
  mkdir -p ~/.config/"$app"
  ln -sf "$PWD/$app"/* ~/.config/"$app"/
done
```

Two things need a manual touch:

- **waybar:** `colors.css` **must** sit next to `style.css` — `style.css` begins with
  `@import "colors.css";`. Keep them in the same directory.
- **ghostty:** ships only the theme file (there is no ghostty `config` here). Copy it to
  `~/.config/ghostty/themes/wulingyuan` and add `theme = wulingyuan` to your ghostty
  `config`.

After deploying, reload the bar with `killall -SIGUSR2 waybar` (or restart it).

## Wulingyuan palette

Soft-dark, low-contrast, never pure black. Base names follow the `base16` convention.
Full interactive reference: **`themes/wulingyuan/wulingyuan-palette.html`** (open in a
browser — click any swatch to copy). Machine-readable sources:
`themes/wulingyuan/palette.css` (CSS variables) and `waybar/colors.css` (GTK
`@define-color`).

### Base ramp — background → foreground

| Name   | Hex       | Role                          |
|--------|-----------|-------------------------------|
| base00 | `#232b25` | misty dark — main background  |
| base01 | `#2b352e` | panel / inactive bg           |
| base02 | `#3a4740` | selection / forest shadow     |
| base03 | `#5f7167` | comments / muted teal-grey    |
| base04 | `#85917d` | dim foreground / sage khaki   |
| base05 | `#bcccc5` | default foreground            |
| base06 | `#d6ded8` | bright foreground / pale fog  |
| base07 | `#eef0e9` | brightest / luminous haze     |

### Accents — every one sampled from a real photo element

| Name   | Hex       | Source                        |
|--------|-----------|-------------------------------|
| red    | `#bd6b50` | prayer ribbon, muted          |
| orange | `#cd8b5c` | ribbon / lit-rock highlight   |
| yellow | `#b3b06a` | moss, olive lifted            |
| green  | `#8faa7d` | the hero — mid sage green     |
| cyan   | `#7ea896` | river water                   |
| blue   | `#8ba6b8` | atmospheric haze              |
| purple | `#a292ac` | distant-ridge mauve           |
| brown  | `#977c5d` | sandstone / boat wood         |

## Known gaps

- **Soundcraft audio helper.** The waybar volume tile (`pulseaudio.on-click`) and the eww
  audio widget both call `~/.config/waybar/scripts/scnp.lua` — a Soundcraft Notepad-12FX
  audio-routing helper, included here at `waybar/scripts/scnp.lua`. It is a `luajit`
  script that shells out to `scnp-cli` (from [socradoc](https://github.com/ndim/socradoc));
  install both, and keep the script executable, or the audio bubble and volume-click will
  do nothing (the rest of the bar is unaffected).
- **Runtime dependencies** (install these; they are referenced by the configs, not
  shipped here): `waybar`, `wofi`, `ghostty`, `dunst`, `eww`, `wlogout` (power menu),
  `brightnessctl`, `pactl` (pulseaudio/pipewire), `luajit` + `scnp-cli` (for the audio
  helper above), plus the launcher apps wired into
  `waybar/config.jsonc` — `firefox`, `code`, `spotify`, `thunar`, `dolphin`. Edit the
  `custom/*` `on-click` commands to match what you actually have installed.
- Font: the waybar style expects **JetBrainsMono Nerd Font** for text + icons.
