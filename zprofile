# ~/.zprofile — login shells only, sourced after ~/.zshenv and before ~/.zshrc.
# Use for login-time setup that should not re-run in every sub-shell.

# Homebrew environment (sets HOMEBREW_PREFIX, PATH, MANPATH, etc.)
eval "$(/opt/homebrew/bin/brew shellenv)"

# OrbStack: CLI tools and Docker/Linux integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
