#!/bin/bash

# This script will silently download and install Google Chrome on a fresh installation of Mac OS.

# Download and mount Google Chrome DMG
curl -sLo /tmp/Google\ Chrome.dmg https://dl.google.com/chrome/mac/universal/stable/CHFA/googlechrome.dmg;
hdiutil attach -quiet /tmp/Google\ Chrome.dmg;

# Install Google Chrome silently
ditto -rsrc "/Volumes/Google Chrome/Google Chrome.app" "/Applications/Google Chrome.app";

# Unmount DMG and clean up
hdiutil detach -quiet "/Volumes/Google Chrome";
rm -f /tmp/Google\ Chrome.dmg;

echo "Chrome is now installed"
