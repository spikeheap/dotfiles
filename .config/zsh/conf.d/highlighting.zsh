# Syntax highlighting colours (fast-syntax-highlighting, loaded earlier in
# ~/.zshrc). Commands default to green, which sits close to the yellow used for
# strings. Use blue for clearer contrast. Unknown commands stay red and bold.
(( ${+FAST_HIGHLIGHT_STYLES} )) || return

for _k in command alias builtin function precommand hashed-command suffix-alias; do
  FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}$_k]='fg=blue'
done
unset _k
