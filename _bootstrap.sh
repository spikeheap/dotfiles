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

echo "==> mise runtimes"
# Sets global defaults; per-project versions come from .tool-versions files.
mise use --global node@latest   2>/dev/null || true
mise use --global ruby@latest   2>/dev/null || true
mise use --global python@latest 2>/dev/null || true
mise install 2>/dev/null || true

# Zsh plugins (antidote) and prompt (starship) come from the Brewfile; antidote
# clones the plugins listed in .config/zsh/plugins.txt on first shell start.

echo "==> link dotfiles"
HOME_LINKS=(default-npm-packages gitconfig jekyllconfig vimrc zprofile zshenv zshrc)
for name in "${HOME_LINKS[@]}"; do
  link "$DOTFILES_DIR/$name" "$HOME/.$name"
done

link "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
link "$DOTFILES_DIR/finicky.js" "$HOME/.finicky.js"

# XDG config: link each subdir so adding a tool here needs no bootstrap change
for dir in "$DOTFILES_DIR"/.config/*/; do
  link "${dir%/}" "$HOME/.config/$(basename "${dir%/}")"
done
# starship.toml is a file (not a dir), so link it explicitly
link "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

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
- iTerm: Settings -> Profiles -> Text -> Font -> "FiraCode Nerd Font" (required
  for starship prompt glyphs).
- Alfred: Settings -> Advanced -> "Set sync folder" -> $DOTFILES_DIR/alfred
- Disable Spotlight's Cmd-Space, then set Alfred's hotkey to Cmd-Space.
- Launch Backblaze, Little Snitch, 1Password to complete first-run setup.
- Sharing -> Remote Login (iMac only); set hostname.
- Keyboard -> Modifier Keys: Caps Lock -> Control.
EOF
