# Profile for iMac/Macbook Air

# Include Boxen goodness
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Set up the PATH
#export PATH=~/bin:$PATH
#export PATH=~/Dropbox/scripts:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=~/.rbenv/shims:$PATH

# Set the Git home
export GITHOME=$(brew --prefix)

# Set the console to display some additional information including Git repository
#PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '
#PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

#export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxcgcdabagacad

## Git BASH completion
#if [ -f `brew --prefix`/etc/bash_completion ]; then
#    . `brew --prefix`/etc/bash_completion
#fi
## Add .bashrc from bin/ (this is on GitHub)
#if [ -f ~/bin/.bashrc ]; then
#  . ~/bin/.bashrc
#fi

# Miscellaneous settings for compilation and editing
export EDITOR=vim
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=192m"
#export LC_ALL="en_GB.UTF-8"
export HISTCONTROL=ignoredups:ignorespace

# Add the log parser to the path for Perl5
export PERL5LIB=~/projects/GDS-Green/log_parser/perl_modules/lib

# Configure groovy
export GROOVY_HOME=/usr/local/Cellar/groovy/2.0.5/libexec

# Configure EC2 configuration for command line tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH=$PATH:$JAVA_HOME/bin

export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_URL=https://eu-west-1.ec2.amazonaws.com
export AWS_ACCESS_KEY="AKIAIIL2VVZN5B4JGZ2Q"
export AWS_SECRET_KEY="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"
export ATLAS_HOME=/usr/local/Cellar/atlassian-plugin-sdk/4.1.7/libexec

