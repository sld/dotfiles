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

function install_brew {
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
    brew install brew-cask
    brew tap caskroom/versions
    brew tap homebrew/dupes
    brew update
    brew doctor
  fi
}

function install_rvm {
  curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
}


symlink_dotfiles


# /etc/hosts
echo 'Copying /etc/hosts'
sudo cp etc/hosts /etc/hosts


# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  xcode-select --install

  install_brew

  brew install htop nano wget
  brew install git
  brew install nginx node
  brew install pyenv

  install_rvm
  rvm install ruby-2.1.1p76

  brew cask install dropbox
  brew cask install firefox
  brew cask install sublime-text3

  brew cask install dash divvy

  brew cask install libreoffice
  brew cask install toggl slack
  brew cask install skype
  brew cask install iterm2
fi



echo 'Applying sublime config...'
  st=$(pwd)/sublime/packages
  as="$HOME/Library/Application Support/Sublime Text 3/Packages"
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
