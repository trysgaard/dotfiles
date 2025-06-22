#!/bin/bash
# macOS System Preferences
echo "Setting up macOS preferences..."

# Enable Dark Mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Dock preferences
defaults write com.apple.dock orientation left
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Finder preferences
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"  # List view
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Restart affected applications
killall Dock
killall Finder

echo "Setup macOS preferences complete!"
