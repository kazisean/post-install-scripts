#!/bin/bash

# Check for software updates
updates=$(softwareupdate -l | grep -c "Software Update found")

if [ "$updates" -gt 0 ]; then
    echo "Updates available. Installing..."
    sudo softwareupdate -ia
    sudo softwareupdate --schedule off
    sudo reboot now
else
    echo "MacOS is up to date. Currently running $(sw_vers -productName) $(sw_vers -productVersion)"
fi
