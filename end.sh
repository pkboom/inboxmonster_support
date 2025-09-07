#!/bin/bash

apps=(
  "Docker Desktop"
  "Slack"
  "DBeaver"
  "iTerm2"
  "Visual Studio Code"
)

for app in "${apps[@]}"; do
  osascript -e "tell application \"$app\" to quit" 2>/dev/null || killall "$app" 2>/dev/null
done

apps=(
  "Clock"
  "Spark"
)

for app in "${apps[@]}"; do
    killall -9 "$app" 2>/dev/null
done