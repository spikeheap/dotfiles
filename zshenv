export PATH="./bin:$PATH"

CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl@1.1

export GIT_EDITOR='vim'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/local/bin/subl"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# https://consoledonottrack.com
export DO_NOT_TRACK=1

new-ruby-script()
{
    local url="https://raw.githubusercontent.com/pazdera/scriptster/master"
    #curl "$url/examples/minimal-template.rb" >"$1"
    curl "$url/examples/documented-template.rb" >"$1"

    chmod +x "$1"
    $EDITOR "$1"
}

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

# Don't prompt for confirmation whenever a * is used in rm
setopt rm_star_silent 

# Useful aliases
alias brspec="bundle exec rspec"
alias be="bundle exec"
alias dc=docker-compose
