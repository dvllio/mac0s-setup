#! /usr/bin/env bash

# Apply application settings

printf "Google Chrome - Disabling backswipe\n"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

printf "Sublime Text - Set as default plain text editor\n"
duti -s com.sublimetext.3 public.plain-text all
duti -s com.sublimetext.3 net.daringfireball.markdown all

printf "Transmission - Disabling disclaimers\n"
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false
