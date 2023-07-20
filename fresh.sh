#!/bin/bash

echo "Setting up Mac..."

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew tap homebrew/bundle
brew tap homebrew/cask-versions
brew bundle --file ./Brewfile

mkdir $HOME/code

git clone git@github.com:InboxMonster/rendering-ios.git $HOME/code/rendering-ios

cd $HOME/code/rendering-ios

cp .env.example .env

npm i

npm install -g pm2
npm install -g appium
appium driver install xcuitest
appium driver install uiautomator2

pip3 install pyautogui Pillow opencv-python

echo "export PATH=\"\$HOME/Library/Android/sdk/emulator:\$HOME/Library/Android/sdk/platform-tools:\$PATH\"" >>~/.zshrc

GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Installing appium and stuff for ios rendering...${NC}"
echo -e "${GREEN}✓ Done${NC}"
echo

read -p "Press enter to continue"

source $HOME/.macos
