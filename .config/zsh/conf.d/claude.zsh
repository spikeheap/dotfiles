# Claude Code helpers.

# Mark the tab for the duration of a Claude session, reverting on exit (even if
# it errors): an orange tab in iTerm2, and an orange background tint in any
# terminal via _term_tint (see terminal.zsh).
claude() {
  printf '\033]6;1;bg;red;brightness;255\a'
  printf '\033]6;1;bg;green;brightness;140\a'
  printf '\033]6;1;bg;blue;brightness;0\a'
  local _CLAUDE_RUNNING=1
  _term_tint
  {
    command claude "$@"
  } always {
    printf '\033]6;1;bg;*;default\a'
    unset _CLAUDE_RUNNING
    _term_tint
  }
}
