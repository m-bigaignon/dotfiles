while read file
do
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
aliases
env
keybinds
options
plugins
prompt
theme
utilities
EOF
