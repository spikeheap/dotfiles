# ~/.zshrc — interactive shells. Shell options, completions, plugins (antidote),
# prompt (starship) and keybindings. Per-tool and vendor snippets live in
# ~/.config/zsh/conf.d/*.zsh and are sourced near the end of this file.
#
# oh-my-zsh was removed in favour of antidote + starship; see README.md.

# --- shell options ---------------------------------------------------------
setopt rm_star_silent          # don't prompt for confirmation on `rm *`

# --- eval cache ------------------------------------------------------------
# `eval "$(tool init)"` forks a process every startup (~30-40ms each). Cache the
# output and source it instead; regenerate only when the tool is upgraded
# (binary newer than the cache).
_cache_eval() {
  local name=$1; shift
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/init-$name.zsh"
  local prog=$(command -v "$1")
  if [[ -n $prog && ( ! -s $cache || $prog -nt $cache ) ]]; then
    mkdir -p "${cache:h}"
    "$@" >| "$cache" 2>/dev/null
  fi
  [[ -s $cache ]] && source "$cache"
}

# --- completions -----------------------------------------------------------
# Extra completion dirs on fpath, then a single compinit. The dump is rebuilt
# at most once a day; otherwise we skip the (slow) security audit with -C.
[[ -n ${HOMEBREW_PREFIX:-} ]] && FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"
fpath=("$HOME/.local/share/zsh/site-functions" $fpath)   # sentry completions
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# --- plugins (antidote, static bundle) -------------------------------------
# Generate a static plugin file from plugins.txt and source that directly —
# much faster than antidote's dynamic `load`. Regenerated only when the list
# changes; antidote is autoloaded (cheaper than sourcing antidote.zsh).
ANTIDOTE_FUNCS="${HOMEBREW_PREFIX:-/opt/homebrew}/share/antidote/functions"
if [[ -d $ANTIDOTE_FUNCS ]]; then
  fpath+=("$ANTIDOTE_FUNCS")
  autoload -Uz antidote
  zsh_plugins_txt="$HOME/.config/zsh/plugins.txt"
  zsh_plugins_zsh="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/plugins.zsh"
  if [[ ! $zsh_plugins_zsh -nt $zsh_plugins_txt ]]; then
    mkdir -p "${zsh_plugins_zsh:h}"
    antidote bundle <"$zsh_plugins_txt" >| "$zsh_plugins_zsh"
  fi
  source "$zsh_plugins_zsh"
  unset zsh_plugins_txt zsh_plugins_zsh
fi

# --- prompt (starship) -----------------------------------------------------
# Config: ~/.config/starship.toml. For historical reference, the previous
# oh-my-zsh robbyrussell theme was:
#   PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#   PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
#   ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#   ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#   ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#   ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
_cache_eval starship starship init zsh

# --- help ------------------------------------------------------------------
unalias run-help 2>/dev/null
autoload -Uz run-help
[[ -n ${HOMEBREW_PREFIX:-} ]] && HELPDIR="$HOMEBREW_PREFIX/share/zsh/help"

# --- keybindings -----------------------------------------------------------
bindkey "\e\e[D" backward-word     # Option-Left  → previous word
bindkey "\e\e[C" forward-word      # Option-Right → next word

# --- per-tool / vendor snippets -------------------------------------------
# Each file owns one tool (mise, atuin, 1password, sentry, docker, claude) plus
# personal aliases. (N) avoids an error when the glob matches nothing.
for _f in "$HOME"/.config/zsh/conf.d/*.zsh(N); do
  source "$_f"
done
unset _f
