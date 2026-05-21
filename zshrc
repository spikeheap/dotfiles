# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bundler
  dotenv
  # osx
  # rbenv
  ruby
)

# Activate zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_GB.UTF-8

unalias run-help
autoload run-help
if (( $+commands[brew] )); then
  HELPDIR="$(brew --prefix)/share/zsh/help"
fi

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# Bind OPTION-Left/Right to word jumps in ZSH
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

. /opt/homebrew/opt/asdf/libexec/asdf.sh


source /Users/rb/.docker/init-zsh.sh || true # Added by Docker Desktop

# Disable the up arrow because it's hard to undo 20 years of muscle memory/expectation :D
eval "$(atuin init zsh --disable-up-arrow)"
source /Users/rb/.config/op/plugins.sh

# sentry
export PATH="/Users/rb/.sentry/bin:$PATH"

# sentry
fpath=("/Users/rb/.local/share/zsh/site-functions" $fpath)
