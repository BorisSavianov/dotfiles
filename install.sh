#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

packages=(
  applications
  ai
  bin
  browser
  desktop
  git
  kitty
  rofi
  shell
  sway
  theme
  waybar
  zed
)

usage() {
  printf 'Usage: %s [--delete] [package ...]\n' "$(basename "$0")"
}

action=()

case "${1:-}" in
  -h|--help)
    usage
    exit 0
    ;;
  -D|--delete|delete|unstow)
    action=(-D)
    shift
    ;;
esac

if (($#)); then
  packages=("$@")
fi

if ! command -v stow >/dev/null 2>&1; then
  printf 'error: GNU Stow is required but was not found in PATH\n' >&2
  exit 1
fi

stow "${action[@]}" --no-folding --dir "$repo_dir" --target "$HOME" "${packages[@]}"
