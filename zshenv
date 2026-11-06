# ~/.zshenv — sourced for EVERY zsh invocation, including non-interactive
# scripts. Keep this to environment variables and PATH only: no aliases,
# functions, setopt, or interactive config (those belong in ~/.zshrc).

# PATH: personal dotfiles bin, then the rest. Project bin/ dirs are added per
# project by mise (mise.local.toml with `_.path = ["bin"]`, then `mise trust`),
# so an untrusted repo can't shadow commands like git or ls.
export PATH="$HOME/src/dotfiles/bin:$PATH"

# Editors
export EDITOR='subl'
export GIT_EDITOR='vim'

# Git hosting (used by some dotfiles bin/ scripts for private repos)
export GIT_HOSTING='git@github.com'

# Homebrew: install casks to /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Telemetry opt-outs — https://consoledonottrack.com
export DO_NOT_TRACK=1                           # honoured by many tools (Netlify, Gatsby, …)
export DISABLE_TELEMETRY=1
export SE_AVOID_STATS=true                      # Selenium stats opt-out
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
export HOMEBREW_NO_ANALYTICS=1                  # Homebrew InfluxDB analytics
export CHECKPOINT_DISABLE=1                     # HashiCorp (Terraform/Terragrunt/Packer) + Prisma
export SAM_CLI_TELEMETRY=0                      # AWS SAM CLI telemetry

# Prevent Terraform & Terragrunt from filling up disk with provider copies
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
export TG_PROVIDER_CACHE=1