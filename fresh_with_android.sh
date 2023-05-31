#!/bin/bash

echo "Setting up Mac..."

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew tap homebrew/bundle
brew bundle --file ./Brewfile

mkdir $HOME/code

git clone git@github.com:InboxMonster/rendering-ios.git $HOME/code/rendering-ios

cd $HOME/code/rendering-ios

npm i

npm install pm2@latest -g

brew install Python
ln -sf $(readlink $(which python3)) $(dirname $(which python3))/python
pip3 install pyautogui Pillow opencv-python

brew install cliclick

brew tap homebrew/cask-versions
brew install android-studio-preview-beta

echo "export PATH=\"$HOME/Library/Android/sdk/emulator:$HOME/Library/Android/sdk/platform-tools:$PATH\"" >>~/.zshrc

GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}oh my zsh${NC} installed"
echo -e "${GREEN}brew${NC} installed"
echo -e "${GREEN}applications${NC} installed"
echo -e "${GREEN}rendering-ios${NC} cloned"
echo -e "${GREEN}npm dependencies${NC} installed"
echo -e "${GREEN}pm2${NC} installed"
echo -e "${GREEN}Python and dependencies${NC} installed"
echo -e "${GREEN}cliclick${NC} installed"
echo -e "${GREEN}android-studio-preview-beta${NC} installed"
echo -e "${GREEN}emulator path${NC} exported"
echo -e "${GREEN}✓ Done${NC}"
echo
echo -e "Go to ${GREEN}https://github.com/InboxMonster/rendering-ios/tree/main/android#set-up-emulator-and-app${NC}"

read -p "Press enter to continue"

source $HOME/.macos
