#!/bin/sh

# Keep the app switcher (cmd-tab) locked to primary display
defaults write com.apple.Dock appswitcher-all-displays -bool true
# Don't let the dock jump to non primary monitor
defaults write com.apple.Dock allow-display-switching -bool false

killall Dock
