# Open a zsh shell inside a devcontainer (defaults to the current directory).
dcsh() {
  local dir="${1:-.}"; shift 2>/dev/null
  devcontainer up --workspace-folder "$dir" || return
  devcontainer exec --workspace-folder "$dir" "${@:-zsh}"
}
