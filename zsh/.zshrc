export ZSH=$HOME/.oh-my-zsh

export EDITOR='subl -w'
export PATH="/usr/local/bin:$PATH"


# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

ZSH_THEME="miloshadzic"

plugins=(git ruby rails rvm osx sublime
         brew bundler capistrano gem knife
         python)

source $ZSH/oh-my-zsh.sh

source $(brew --prefix nvm)/nvm.sh

# Boot2Docker
# $(boot2docker shellinit)
