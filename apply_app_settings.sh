#! /usr/bin/env bash

# Apply application settings

printf "Google Chrome - Disabling backswipe\n"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

printf "Transmission - Disabling disclaimers\n"
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false