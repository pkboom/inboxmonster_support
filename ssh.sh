#!/bin/sh

echo "Generating a new SSH key for GitHub..."

ssh-keygen -t ed25519 -C "rendering@inboxmonster.com"

eval "$(ssh-agent -s)"

touch ~/.ssh/config

echo "Host github.com\n  AddKeysToAgent yes\n  IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config

ssh-add ~/.ssh/id_ed25519

echo
echo "Copying SSH key to clipboard..."
echo "pbcopy < ~/.ssh/id_ed25519.pub"

echo
echo "Register new ssh key as deploy key on github."
