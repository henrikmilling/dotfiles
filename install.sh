#!/bin/sh
set -e
cd "$(dirname "$0")"

for f in .aliases .zshrc.shared; do
  ln -sf "$PWD/$f" "$HOME/$f"
done

grep -q 'source ~/.aliases' "$HOME/.zshrc" 2>/dev/null || \
  printf '\nsource ~/.aliases\nsource ~/.zshrc.shared\n' >> "$HOME/.zshrc"

