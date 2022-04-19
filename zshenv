export PATH="./bin:$PATH"

# ncurses is keg-only. For compilers to find it, we need to set the following
#export LDFLAGS="-L/usr/local/opt/ncurses/lib"
#export CPPFLAGS="-I/usr/local/opt/ncurses/include"

# libffi is keg-only
#export LDFLAGS="-L/usr/local/opt/libffi/lib"

# readline is keg-only
#export LDFLAGS="-L/usr/local/opt/readline/lib"
#export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
#export CPPFLAGS="-I/usr/local/opt/readline/include"

CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl@1.1

export GIT_EDITOR='vim'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/local/bin/subl"

export TODO="t"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# https://consoledonottrack.com
export DO_NOT_TRACK=1

function gitup() {
	TMP_INITIAL_BRANCH=`git rev-parse --abbrev-ref HEAD`
	git checkout master && git pull
	git checkout develop && git pull 
	git checkout ${TMP_INITIAL_BRANCH}
}

function push-release() {
  TMP_INITIAL_BRANCH=`git rev-parse --abbrev-ref HEAD`
  OVERCOMMIT_DISABLE=1 git co master && git push
  OVERCOMMIT_DISABLE=1 git co develop && git push 
  OVERCOMMIT_DISABLE=1 git push --tags
  git co ${TMP_INITIAL_BRANCH}
}

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
