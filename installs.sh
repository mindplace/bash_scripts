#!/bin/bash

# If on a mac: xcode
xcode-select --install

# homebrew ------------------------------------------------------------------------------------------
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# git ------------------------------------------------------------------------------------------
brew install git

# setup Git -- but then do my own update for the ~/.gitconfig file:
git clone https://github.com/supertopher/dotfiles.git
cd dotfiles
./install

# configure git, then generate and add SSH key of comp to github, and use homebrew to setup password caching
git config --global user.name "Esther Leytush"
git config --global user.email eleytush@gmail.com

# Ruby ------------------------------------------------------------------------------------------

# install Rbenv (choose this or RVM, they can't both work together)
brew install ruby-build

# install current Ruby version
rbenv install 2.3.0
rbenv global 2.3.0

# Other ------------------------------------------------------------------------------------------

# Node.js
brew install node

# SQLite3
brew install SQLite3
brew link sqlite3 --force

# PostgreSQL
brew install postgres
mkdir -p $HOME/Library/LaunchAgents
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew/mxcl.postgresql.plist

# Have issues? Some help with PostgreSQL:
#  http://stackoverflow.com/questions/7975414/how-to-check-status-of-postgresql-server-mac-os-x
#  http://stackoverflow.com/questions/7975556/how-to-start-postgresql-server-on-mac-os-x
#  https://chartio.com/resources/tutorials/how-to-start-postgresql-server-on-mac-os-x/

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
