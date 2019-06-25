## brew caskfile for Homebrew brew cask
## To run this file use:
##  brew bundle brew caskfile

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Install brew cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Grab beta versions
# brew tap brew caskroom/versions

# Dependencies
#brew cask install adobe-air

# Productivity bits
#brew cask install flux
#brew cask install libreoffice
brew cask install alfred
#brew cask install toggldesktop

brew cask install daisydisk

brew cask install dropbox
#brew cask install google-drive

#brew cask install skim


# Security
brew cask install gpgtools

# Backup
brew cask install backblaze

# Network
brew cask install little-snitch
brew cask install cloak
brew cask install wireshark

# Editing stuff
brew cask install sublime-text
brew cask install atom
brew cask install visual-studio-code
# brew cask install balsamiq-mockups
# brew cask install intellij-idea
# brew cask install rubymine
brew cask install omnigraffle
# brew cask install omnifocus
# brew cask install omnioutliner
# brew cask install mactex

# Development
# brew cask install beaker
brew cask install ngrok
# brew cask install screenhero
brew cask install sourcetree

# DB
#brew cask install postico
brew cask install pgadmin4
brew cask install querious

# Languages
brew cask install java
#brew cask install darteditor
#brew cask install rust
#brew cask install scratch

# Geo
#brew cask install gdal-framework matplotlib
#brew cask install qgis

# Utilities
brew cask install 1password
brew cask install qlstephen
brew cask install sizeup
brew cask install transmit

brew cask install iterm2
brew cask install licecap
# brew cask install skitch
# brew cask install sketchup
brew cask install slack
brew cask install telegram
brew cask install skype
# brew cask install gitter
brew cask install vlc


# Browsers
brew cask install firefox
brew cask install google-chrome

# Virtualization
#brew cask install boot2docker
brew cask install docker
# brew cask install vagrant
# brew cask install virtualbox
brew cask install minikube
#brew cask install vmware-fusion
#brew cask install chefdk

# Fun
brew cask install spotify
# brew cask install transmission
#brew cask install transmission-remote-gui
# brew cask install xld
# brew cask install steam
