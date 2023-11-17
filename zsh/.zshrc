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
# Lines configured by zsh-newuser-install
# HISTFILE=~/.config/zsh/.histfile
# HISTSIZE=10000
# SAVEHIST=1000
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '${HOME}/.config/zsh/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
