#! /usr/bin/env bash

# Apply application settings

printf "Google Chrome - Disabling backswipe\n"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

printf "Transmission - Disabling disclaimers\n"
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

printf "Setting .gitignore\n"
wget -q -P ~/Downloads/ https://raw.githubusercontent.com/dvllio/mac0s-setup/master/dotfiles/.gitignore
mkdir ~/Git
cp ~/Downloads/.gitignore ~/Git/.gitignore
git config --global core.excludesfile ~/Git/.gitignore

printf "Setting .zshrc\n"
wget -q -P ~/Downloads/ https://raw.githubusercontent.com/dvllio/mac0s-setup/master/dotfiles/.zshrc
cp ~/Downloads/.zshrc ~/.zshrc