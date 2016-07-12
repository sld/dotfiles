export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


function symlink_dotfiles {
  # Git
  echo 'Symlinking git dotfiles'
  ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
  ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~


  # Zsh
  echo 'Symlinking zsh dotfiles'
  ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~
}

function install_docker {
	curl -L https://get.docker.com/ | bash
}

function install_rvm {
  curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
  rvm install ruby-2.3.1
}

function install_python {
  curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
  pyenv update
  pyenv install 3.5.2
  pyenv global 3.5.2
}

function apply_sublime_config {
  echo 'Applying sublime config...'
  st=$(pwd)/sublime/packages
  as="$HOME/.config/sublime-text-3/Packages"
  asprefs="$as/User/Preferences.sublime-settings"
  if [[ -d "$as" ]]; then
    for theme in $st/Theme*; do
      cp -r $theme $as
    done
    rm $asprefs
    cp -r $st/pm-themes $as
  else
    echo "Install Sublime Text http://www.sublimetext.com"
  fi
}

function copy_ets_hosts {
	echo 'Copying /etc/hosts'
	sudo cp etc/hosts /etc/hosts
}

function install_stuff {
	sudo apt-get install htop nano wget zsh
	install_rvm
	install_python
	install_docker
	apply_sublime_config
}

install_stuff
symlink_dotfiles
copy_ets_hosts
