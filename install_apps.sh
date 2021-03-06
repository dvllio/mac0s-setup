#! /usr/bin/env bash

# Installs Homebrew software.

if ! command -v brew > /dev/null; then
    ruby -e "$(curl --location --fail --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
    export PATH="/usr/local/bin:$PATH"
    printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

printf "Updating brew\n"
brew upgrade && brew update

printf "Installing xcode cli utils\n"
xcode-select --install

printf "brew: Installing cli packages\n"
brew tap homebrew/cask-drivers
brew tap homebrew/cask-versions
brew install git
brew install mas            # Apple store cli  
brew install wget
brew install htop
brew install dockutil
brew install zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting 

printf "brew: Installing apps\n"
brew cask install iterm2
brew cask install google-chrome
brew cask install firefox
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install spotify
brew cask install vlc
brew cask install sonos
brew cask install transmission
brew cask install appcleaner
brew cask install cyberduck
brew cask install steam
brew cask install openemu

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
mas install 1116599239

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