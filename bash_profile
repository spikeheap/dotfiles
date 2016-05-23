#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='minimal'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/local/bin/subl"
export GIT_EDITOR='vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK


# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

# Miscellaneous settings for compilation and editing
export EDITOR=vim
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=192m"
#export LC_ALL="en_GB.UTF-8"
export HISTCONTROL=ignoredups:ignorespace

# Configure EC2 configuration for command line tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH=$PATH:$JAVA_HOME/bin

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Useful aliases
alias pad="bundle exec padrino"
alias prake="bundle exec padrino rake"


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/rb/.gvm/bin/gvm-init.sh" ]] && source "/Users/rb/.gvm/bin/gvm-init.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Volumes/Twilight/Users/rb/.sdkman"
[[ -s "/Volumes/Twilight/Users/rb/.sdkman/bin/sdkman-init.sh" ]] && source "/Volumes/Twilight/Users/rb/.sdkman/bin/sdkman-init.sh"
