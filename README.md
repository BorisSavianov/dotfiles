# Dotfiles

GNU Stow packages for my Linux desktop config.

## Packages

- `ai`: Claude and Codex settings only; auth/state files stay out.
- `applications`: user desktop entries.
- `bin`: small user scripts in `~/.local/bin`.
- `browser`: browser flags, not browser profile data.
- `desktop`: Thunar, XFCE, menu, MIME, and pavucontrol config.
- `git`: Git identity and GitHub credential-helper config.
- `kitty`, `rofi`, `sway`, `waybar`: app/window-manager config.
- `shell`: Bash startup files.
- `theme`: GTK/KDE dark theme config.
- `zed`: Zed settings.

## Install

Install GNU Stow, clone this repo to `~/dotfiles`, then run:

```sh
cd ~/dotfiles
./install.sh
```

To apply a subset:

```sh
cd ~/dotfiles
./install.sh shell git zed
```

To unlink everything managed here:

```sh
cd ~/dotfiles
./install.sh --delete
```

Equivalent manual command:

```sh
stow --no-folding --dir "$HOME/dotfiles" --target "$HOME" applications ai bin browser desktop git kitty rofi shell sway theme waybar zed
```

## GitHub

After creating the GitHub repo:

```sh
git remote add origin git@github.com:BorisSavianov/dotfiles.git
git push -u origin main
```

## Excluded

Do not version secrets, credentials, caches, histories, or app state. This repo intentionally excludes SSH/GPG/PKI data, Claude and Codex auth files, browser profiles, Proton Pass data, cache directories, histories, and binary state such as dconf or PulseAudio cookies.
