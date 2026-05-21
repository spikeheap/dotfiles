# dotfiles

Settings I use across Macs. macOS-only.

Replaces <https://ryanbrooks.co.uk/posts/2013-06-10-setting-up-os-x-mountain-lion/>.

## What's in here

- Shell: `zshrc`, `zshenv`, `zprofile`, `asdfrc`, `vimrc`, `jekyllconfig`
- Git: `gitconfig` (plus per-repo overrides via `includeIf`)
- SSH: `ssh/config` (uses 1Password's SSH agent)
- iTerm: `iterm/com.googlecode.iterm2.plist` (loaded via iTerm's "custom folder")
- Sublime Text: `sublime/*.sublime-settings`
- Alfred: `alfred/` (loaded via Alfred's "sync folder")
- Finicky: `finicky.js` (browser router)
- macOS defaults: `osx`
- Packages: `Brewfile`
- `bin/gits`: multi-repo git status summariser (config in `.config/gits/`)

## Fresh install

### 1. SSH key

```bash
ssh-keygen -t ed25519 -C "ryan@slatehorse.com"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

Add it to [GitHub SSH keys](https://github.com/settings/keys).

### 2. Clone and bootstrap

```bash
mkdir -p ~/src && cd ~/src
git clone git@github.com:spikeheap/dotfiles
cd dotfiles
./_bootstrap.sh
```

`_bootstrap.sh` is idempotent. It installs Homebrew, runs `brew bundle`, installs oh-my-zsh and asdf plugins, symlinks dotfiles into `$HOME` (backing up any pre-existing file as `*.bak.<timestamp>`), and applies macOS defaults from `osx`.

### 3. Manual follow-ups

The bootstrap prints these at the end as a reminder:

- **iTerm**: Settings → General → Preferences → tick *Load preferences from a custom folder or URL* → point at `~/src/dotfiles/iterm`, tick *Save changes to folder when iTerm quits*.
- **Alfred**: Settings → Advanced → *Set sync folder* → `~/src/dotfiles/alfred`. Alfred will copy its bundle there and manage it.
- Disable Spotlight's ⌘-Space, then set Alfred's hotkey to ⌘-Space.
- First-run setup for: Backblaze, Little Snitch, 1Password, Dropbox.
- Sharing → Remote Login (iMac only); set hostname.
- Keyboard → Modifier Keys: Caps Lock → Control.
- Sign in to Slack, Obsidian, etc.

### 4. If you see `compaudit`/`compinit` errors

```bash
chmod 755 /opt/homebrew/share
```

## Layout

```
.
├── Brewfile               # brew bundle
├── _bootstrap.sh          # idempotent installer
├── osx                    # macOS defaults (defaults write …)
├── .config/gits/          # linked to ~/.config/gits
├── alfred/                # Alfred sync folder (Alfred writes into here)
├── bin/                   # added to PATH via zshenv
├── git/                   # untracked: per-repo overrides
├── iterm/                 # iTerm custom-folder source
├── ssh/config             # linked to ~/.ssh/config
└── sublime/               # linked into ~/Library/Application Support/Sublime Text/Packages/User/
```

## Thanks

Originally cribbed from [George Hickman's dotfiles](https://github.com/ghickman/dotfiles) and [Mathias Bynens's macOS defaults](https://github.com/mathiasbynens/dotfiles/blob/main/.macos).
