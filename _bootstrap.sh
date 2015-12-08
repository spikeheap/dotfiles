sudo /usr/bin/xcodebuild -license
xcode-select --install

echo "========== install homebrew"
if ! hash brew 2>/dev/null; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "========== brew the world"
source brew_install.sh

echo "========== cask all the things"
source brew_cask_install.sh

echo "========== Ruby global modules"
sudo gem install bundler
bundle install --system

echo "========== node global modules"
npm install -g grunt-cli
npm install -g gulp
npm install -g karma
npm install -g travis
npm install -g yo

# npm install -g ijavascript


echo "========== node global modules"
pip install jupyter

echo "========== Java and Groovy"
curl -s get.gvmtool.net | zsh
source "~/.sdkman/bin/sdkman-init.sh"
sdk install groovy
sdk install gradle

#echo "========== make bash nicer so I don't use ZSH"
#git clone https://github.com/revans/bash-it.git ~/.bash_it

echo "========== and then give up and install ZSH anyway..."
curl -L http://install.ohmyz.sh | sh
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
cd -

echo "========== link files"
while read name; do
    source="$PWD/$name"
    target="$HOME/.$name"
    
    rm -rf $target

    ln -s "$source" "$target"
    echo "Linked $source to $target"

done < "$PWD/link-files"

echo "========== configure preferences"
./osx

echo "========== set up SSH"
ssh-keygen -t rsa -b 4096 -C "ryan@ryanbrooks.co.uk" -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

for ssh_file in ~/Dropbox/ssh_config/*
do
    ln -s $ssh_file "$HOME/.ssh/"
done

echo "========== Check out some useful repos"
mkdir ~/src
cd ~/src
git clone git@github.com:spikeheap/spikeheap.github.io

echo "========== Postinstall steps"
open "/opt/homebrew-cask/Caskroom/backblaze/latest/Backblaze Installer.app"

# Run this last because it reboots the system
open "/opt/homebrew-cask/Caskroom/little-snitch/3.6.1/Little Snitch Installer.app"

echo "========== All done"
cat <<EOT

Now do this manually: 
* Set up Alfred
* Set iTerm to load the preferences from ~/dotfiles/iterm/
* Set SizeUp to start at boot
* Run: aws configure
* Check Backblaze
* Complete Little Snitch installation

EOT