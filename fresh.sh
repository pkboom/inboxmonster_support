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

cp .env.example .env

npm i

npm install pm2@latest -g

ln -sf $(readlink $(which python3)) $(dirname $(which python3))/python
pip3 install pyautogui Pillow opencv-python pytesseract

echo "export PATH=\"\$HOME/Library/Android/sdk/emulator:\$HOME/Library/Android/sdk/platform-tools:\$PATH\"" >>~/.zshrc

GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}✓ Done${NC}"
echo

read -p "Press enter to continue"

source $HOME/.macos
