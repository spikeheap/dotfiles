export PATH=/usr/local/share/npm/bin:$PATH

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/local/bin/subl"
export GIT_EDITOR='vim'

export TODO="t"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Useful aliases
alias pad="bundle exec padrino"
alias prake="bundle exec padrino rake"

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvmexport PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
