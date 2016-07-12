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

export DATA_DIR=$HOME/datanight
alias pund='python -m pundle run'
alias ve='vagrant exec'

#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/mineralka/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
export ARTM_SHARED_LIBRARY="/Users/mineralka/Documents/University/Big Data Machine Learning/bigartm-0.7.3/build/src/artm/libartm.dylib"     # for Mac OS X
export PYTHONPATH="/Users/mineralka/Documents/University/Big Data Machine Learning/bigartm-0.7.3/python":$PYTHONPATH
# Add GHC 7.8.4 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Users/mineralka/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

. /Users/mineralka/torch/install/bin/torch-activate

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
