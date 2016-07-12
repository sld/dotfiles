export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


function install_zsh {
  git submodule init
  git submodule update

  # Zsh
  echo 'Symlinking zsh dotfiles'
  ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~

  chsh -s $(which zsh)
  # sudo reboot now
}

function symlink_git_dotfiles {
  # Git
  echo 'Symlinking git dotfiles'
  ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
  ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
}

function install_docker {
	curl -L https://get.docker.com/ | bash
}

function install_rvm {
  curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
  rvm install ruby-2.3.1
}

function install_python {
  sudo mkdir /usr/local/var
  sudo chown -R idris:idris /usr/local/var
  curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

  pyenv install 3.5.2
  pyenv global 3.5.2
}

function apply_sublime_config {
  echo 'Applying sublime config...'
  sublime_dotfiles_path=$(pwd)/sublime
  sublime_system_path="$HOME/.config/sublime-text-3/Packages"
  cp -r $sublime_dotfiles_path/User/* $sublime_system_path/User/
  cp -r $sublime_dotfiles_path/Packages/* $sublime_system_path/
}

function copy_etc_hosts {
	echo 'Copying /etc/hosts'
	sudo cp etc/hosts /etc/hosts
}

function install_stuff {
	sudo apt-get install htop nano wget zsh
  install_zsh
	install_rvm
	install_python
	install_docker
}
install_zsh
install_stuff
symlink_git_dotfiles
copy_etc_hosts
apply_sublime_config
