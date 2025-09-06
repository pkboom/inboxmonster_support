#!/bin/bash

apps=(
  "Docker Desktop"
  "Slack"
  "DBeaver"
  "iTerm2"
  "Visual Studio Code"
  "Clock"
)

for app in "${apps[@]}"; do
  osascript -e "tell application \"$app\" to quit" 2>/dev/null || killall "$app" 2>/dev/null
done