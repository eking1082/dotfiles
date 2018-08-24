ZSH_THEME="refined"

plugins=(
  git
)

export EDITOR=nvim

alias vim='nvim'

case `uname` in
  Darwin)
    export ZSH="/Users/evan.king/.oh-my-zsh"
    export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
  ;;
  Linux)
    export ZSH="/home/evan/.oh-my-zsh"
  ;;
esac

source $ZSH/oh-my-zsh.sh
