#!/bin/zsh

# Written by: Kazi Hossain
# Source : https://github.com/kazisean/Lan-made-easy


# Temporary file name for downloaded package
pkgFile="TeamViewerHost.dmg"

# Process name of running app (check first to avoid installing while running)
appProcess="TeamViewer"

# This is the full download URL to the TeamViewer Host
url="https://download.teamviewer.com/download/TeamViewerHost.dmg"

# Check for the running process first
echo "Checking for process '$appProcess'"
if [[ $(/usr/bin/pgrep "$appProcess") = "" ]]; then
    echo "Verified '$appProcess' process is not running"
else
    echo "Application is running. Aborting installation."
    exit 1
fi

# Create a temporary working directory
echo "Creating working directory '$tempDirectory'"
workDirectory=$(/usr/bin/basename $0)
tempDirectory=$(/usr/bin/mktemp -d "/private/tmp/$workDirectory.XXXXXX")

# Change directory to the temporary working directory
echo "Changing directory to working directory '$tempDirectory'"
cd "$tempDirectory"

# Download the installer package
echo "Downloading package $pkgFile"
/usr/bin/curl "$url" \
    --location \
    --silent \
    --output "$pkgFile"

# Mount the DMG and copy the app to the Applications folder
echo "Mounting DMG and copying application to /Applications"
/usr/bin/hdiutil attach "$pkgFile"
/usr/bin/sudo /usr/bin/ditto "/Volumes/TeamViewer/TeamViewer Host.app" "/Applications/TeamViewer Host.app"
/usr/bin/hdiutil detach "/Volumes/TeamViewer"

# Remove the temporary working directory when done
/bin/rm -Rf "$tempDirectory"
echo "Deleting working directory '$tempDirectory' and its contents"

echo "Setting up necessary permission"


# Define the application bundle identifier for TeamViewer
teamviewer_bundle_id="com.teamviewer.TeamViewer"

# Function to restart TeamViewer
restart_teamviewer() {
  if [[ -n $(pgrep TeamViewer) ]]; then
    echo "Restarting TeamViewer..."
    killall TeamViewer
    open -a TeamViewer
  else
    echo "TeamViewer is not currently running."
  fi
}

# Grant Screen Recording permissions to TeamViewer
tccutil reset ScreenCapture "$teamviewer_bundle_id"

# Grant Accessibility permissions to TeamViewer
tccutil reset Accessibility "$teamviewer_bundle_id"

# Grant Full Disk Access permissions to TeamViewer
tccutil reset SystemPolicyAllFiles "$teamviewer_bundle_id"

# Restart TeamViewer
restart_teamviewer

echo "TeamViewer is now Setup"

exit 0
