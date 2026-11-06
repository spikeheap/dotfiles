# Terminal tab title and background tint. Written for Ghostty, also works in
# iTerm2. Ghostty's own title handling is off (shell-integration-features =
# no-title) so these hooks own the title.

autoload -Uz add-zsh-hook

_term_in_prod() { [[ $PWD == */terraform/envs/production(|/*) ]] }

# --- tab title ---------------------------------------------------------------
# At the prompt: "<last two path parts> · <git branch>". While a command runs:
# the command name (programs like Claude Code then set their own). Inside
# production Terraform the title starts with "⚠ PROD", a cue that doesn't
# depend on colour.
_term_title() {
  local title=${1//[[:cntrl:]]}
  _term_in_prod && title="⚠ PROD · $title"
  print -rn -- $'\e]2;'"$title"$'\a'
}

_term_title_precmd() {
  local branch
  branch=$(git symbolic-ref --short -q HEAD 2>/dev/null ||
           git rev-parse --short HEAD 2>/dev/null)
  _term_title "${(%):-%2~}${branch:+ · $branch}"
}
_term_title_preexec() { _term_title "${1%% *}" }

add-zsh-hook precmd _term_title_precmd
add-zsh-hook preexec _term_title_preexec

# --- background tint ---------------------------------------------------------
# Red background tint for this tab while inside a production Terraform
# directory. The colour is the Catppuccin background mixed with red, picked to
# match whichever theme the Ghostty config uses.
_TERM_GHOSTTY_CONFIG="$HOME/.config/ghostty/config.ghostty"
typeset -g _TERM_TINT=

_term_tint() {
  local want=
  _term_in_prod && want=prod
  [[ $want == $_TERM_TINT ]] && return
  _TERM_TINT=$want

  if [[ -z $want ]]; then
    print -n '\e]111\a'
    return
  fi

  local colour='#6c2546'
  [[ -n ${(M)${(f)"$(<$_TERM_GHOSTTY_CONFIG)"}:#theme = *Latte*} ]] && colour='#eab7cb'
  print -n "\e]11;$colour\a"
}

add-zsh-hook precmd _term_tint
