#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#export LC_ALL=
PS1='[\u@\h \w]\$ '
export PATH=$PATH:$HOME/bin
export WORKSPACE=$HOME/workspace
export EDITOR=emacs

alias emacs='emacs -nw'
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -A'
#alias vim='TERM=screen-256color vim'
alias vi='vim'
#export TERM='rxvt-unicode-256color'

# Autocomplete
function _work {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(ls ${WORKSPACE})" -- $cur ) )
}

# Convinence function for going to the workspace
function work {
  if [ $1 ]; then
    if [ -d $WORKSPACE/$1 ]; then
      cd $WORKSPACE/$1;
      return 0
    fi
    echo "No workspace named '$1'"
    return 1
  fi
  cd $WORKSPACE
}
complete -F _work work
