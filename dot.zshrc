export LANG=ja_JP.UTF-8

export EDITOR="emacs"
export PAGER="lv -c"
alias ls="ls --color"

# main

autoload colors
colors
RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}"
PROMPT="%n@do$ "
bindkey -e                  # emacs keybind

autoload -U compinit
compinit

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash

# history settings

HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 
setopt inc_append_history

# for rbenv
export RBENV=~/.rbenv/bin
export PATH=$RBENV:$PATH
eval "$(rbenv init -)"

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
