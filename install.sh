#!/usr/bin/env bash

set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap homebrew/services

brew install \
    git \
    wget \
    gcc \
    curl \
    python3 \
    # time tracker
    watson \
    # file change monitor
    fswatch \
    # paper backup for GPG
    paperkey \
    tmux \
    # conver markup formats
    # it is used in JupyterLab
    pandoc \
    mplayer

brew cask install \
    iterm2 \
    # managing windows size and position
    shiftit \
    docker \
    visual-studio-code \
    skype \
    telegram-desktop \
    firefox \
    chromium \
    torbrowser \
    # utility for keyboard customization
    karabiner-elements

brew install bash-completion

# Allow key repeats
defaults write -g ApplePressAndHoldEnabled -bool true

# View Hidden Files
defaults write com.apple.Finder AppleShowAllFiles YES

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -int 0

# Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Require password immediately after sleep
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

# Turn off annoying notification animation
defaults write com.apple.dock no-bouncing -bool TRUE

# Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

# copy dotfiles to HOME
find src -type f | sed 's/src\///' | xargs -I {} cp src/{} ~/{}

