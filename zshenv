export PATH="./bin:$PATH"
export PATH="$HOME/src/dotfiles/bin:$PATH"

export GIT_EDITOR='vim'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR='subl'

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# https://consoledonottrack.com
export DO_NOT_TRACK=1
export DISABLE_TELEMETRY=1
export SE_AVOID_STATS=true # Selenium requires opt-out of stats collection
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

# Don't prompt for confirmation whenever a * is used in rm
setopt rm_star_silent 

# Useful aliases
alias brspec="bundle exec rspec"
alias be="bundle exec"
alias dc=docker-compose

alias rubocop-uncommitted="git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -a --force-exclusion"
alias rubocop-unpushed="git diff-tree -r --no-commit-id --name-only master@\{u\} head | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -a --force-exclusion"
