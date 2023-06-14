#!/bin/bash

echo "Setting up Mac..."

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew tap homebrew/bundle
brew bundle --file ./Brewfile_web

mkdir $HOME/code

git clone git@github.com:InboxMonster/rendering-ios.git $HOME/code/rendering-ios

cd $HOME/code/rendering-ios

npm i

npm install pm2@latest -g

GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}✓ Done${NC}"
echo

read -p "Press enter to continue"

source $HOME/.macos
