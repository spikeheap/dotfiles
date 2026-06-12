# Claude Code helpers.

# Colour the iTerm2 tab orange for the duration of a Claude session, reverting
# on exit (even if it errors).
claude() {
  printf '\033]6;1;bg;red;brightness;255\a'
  printf '\033]6;1;bg;green;brightness;140\a'
  printf '\033]6;1;bg;blue;brightness;0\a'
  {
    command claude "$@"
  } always {
    printf '\033]6;1;bg;*;default\a'
  }
}

# Open a zsh shell inside a devcontainer (defaults to the current directory).
dcsh() { devcontainer exec --workspace-folder "${1:-.}" zsh; }
