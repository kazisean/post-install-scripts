#!/bin/bash

# This script will silently download and install Google Chrome

# Download and mount Google Chrome DMG
curl -sLo /tmp/Google\ Chrome.dmg https://dl.google.com/chrome/mac/universal/stable/CHFA/googlechrome.dmg;
hdiutil attach -quiet /tmp/Google\ Chrome.dmg;

# Install Google Chrome silently
ditto -rsrc "/Volumes/Google Chrome/Google Chrome.app" "/Applications/Google Chrome.app";

# Capture the installation status
install_status=$?

# Unmount DMG and clean up
hdiutil detach -quiet "/Volumes/Google Chrome";
rm -f /tmp/Google\ Chrome.dmg;

if [ $install_status -eq 0 ]; then
    echo "Chrome is now installed."
else
    echo "Chrome installation failed."
fi

# Script ends automatically after completion
exit 0