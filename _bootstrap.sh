#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup-then-symlink. Skips if already correct, never clobbers silently.
link() {
  local source="$1" target="$2"
  mkdir -p "$(dirname "$target")"
  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    return
  fi
  if [[ -e "$target" || -L "$target" ]]; then
    mv "$target" "$target.bak.$(date +%s)"
    echo "Backed up existing $target"
  fi
  ln -s "$source" "$target"
  echo "Linked $target -> $source"
}

echo "==> Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "==> brew bundle"
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "==> asdf plugins"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 2>/dev/null || true
asdf plugin add ruby   https://github.com/asdf-vm/asdf-ruby.git   2>/dev/null || true
asdf global nodejs latest 2>/dev/null || true
asdf global ruby   latest 2>/dev/null || true

echo "==> oh-my-zsh"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "==> link dotfiles"
HOME_LINKS=(asdfrc gitconfig jekyllconfig vimrc zprofile zshenv zshrc)
for name in "${HOME_LINKS[@]}"; do
  link "$DOTFILES_DIR/$name" "$HOME/.$name"
done

link "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
link "$DOTFILES_DIR/finicky.js" "$HOME/.finicky.js"

# XDG config: link whole dirs so adding tools here doesn't need bootstrap changes
link "$DOTFILES_DIR/.config/gits" "$HOME/.config/gits"

SUBLIME_USER="$HOME/Library/Application Support/Sublime Text/Packages/User"
link "$DOTFILES_DIR/sublime/Preferences.sublime-settings"     "$SUBLIME_USER/Preferences.sublime-settings"
link "$DOTFILES_DIR/sublime/Package Control.sublime-settings" "$SUBLIME_USER/Package Control.sublime-settings"

echo "==> macOS defaults"
"$DOTFILES_DIR/osx"

cat <<EOF

==> Manual follow-ups
- iTerm: Settings -> General -> Preferences -> tick "Load preferences from a
  custom folder or URL", point at $DOTFILES_DIR/iterm, tick "Save changes to
  folder when iTerm quits".
- Alfred: Settings -> Advanced -> "Set sync folder" -> $DOTFILES_DIR/alfred
- Disable Spotlight's Cmd-Space, then set Alfred's hotkey to Cmd-Space.
- Launch Backblaze, Little Snitch, 1Password to complete first-run setup.
- Sharing -> Remote Login (iMac only); set hostname.
- Keyboard -> Modifier Keys: Caps Lock -> Control.
EOF
