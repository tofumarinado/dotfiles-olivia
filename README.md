# dotfiles-olivia

> **Rice:** diinki-retrofuture (retro-futuristic aesthetic)
> **Window Manager:** Sway (Wayland) | **Terminal:** Kitty | **Launcher:** Wofi | **Bar:** Waybar | **Widgets:** Eww
> **Font:** Maple Mono | **Display Manager:** ly

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

---

## Structure

All app configs live under `config/`, mirroring `~/.config`. The `themes` directory mirrors `~/.themes`.

```
dotfiles-olivia/
├── config/
│   ├── emacs/  → ~/.config/emacs/
│   ├── eww/    → ~/.config/eww/
│   ├── kitty/  → ~/.config/kitty/
│   ├── sway/   → ~/.config/sway/
│   ├── waybar/ → ~/.config/waybar/
│   └── wofi/   → ~/.config/wofi/
└── themes/     → ~/.themes/
```

> **Note:** `pi/` is the pi coding agent workspace — it is not managed with Stow.

---

## Installation

### Prerequisites

- Arch Linux (or any distro with the packages below available)
- [GNU Stow](https://www.gnu.org/software/stow/): `sudo pacman -S stow`
- Sway, Waybar, Kitty, Wofi, Eww, ly installed on the target machine

### Steps

```bash
# 1. Clone the repo
git clone <your-repo-url> ~/source/dotfiles-olivia
cd ~/source/dotfiles-olivia

# 2. Stow configs into ~/.config
stow --target=$HOME/.config config

# 3. Stow themes into ~/.themes
stow --target=$HOME/.themes themes
```

This creates symlinks from your home directory into this repo for every config file.

### Stowing individual apps

```bash
stow --dir=config --target=$HOME/.config sway      # just sway
stow --dir=config --target=$HOME/.config waybar    # just waybar
stow --dir=config --target=$HOME/.config emacs     # just emacs
# etc.
```

### Removing symlinks

```bash
stow --delete --target=$HOME/.config config
stow --delete --target=$HOME/.themes themes
```

---

## Color Palette

| Role | Hex |
|---|---|
| Accent (purple) | `#AC82E9` |
| Accent Deep | `#8F56E1` |
| Dark (background) | `#141216` |
| Lighter Dark | `#27232b` |
| Foreground (text) | `#d8cab8` |
| Complementary (green) | `#c4e881` |
| Warning (orange) | `#fcb167` |
| Danger (red) | `#fc4649` |
