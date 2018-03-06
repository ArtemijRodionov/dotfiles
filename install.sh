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

brew cask install \
     iterm2 \
     skype \
     chromium \
     emacs \
     java \
     docker \
     firefox \
     torbrowser
