#!/bin/bash

# last update: 2023-1-19

# Homebrew -------------------------------------------------------------------------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# VSCode ---------------------------------------------------------------------------------------
brew install --cask visual-studio-code

# Finish up: configure VSCode
# Prevent multiple instances https://superuser.com/questions/1264660/how-to-prevent-vs-code-from-opening-multiple-instances-of-a-same-file
# Install 'Atom Dark' extension

# Setup zshrc ----------------------------------------------------------------------------------
touch ~/.zshrc && open -a 'Visual Studio Code' ~/.zshrc # then paste in contents of latest .zshrc file

mkdir ~/src

# Finish up: configure visual settings for terminal

# git ------------------------------------------------------------------------------------------
brew install git

# configure git
touch ~/.gitconfig && open -a 'Visual Studio Code' ~/.gitconfig # then paste in contents of latest .gitconfig file
touch ~/.gitignore && open -a 'Visual Studio Code' ~/.gitignore # then paste in contents of latest .gitignore file

# setup git autocomplete
brew install compinit

# Generate and add SSH key of comp to Github
ssh-keygen -t ed25519 -C "my_email@gmail.com" # at next prompts, press enter
eval "$(ssh-agent -s)"
touch ~/.ssh/config
open -a 'Visual Studio Code' ~/.ssh/config # paste contents from https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub # make into new key on https://github.com/settings/keys

# Ruby ------------------------------------------------------------------------------------------

# install Rbenv (choose this or RVM, they can't both work together)
brew install rbenv

# install current Ruby version
rbenv install -l # and select latest stable Ruby version to install
rbenv install 3.2.0
# set the version installed as the global Ruby version to avoid using the pre-installed Mac-use-only Ruby version
rbenv global 3.2.0 

# Other ------------------------------------------------------------------------------------------

# Node.js
brew install node

# PostgreSQL
brew install postgres
mkdir -p $HOME/Library/LaunchAgents
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew/mxcl.postgresql.plist

# Gems ------------------------------------------------------------------------------------------

# install Bundler
gem install bundler

# install favorite gems
gem install pry
gem install rails
gem install pg

gem install rspec
touch ~/.rspec
echo "--color" >> ~/.rspec
echo "--format documentation" >> ~/.rspec
