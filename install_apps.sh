#! /usr/bin/env bash

# Installs Homebrew software.

if test ! $(which brew); then
    /bin/bash -c \
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

printf "Updating brew\n"
brew upgrade && brew update

printf "Installing xcode cli utils\n"
xcode-select --install

printf "brew: Installing cli packages\n"
brew tap homebrew/cask-drivers
brew tap homebrew/cask-versions
brew install git
brew install mas            # Mac App Store CLI
brew install wget
brew install htop
brew install dockutil
brew install zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting 

printf "brew: Installing apps\n"
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask firefox
brew install --cask sublime-text
brew install --cask visual-studio-code
brew install --cask insomnia
brew install --cask spotify
brew install --cask vlc
brew install --cask sonos
brew install --cask transmission
brew install --cask appcleaner
brew install --cask cyberduck
brew install --cask steam
brew install --cask openemu
brew install --cask calibre
brew install --cask zoom
brew install --cask discord

# Installs App Store software.

if ! command -v mas > /dev/null; then
  printf "ERROR: Mac App Store CLI (mas) can't be found.\n"
  printf "       Please ensure Homebrew and mas (i.e. brew install mas) have been installed first."
  exit 1
fi

printf "AppStore: Installing Ampetamine\n"
mas install 937984704

printf "AppStore: Installing Magnet\n"
mas install 441258766

printf "AppStore: Installing The Unarchiver\n"
mas install 425424353

printf "AppStore: Installing NordVPN\n"
mas install 905953485

printf "AppStore: Installing LanScan\n"
mas install 472226235

printf "AppStore: Installing WiFi Explorer\n"
mas install 494803304

printf "AppStore: Installing Microsoft OneDrive\n"
mas install 823766827

printf "AppStore: Installing Slack\n"
mas install 803453959

printf "AppStore: Installing Telegram\n"
mas install 747648890

printf "AppStore: Installing Whatsapp\n"
mas install 1147396723

printf "AppStore: Installing Pixelmator\n"
mas install 407963104

printf "AppStore: Installing Numbers\n"
mas install 409203825

printf "AppStore: Installing iMovie\n"
mas install 408981434

# Install Oh My ZSH and set by default
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
