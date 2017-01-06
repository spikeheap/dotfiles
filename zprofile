### rbenv
# use this until rbenv plugin is in better shape
# see https://github.com/robbyrussell/oh-my-zsh/pull/1118
export PATH="$HOME/.rbenv/bin:$PATH"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

eval "$(rbenv init -)"

