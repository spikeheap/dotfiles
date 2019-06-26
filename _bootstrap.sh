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

echo "========== install ZSH"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "========== link files"
while read name; do
    source="$PWD/$name"
    target="$HOME/.$name"
    
    rm -rf $target

    ln -s "$source" "$target"
    echo "Linked $source to $target"

done < "$PWD/link-files"

SUBLIME_SETTINGS="$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings" 
if [ -a "$SUBLIME_SETTINGS" ]; then
	mv "$SUBLIME_SETTINGS" "$SUBLIME_SETTINGS.old"
fi
ln -s "$PWD/sublime/Preferences.sublime-settings" "$SUBLIME_SETTINGS"

SUBLIME_PACKAGE_CONTROL_SETTINGS="$HOME/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
if [ -a "$SUBLIME_PACKAGE_CONTROL_SETTINGS" ]; then
	mv "$SUBLIME_PACKAGE_CONTROL_SETTINGS" "$SUBLIME_PACKAGE_CONTROL_SETTINGS.old"
fi
ln -s "$PWD/sublime/Package Control.sublime-settings" "$SUBLIME_PACKAGE_CONTROL_SETTINGS"

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
* Check Backblaze
* Complete Little Snitch installation
* Run flux 
* Run: aws configure
* Add Slack accounts
EOT