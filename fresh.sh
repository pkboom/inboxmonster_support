#!/bin/bash

echo "Setting up Mac..."

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/usr/local/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

brew update
brew tap homebrew/bundle
brew bundle --file ./Brewfile

mkdir $HOME/code

git clone git@github.com:InboxMonster/rendering-ios.git $HOME/code/rendering-ios

cd $HOME/code/rendering-ios

npm i

npm install pm2@latest -g

GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}oh my zsh${NC} installed"
echo -e "${GREEN}brew${NC} installed"
echo -e "${GREEN}applications${NC} installed"
echo -e "${GREEN}rendering-ios${NC} cloned"
echo -e "${GREEN}npm dependencies${NC} installed"
echo -e "${GREEN}pm2${NC} installed"
echo -e "${GREEN}✓ Done${NC}"

read -p "Press enter to continue"

source $HOME/.macos
