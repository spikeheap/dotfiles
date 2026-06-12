# Personal aliases and small functions (interactive shells only).

# Bundler / RSpec
alias be="bundle exec"
alias brspec="bundle exec rspec"

# Docker
alias dc="docker-compose"

# App CLIs
alias bearcli='/Applications/Bear.app/Contents/MacOS/bearcli'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Rubocop with autocorrect on changed / unpushed Ruby files
alias rubocop-uncommitted="git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -a --force-exclusion"
alias rubocop-unpushed="git diff-tree -r --no-commit-id --name-only master@\{u\} head | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -a --force-exclusion"

# Open the current directory in a new VS Code window
code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@"; }
