### rbenv
# use this until rbenv plugin is in better shape
# see https://github.com/robbyrussell/oh-my-zsh/pull/1118
export PATH="$HOME/.rbenv/bin:$PATH"


#export PATH=/usr/local/share/npm/bin:$PATH
#export PATH=/usr/local/bin:$PATH
#export PATH

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/local/bin/subl"
export GIT_EDITOR='vim'

#export GIT_TEMPLATE_DIR=`/Users/rb/.rbenv/shims/overcommit --template-dir`

export TODO="t"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

function gitup() {
	TMP_INITIAL_BRANCH=`git rev-parse --abbrev-ref HEAD`
	git co master && git pull
	git co develop && git pull 
	git co ${TMP_INITIAL_BRANCH}
}


# Useful aliases
alias pad="bundle exec padrino"
alias prake="bundle exec padrino rake"
alias brspec="bundle exec rspec"
alias be="bundle exec"
alias migrations="bundle exec rake ar:migrate && RACK_ENV=test bundle exec rake ar:reset"
alias clean_test="RACK_ENV=test bundle exec padrino rake ar:reset"

# Docker aliases
alias drun="docker-compose run --rm padrino"
alias drspec="docker-compose run --rm padrino bundle exec rspec"
alias dpad="docker-compose run --rm padrino bundle exec padrino c"

alias wakeimac="wakeonlan -i 46.227.149.240 -p 38755 38:c9:86:1b:dc:a1"
eval `/usr/libexec/path_helper -s`
