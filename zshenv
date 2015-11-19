export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH

export DOCKER_HOST=tcp://192.168.99.100:2376 
export DOCKER_CERT_PATH=/Users/rb/.docker/machine/machines/dev 
export DOCKER_TLS_VERIFY=1

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/local/bin/subl"
export GIT_EDITOR='vim'
export GIT_TEMPLATE_DIR=`/Users/rb/.rbenv/shims/overcommit --template-dir`

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
	git co master && git pull
	git co develop && git pull 
	git co ${TMP_INITIAL_BRANCH}
}

# Useful aliases
alias pad="bundle exec padrino"
alias prake="bundle exec padrino rake"
alias brspec="bundle exec rspec"
alias migrations="bundle exec rake ar:migrate && RACK_ENV=test bundle exec rake ar:reset"
alias clean_test="RACK_ENV=test bundle exec padrino rake ar:reset"
eval `/usr/libexec/path_helper -s`
