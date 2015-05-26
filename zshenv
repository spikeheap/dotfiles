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
setjdk 1.7

export TODO="t"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Useful aliases
alias pad="bundle exec padrino"
alias prake="bundle exec padrino rake"
alias usenode='brew unlink iojs && brew link node && echo Updating NPM && npm install -g npm@latest && echo Using Node.js'
alias useio='brew unlink node && brew link --force iojs && echo Updating NPM && npm install -g npm@latest && echo Using io.js'

eval `/usr/libexec/path_helper -s`
