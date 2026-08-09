# Wulingyuan palette

Soft-dark, low-contrast misty-peak palette (Everforest-soft family,
base16-compatible), sampled from Zhangjiajie / Yangshuo mountain photos. This is
the shared color source for the whole rice.

## Files

| File                       | What it is                                                    |
|----------------------------|--------------------------------------------------------------|
| `palette.css`              | The 16 colors as CSS variables + base16 aliases, each with its HSV and photo source |
| `wulingyuan-palette.html`  | Interactive swatch reference — open in a browser, click a swatch to copy |
| `wallpaper/`               | Source wallpapers the palette was sampled from               |

Machine-readable consumers of these colors elsewhere in this repo:
`hyprland/waybar/colors.css` (GTK `@define-color`).

## Neovim theme

The matching Neovim colorscheme used to live here; it now has its own repo so it
installs like any other plugin:

**https://github.com/P-Louw/wulingyuan-nvim**

```lua
-- lazy.nvim
{ "P-Louw/wulingyuan-nvim", priority = 1000,
  config = function() vim.cmd.colorscheme("wulingyuan") end }
```

Keep its `lua/wulingyuan/palette.lua` in sync with `palette.css` here — this file
is the source of truth for the colors.
