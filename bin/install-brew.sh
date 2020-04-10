#!/bin/bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install what we need
brew install \
    coreutils \
    zsh
    git \
    node \
    wget \
    nvm \
    pandoc \
    openssl \
    python \
    rclone \
    rsync \
    shellcheck \
    clamav \
		neovim \
		fzf \
		riprep

# install from 3rd party repo
brew tap caskroom/caskroom
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install firefox
brew cask install spotify
brew cask install virtualbox
brew cask install docker

# Remove outdated versions from the cellar.
brew cleanup
