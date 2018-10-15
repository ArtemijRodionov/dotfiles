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
    # media player
    mpv \
    # paper backup for GPG
    paperkey \
    tmux

brew cask install \
    iterm2 \
    # managing windows size and position
    shiftit \
    docker \
    emacs \
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
defaults write -g ApplePressAndHoldEnabled -bool false

# View Hidden Files
defaults write com.apple.Finder AppleShowAllFiles YES
killall Finder

# copy dotfiles to HOME
find src -name ".*" -type f -print | xargs -I {} cp {} ~/
