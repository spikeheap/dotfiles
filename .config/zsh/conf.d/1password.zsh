# 1Password CLI plugins (gh, etc.) — shims that fetch credentials on demand.
source "$HOME/.config/op/plugins.sh"

# Inside a `claude` session a GitHub PAT is already exported; prefer it over the
# 1Password gh shim so GH_TOKEN is honoured.
[[ -n ${GH_TOKEN:-} ]] && unalias gh 2>/dev/null
