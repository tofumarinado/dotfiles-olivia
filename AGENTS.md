# dotfiles-olivia — Agent Context

## What this repo is

Personal Linux dotfiles for a **retro-futuristic rice** called **diinki-retrofuture**.  
They are managed with **GNU Stow**: each top-level directory is a Stow package whose internal tree mirrors its target directory, so `config` is stowed into `$HOME/.config` and `themes` into `$HOME/.themes`.

**Target OS:** Arch Linux (Wayland session)

---

## Stack at a glance

| Role | Tool |
|---|---|
| Window manager | **Sway** (Wayland, i3-compatible) |
| Status bar | **Waybar** |
| Terminal | **Kitty** |
| App launcher | **Wofi** |
| Desktop widgets | **Eww** |
| Display manager | **ly** |
| Font | **Maple Mono** |
| Editor | **Emacs** (Evil mode) |
| GTK theme | **diinki-retro-dark** (bundled in `themes/`) |

---

## Repo structure

```
dotfiles-olivia/
├── config/
│   ├── emacs/   → ~/.config/emacs/{.emacs,.emacs.d/}
│   ├── eww/     → ~/.config/eww/{eww.yuck,eww_widgets.yuck,eww_vars.yuck,eww.scss,scripts/}
│   ├── kitty/   → ~/.config/kitty/{kitty.conf,diinki_retro.conf}
│   ├── sway/    → ~/.config/sway/config
│   ├── waybar/  → ~/.config/waybar/{config,style.css}
│   └── wofi/    → ~/.config/wofi/{config,style.css}
└── themes/      → ~/.themes/diinki-retro-dark/   (GTK 2/3/3.20/4, Metacity, Openbox, Cinnamon, xfwm4, Unity)
```

Stow commands use separate targets: `config` → `$HOME/.config`, `themes` → `$HOME/.themes`.

---

## Design system / colour palette

All configs share these colours — use them whenever editing or creating any theme/style file:

| Role | Hex |
|---|---|
| Background (dark) | `#141216` |
| Surface (lighter dark) | `#27232b` |
| Foreground / text | `#d8cab8` |
| Accent (purple) | `#AC82E9` |
| Accent deep | `#8F56E1` |
| Complementary (green) | `#c4e881` |
| Warning (orange) | `#fcb167` |
| Danger (red) | `#fc4649` |

Font used everywhere: **Maple Mono**, fallback monospace.  
Border radius convention: `8–14 px` for bars/widgets, `12 px` for Eww containers.

---

## Key config details

### Sway (`config/sway/config`)
- Mod key: `Super` (`Mod4`)
- Vim-style hjkl movement
- Terminal: `kitty`; Launcher: `wofi --show drun`; File manager: `nautilus`
- Inner/outer gaps: `8px`
- Keyboard layout: `es` (Spanish)
- Waybar launched via `bar { swaybar_command waybar }`
- Eww started on login via `exec_always ~/.config/eww/scripts/start.sh`
- Window borders use the shared palette (focused = `#d8cab8`, inactive/unfocused = `#AC82E9`, urgent = `#fcb167`)

### Waybar (`config/waybar/`)
- Config file is **JSON** (`config`), styles in **CSS** (`style.css`)
- Bar floats 200 px from each edge, 15 px from top
- Modules: workspaces (Sway + Hyprland) | centre app-launcher button (〇) | right: network · battery · pulseaudio · tray · clock
- Fonts: Maple Mono 14 px; uses Nerd Font icons inline
- All pill-shaped module backgrounds use `#27232b`; hover state switches to `#AC82E9` with `#141216` text

### Kitty (`config/kitty/`)
- Main config: `kitty.conf`; colour theme: `diinki_retro.conf` (included from main config)

### Wofi (`config/wofi/`)
- `config` (key=value ini), `style.css` for GTK CSS styling

### Eww (`config/eww/`)
- `eww.yuck` — window definitions (yearbox, monthbox, daybox, userinfo, powermenu) anchored bottom-right, plus the `audio` popup anchored top-right
- `eww_widgets.yuck` — widget implementations
- `eww_vars.yuck` — variable declarations
- `eww.scss` — styles (compiled by eww at runtime)
- `scripts/` — shell scripts: `start.sh` (daemon start), `day_format.sh`, `month_format.sh`, `year_format.sh`, and the audio-popup scripts (`get_volume.sh`, `get_muted.sh`, `get_sinks.sh`, `set_volume.sh`, `toggle_mute.sh`, `set_sink.sh`)
- Desktop widgets use `stacking = "bg"`; the `audio` popup uses `stacking = "overlay"` (clickable, above windows). All display on monitor 0.

### GTK Theme (`themes/diinki-retro-dark/`)
- Covers GTK 2, GTK 3.0, GTK 3.20, GTK 4.0, Metacity, Openbox-3, Cinnamon, xfwm4, Unity
- CSS sources live in `gtk-3.0/dist/` and `gtk-3.20/dist/`; compiled resources in `gtk.gresource`

---

## Common tasks

- **Add a new Eww widget:** define it in `eww_widgets.yuck`, declare its window in `eww.yuck`, add vars in `eww_vars.yuck`, style in `eww.scss`.
- **Change a colour globally:** search for the hex across all config/style files and update consistently; the palette table above is the source of truth.
- **Add a new Waybar module:** add the module key to `config` JSON, write its CSS selector in `style.css` following the `#27232b` background + `#d8cab8` text pattern.
- **Stow a new package:** create `config/<name>/...` mirroring `~/.config/<name>/`, then `stow --dir=config --target=$HOME/.config <name>`.
- **Apply all configs:** `stow --target=$HOME/.config config && stow --target=$HOME/.themes themes`

---

## Style conventions

- **No trailing whitespace** in config files.
- Sway config uses `#` comments; keep section comments (`### Heading`) for readability.
- Waybar config is JSON — keep it valid (no trailing commas).
- Eww uses Yuck (Lisp-like s-expressions) and SCSS — preserve indentation style.
- CSS in Waybar/Wofi uses `linear-gradient(to bottom, <color> 100%)` instead of plain `background-color` for sharper border-radius rendering (GTK quirk).
