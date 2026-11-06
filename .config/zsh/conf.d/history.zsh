# zsh history — plain HISTFILE, searched with fzf (Ctrl-R).
# Replaced atuin in Oct 2026.

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history        # store timestamp + duration
setopt inc_append_history_time # write each command when it finishes
setopt hist_ignore_all_dups    # drop older duplicates
setopt hist_reduce_blanks
setopt hist_ignore_space       # leading space = don't record
setopt hist_verify             # expand !! etc. before running

# fzf: Ctrl-R history, Ctrl-T files, Alt-C cd.
_cache_eval fzf fzf --zsh
