export ZSH=$HOME/dotfiles/oh-my-zsh
export CUSTOM_ZSH=$HOME/dotfiles/zsh

export EDITOR='subl -w'
export PATH="/usr/local/bin:$PATH"

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


ZSH_THEME="miloshadzic"


plugins=(git ruby rails rvm osx sublime
         brew bundler capistrano gem knife)


source $ZSH/oh-my-zsh.sh
source $CUSTOM_ZSH/pyenv.zsh
