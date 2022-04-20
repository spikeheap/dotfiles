dotfiles
========

Miscellaneous settings files I use across systems. Mostly OSX-specific.

This setup replaces https://ryanbrooks.co.uk/posts/2013-06-10-setting-up-os-x-mountain-lion/.

# To get up and running

From a fresh MacOS install:

## Set up SSH keys

```bash
ssh-keygen -t ed25519 -C “ryan@slatehorse.com”
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
cat .ssh/id_ed25519.pub| pbcopy
```

> Thanks to <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>
> 
> SSH-agent defaults are set by the script, so we don't need to worry too much about it for the initial clone of dotfiles.

- Add that SSH key to your [GitHub SSH keys](https://github.com/settings/keys).
- Clone this repo and run things:

```bash
take ~/src
git clone git@github.com:spikeheap/dotfiles

cd dotfiles
./_bootstrap.sh
```

After that you'll probably want to do a couple of manual tasks:

- Check for `compaudit`/`compinit` errors in the terminal 
  - Probably fix the error with: `chmod 755 /opt/homebrew/share`
- Set up Alfred.
  - Disable Spotlight's ⌘-space keyboard shortcut.
  - Configure Alfred to use ⌘-space.
  - Turn on clipboard history.
- Set up Backblaze.
- Set up Little Snitch.
- Install your purchased software from the App Store.
- Enable your mail accounts in Settings -> Internet Accounts.
- Settings -> Notifications -> Mail -> set to none.
- Sharing: enable remote login (on iMac only) and set hostname.
- Keyboard: Modifier Keys: Caps Lock to Command (Saves hitting caps lock by mistake)
- Run flux (or turn on Night Shift)
- Set iTerm to load the preferences from `~/dotfiles/iterm/`.
- Set up Finicky to use config from this repository.
- Set Rectangle to start on boot (in app settings).
- Turn on VSCode sync using GitHub account.
- Add Slack accounts\
- Log into Dropbox and enable sync
- Configure Obsidian

# Thanks

A lot of the auto-brewing has been stolen gratuitously from [George Hickman](https://github.com/ghickman/dotfiles). Cheers!
