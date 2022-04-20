# We don't need to install XCode, because it will have been installed as part of the git clone action to retrieve
# this repository
# sudo /usr/bin/xcodebuild -license
# xcode-select --install

echo "========== install homebrew"
if ! hash brew 2>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "========== brew the world"
source brew_install.sh

echo "========== cask all the things"
source brew_cask_install.sh

echo "========== Set up language manager ASDF"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf global nodejs latest
asdf global ruby latest

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

SSH_CONFIG_FILE="$HOME/.ssh/config" 
if [ -a "$SSH_CONFIG_FILE" ]; then
	mv "$SSH_CONFIG_FILE" "$SSH_CONFIG_FILE.old"
fi
ln -s "$PWD/ssh/config" "$SSH_CONFIG_FILE"

SUBLIME_SETTINGS="$HOME/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings" 
if [ -a "$SUBLIME_SETTINGS" ]; then
	mv "$SUBLIME_SETTINGS" "$SUBLIME_SETTINGS.old"
fi
ln -s "$PWD/sublime/Preferences.sublime-settings" "$SUBLIME_SETTINGS"

SUBLIME_PACKAGE_CONTROL_SETTINGS="$HOME/Library/Application Support/Sublime Text/Packages/User/Package Control.sublime-settings"
if [ -a "$SUBLIME_PACKAGE_CONTROL_SETTINGS" ]; then
	mv "$SUBLIME_PACKAGE_CONTROL_SETTINGS" "$SUBLIME_PACKAGE_CONTROL_SETTINGS.old"
fi
ln -s "$PWD/sublime/Package Control.sublime-settings" "$SUBLIME_PACKAGE_CONTROL_SETTINGS"

echo "========== configure preferences"
./osx

echo "========== Check out some useful repos"
mkdir ~/src
cd ~/src
git clone git@github.com:spikeheap/spikeheap.github.io

echo "========== Postinstall steps"
open "/opt/homebrew-cask/Caskroom/backblaze/latest/Backblaze Installer.app"

# Run this last because it reboots the system
open "/opt/homebrew-cask/Caskroom/little-snitch/*/Little Snitch Installer.app"



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
