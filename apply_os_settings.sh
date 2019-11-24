#! /usr/bin/env bash

# Apply machine hostname

read -p "What is this machine's name (Example: \"ernie\")? " mac_os_name
if [[ -z "$mac_os_name" ]]; then
    printf "ERROR: Invalid MacOS name.\n"
    exit 1
fi

printf "Setting system label and name...\n"
sudo scutil --set ComputerName $mac_os_name
sudo scutil --set HostName $mac_os_name
sudo scutil --set LocalHostName $mac_os_name
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $mac_os_name

#printf "Getting rid of enrollment agent..\n"
#sudo launchctl remove com.apple.ManagedClientAgent.enrollagent
#sudo launchctl unload com.apple.ManagedClientAgent.enrollagent

printf "Disabling guest user..\n"
sudo dscl . -delete /Users/Guest
sudo security delete-generic-password -a Guest -s com.apple.loginwindow.guest-account -D "application password" /Library/Keychains/System.keychain
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool FALSE

# Applies system and application defaults.

printf "System - Setting date and time format\n"
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm:ss"

printf "System - Enaling Dark mode\n"
defaults write NSGlobalDomain AppleInterfaceStyle Dark

printf "System - Setting accent colour mode\n"
defaults write NSGlobalDomain AppleAccentColor -int 6

printf "System - Enabling tap to click\n"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

printf "System - Silencing click\n"
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

printf "System - Expand save panel by default\n"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

printf "System - Avoid creating .DS_Store files on network & USB volumes\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

printf "Bluetooth - Increase sound quality for headphones/headsets\n"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

printf "System - Minimize to application\n"
defaults write com.apple.dock minimize-to-application -bool true

printf "Dock - Don't show recently used apps"
defaults write com.apple.dock show-recents -bool false

printf "iTunes - Disable autosync\n"
defaults write com.apple.itunes dontAutomaticallySyncIPods -bool true

printf "iCloud - Save to disk by default\n"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

printf "Finder - Show the $HOME/Library folder\n"
chflags nohidden $HOME/Library

printf "Finder - Show hidden files\n"
defaults write com.apple.finder AppleShowAllFiles -bool true

printf "Finder - Show filename extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "Finder - Disable the warning when changing a file extension\n"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "Finder - Show path bar\n"
defaults write com.apple.finder ShowPathbar -bool true

printf "Finder - Show status bar\n"
defaults write com.apple.finder ShowStatusBar -bool true

printf "Finder - Use list view in all Finder windows\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "Finder - Allow text selection in Quick Look\n"
defaults write com.apple.finder QLEnableTextSelection -bool true

printf "Safari - Set home page to 'about:blank' for faster loading\n"
defaults write com.apple.Safari HomePage -string "about:blank"

printf "Safari - Use Contains instead of Starts With in search banners\n"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

printf "Safari - Enable debug menu\n"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

printf "Safari - Enable the Develop menu and the Web Inspector\n"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

printf "Safari - Add a context menu item for showing the Web Inspector in web views\n"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

printf "Disk Utility - Enabling debug menu\n"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

printf "TextEdit - Use plain text mode for new documents\n"
defaults write com.apple.TextEdit RichText -int 0

printf "TextEdit - Open and save files as UTF-8 encoding\n"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

printf "Printer - Expand print panel by default\n"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

printf "Printer - Automatically quit printer app once the print jobs complete\n"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

printf "App Store - Enable the WebKit Developer Tools in the Mac App Store\n"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

printf "App Store - Enable Debug Menu in the Mac App Store\n"
defaults write com.apple.appstore ShowDebugMenu -bool true

printf "Removing unused dock icons\n"
dockutil --remove 'Siri'
dockutil --remove 'Launchpad'
dockutil --remove 'Safari'
dockutil --remove 'Mail'
dockutil --remove 'Contacts'
dockutil --remove 'Calendar'
dockutil --remove 'Notes'
dockutil --remove 'Reminders'
dockutil --remove 'Maps'
dockutil --remove 'Photos'
dockutil --remove 'FaceTime'
dockutil --remove 'News'
dockutil --remove 'iTunes'
dockutil --remove 'App Store'
dockutil --remove 'System Preferences'

printf "Setting dock icons\n"
dockutil --add /Applications/Google\ Chrome.app --position 1
dockutil --move 'Messages' --position 2
dockutil --add /Applications/Telegram.app --position 3
dockutil --add /Applications/Spotify.app --position 4
dockutil --add /Applications/Sublime Text.app --position 5
dockutil --add /Applications/iTerm.app --position 6

printf "You should reboot now\n"