#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
PS1='[\u@\h \w]\$ '
export PATH=$PATH:$HOME/bin
export WORKSPACE=$HOME/workspace
export EDITOR=vim
export XDG_MUSIC_DIR=$HOME/music
export XDG_DATA_DIR=$HOME/data
export XDG_CONFIG_HOME=$HOME/.config

alias emacs='emacs -nw'
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -A'
alias vi='vim'
alias fig='docker-compose'

export TERM=rxvt-unicode-256color
[ -n "$TMUX" ] && export TERM=screen-256color

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

source ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
