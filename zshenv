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


function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
#setjdk 1.8

export TODO="t"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

function gitup() {
	TMP_INITIAL_BRANCH=`git rev-parse --abbrev-ref HEAD`
	git checkout master && git pull
	git checkout develop && git pull 
	git checkout ${TMP_INITIAL_BRANCH}
}

# Short for docker-machine
dm () {
  docker-machine $@
}

# Switch docker pointer to another host (dmenv my_remote_host)
dmenv () {
  eval "$(docker-machine env $1)"
}

# eval "$(/usr/local/bin/docker-machine env default --shell=zsh)"

# Useful aliases
alias pad="bundle exec padrino"
alias prake="bundle exec padrino rake"
alias brspec="bundle exec rspec"
alias be="bundle exec"
alias migrations="bundle exec rake ar:migrate && RACK_ENV=test bundle exec rake ar:reset"
alias clean_test="RACK_ENV=test bundle exec padrino rake ar:reset"

alias wakeimac="wakeonlan -i 46.227.149.240 -p 38755 38:c9:86:1b:dc:a1"
eval `/usr/libexec/path_helper -s`

