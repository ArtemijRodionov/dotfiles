#!/usr/bin/env bash

set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/services
brew tap homebrew/cask-fonts

brew install \
	go \
	rust \
	tmux \
	fzf \
	ripgrep \
	grpcurl \
	direnv \
	jq \
	gojq \
	git-delta \
	nvim \
	helm \
	protobuf \
	k9s

brew cask install \
	iterm2 \
	font-fira-code \
	firefox

# View Hidden Files
defaults write com.apple.finder appleshowallfiles yes

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Turn off annoying notification animation
defaults write com.apple.dock no-bouncing -bool TRUE

# Turn off OS update notification
defaults write com.apple.systempreferences AttentionPrefBundleIDs 0

# Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

# copy dotfiles to HOME
find src -type f | sed 's/src\///' | xargs -I {} cp src/{} ~/{}
