dotfiles
========

Miscellaneous settings files I use across systems. Mostly OSX-specific.

This setup replaces https://ryanbrooks.co.uk/posts/2013-06-10-setting-up-os-x-mountain-lion/.

# To get up and running

From a fresh OSX install:

- Copy your SSH key with `cat .ssh/id_rsa.pub | pbcopy`.
- Add that SSH key to your [GitHub SSH keys](https://github.com/settings/keys).
- Clone this repo with:
  - `mkdir src && cd src` 
  - `git clone git@github.com:spikeheap/dotfiles` (and install XCode tools while you're at it).
- In the repo run `./_bootstrap.sh`.

After that you'll probably want to do a couple of manual tasks:

- Set up Little Snitch:
  - '/usr/local/Caskroom/little-snitch/*/LittleSnitch-*.dmg/Little\ Snitch\ Installer.app'
- Install your purchased software from the App Store.
- Enable your mail accounts in Settings -> Internet Accounts.
- Settings -> Notifications -> Mail -> set to none
- To install and/or use little-snitch you may need to enable its kernel extension in: System Preferences → Security & Privacy → General
- Set up Backblaze
  - `/usr/local/Caskroom/backblaze/latest/Backblaze\ Installer.app`
  - Enable Full-Disk Access: `System Preferences → Security & Privacy → Privacy → Full Disk Access`
  - Inherit backup state, if this is a rebuild
- Set up Alfred
  - Disable Spotlight's ⌘-space keyboard shortcut.
  - Configure Alfred to use ⌘-space.
- Set SizeUp to start at boot
- Set iTerm to load the preferences from ~/dotfiles/iterm/
- Configure ZSH to be the default terminal (if it has not automatically done this): `chsh -s $(which zsh)`
- Complete Little Snitch installation
- Run flux 
- Add Slack accounts
- Sharing: enable remote login (on iMac only) and set hostname.
- Keyboard: Modifier Keys: Caps Lock to Command (Saves hitting caps lock by mistake)

# Thanks

A lot of the auto-brewing has been stolen gratuitously from [George Hickman](https://github.com/ghickman/dotfiles). Cheers!
