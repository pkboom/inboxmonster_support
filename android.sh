#!/bin/bash

brew install Python
ln -sf $(readlink $(which python3)) $(dirname $(which python3))/python
pip3 install pyautogui Pillow opencv-python

brew install cliclick

brew tap homebrew/cask-versions
brew install android-studio-preview-beta

echo "export PATH=$HOME/Library/Android/sdk/emulator:$PATH" >>~/.zshrc

GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Python and dependencies${NC} installed"
echo -e "${GREEN}cliclick${NC} installed"
echo -e "${GREEN}android-studio-preview-beta${NC} installed"
echo -e "${GREEN}emulator path${NC} exported"
echo
echo -e "Go to ${GREEN}https://github.com/InboxMonster/rendering-ios/tree/main/android#set-up-emulator-and-app${NC}"
