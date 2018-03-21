#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
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
    fswatch

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
    java

brew install bash-completion
echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
echo 'export EDITOR="emacs -nw"' >> ~/.bash_profile
