# MacOS Setup Scripts

These scripts complete my MacOS configuration by changing a bunch of MacOS settings (apply_os_settings.sh) and installing my base applications (install_apps.sh) and then configuring a few apps (apply_app_settings.sh).

This is completely catered to my own taste and installs applications that I use. If you're like to use this form of automated install, go over each script and have a look at the settings it configures and the apps that it installs to personalise it to your needs.

These scripts will work on a freshly installed MacOS device. It uses [Homebrew](https://brew.sh) and the [Mac App Store CLI](https://github.com/mas-cli/mas) to install applications.

# Steps

1. sh install_apps.sh
2. sh app_settings.sh
3. sh os_settings.sh
4. reboot