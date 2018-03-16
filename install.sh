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
     watson

brew cask install \
     iterm2 \
     skype \
     chromium \
     emacs \
     java \
     docker \
     firefox \
     torbrowser \
     visual-studio-code

brew install bash-completion
echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
echo 'export EDITOR="emacs -nw"' >> ~/.bash_profile
