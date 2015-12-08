## Brewfile for Homebrew. A load of commands for Homebrew to do
## To run this file use:
##  brew bundle Brewfile

# Bash
#brew install bash
#brew install bash-completion

# ZSH
brew install zsh
brew install zsh-lovers
brew install zsh-completions
brew install zsh-syntax-highlighting

brew install the_silver_searcher

# For building stuff
brew install cmake
brew install ant
brew install autogen

# Basics
brew install automake
brew install freetype
brew install gist
brew install gpg2
#brew install mobile-shell
brew install nmap
brew install s3cmd
brew install tmux
brew install wget
brew install ctags
brew install p7zip
brew install jq
brew install zeromq
brew install qt

# DB
brew install mysql
mkdir -p ~/Library/LaunchAgents/
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

brew install postgresql
mkdir -p ~/Library/LaunchAgents/
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# brew install couchdb
# mkdir -p ~/Library/LaunchAgents/
# ln -sfv /usr/local/opt/couchdb/*.plist ~/Library/LaunchAgents
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.couchdb.plist

# brew install mongo
# mkdir -p ~/Library/LaunchAgents/
# ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

brew install redis

# Git
brew install git
brew install git-flow
brew install git-extras
brew install --HEAD hub

# Node
brew install node
brew install nvm
mkdir ~/.nvm

# Ruby
brew install ruby-build
brew install rbenv
rbenv install 2.2.3
rbenv global 2.2.3

brew install pow
sudo pow --install-system
pow --install-local
sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist
launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist

# Python
brew install python

# Cloudy future
brew install heroku
brew install awscli
# brew install aws-elasticbeanstalk
# Libs
#brew install zmq

#brew install docker
#brew install docker-compose
