#!/bin/bash

osascript -e 'tell application "Docker Desktop" to quit' 2>/dev/null;
osascript -e 'tell application "Slack" to quit' 2>/dev/null
osascript -e 'tell application "DBeaver" to quit' 2>/dev/null
osascript -e 'tell application "iTerm2" to quit' 2>/dev/null
osascript -e 'tell application "Visual Studio Code" to quit' 2>/dev/null