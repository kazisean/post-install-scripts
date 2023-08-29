#!/bin/bash

# Check if TeamViewer is already running
if pgrep TeamViewer &>/dev/null; then
    echo "TeamViewer is already running. Please close it before installing."
    exit 1
fi

# Download TeamViewer DMG
curl -o TeamViewerHost.dmg https://download.teamviewer.com/download/TeamViewerHost.dmg

# Mount the DMG
hdiutil attach TeamViewerHost.dmg

# Install TeamViewer silently
sudo installer -pkg "/Volumes/TeamViewer/Install TeamViewer.app/Contents/Resources/Install TeamViewer.pkg" -target /

# Capture the installation status
install_status=$?

# Unmount the DMG
hdiutil detach "/Volumes/TeamViewer"

# Cleanup: Remove downloaded DMG
rm TeamViewerHost.dmg

if [ $install_status -eq 0 ]; then
    echo "TeamViewer installation completed successfully."
else
    echo "TeamViewer installation failed."
fi

# Script ends automatically after completion
exit 0