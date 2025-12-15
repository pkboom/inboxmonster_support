#!/bin/bash

echo "Setting up Mac..."

read -rp "Press enter to continue."

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
# brew tap homebrew/bundle
brew bundle --file ./Brewfile

# brew tap homebrew/cask
# brew install android-studio-preview-beta

mkdir $HOME/code

# git clone git@github.com:InboxMonster/rendering-ios.git $HOME/code/rendering-ios

cd $HOME/code/rendering-ios

cp .env.example .env

npm i

npm install -g pm2
npm install -g appium@latest
appium driver install xcuitest
appium driver install uiautomator2

pip3 install pyautogui PILLOW opencv-python --break-system-packages --user

# Symlink for java
# You can find this command by running `brew info openjdk`
# sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Installing appium and stuff for ios rendering...${NC}"
echo -e "${GREEN}✓ Done${NC}"
echo

read -rp "Press enter to continue"

source $HOME/.macos
