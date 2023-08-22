#!/bin/bash

## This script can be used to store important computer information in a slack server. For more information read : READING LINK THIS SCRIPT ADD

# ENTER YOUR Slack webhook URL!!!
webhook_url="ENTER-YOUR-OWN-SLACK-WEEBHOOK-URL-HERE"


# Gather computer information
computer_name=$(scutil --get ComputerName)
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $4}')
os_version=$(sw_vers -productVersion)
mac_address=$(ifconfig en0 | awk '/ether/ {print $2}')
computer_model=$(sysctl -n hw.model)
ram=$(sysctl -n hw.memsize | awk '{print int($1/1024/1024)}')
disk_space=$(df -H / | awk '/\// {print $2}')


# Sending team TEAM VIEWER id
TEAMVIEWER_ID=$(osascript <<EOD
tell application "TeamViewer"
    activate
    delay 2
    set teamViewerID to (do shell script "/Applications/TeamViewer.app/Contents/MacOS/TeamViewer info | grep 'TeamViewer ID:' | awk -F' ' '{print \$3}'")
    return teamViewerID
end tell
EOD)

# if problem with getting TEAM VIEWER id

if [[ -n "$TEAMVIEWER_ID" ]]; then
    echo "TeamViewer ID: $TEAMVIEWER_ID"
else
    echo "Failed to retrieve TeamViewer ID."
    exit 1
fi


# Create JSON payload
payload="{
  \"text\": \"Computer name: $computer_name\\nManufacturer: Apple\\nSerial Number: $serial_number\\nOperating System: $os_version\\nMac Address: $mac_address\\nComputer Model: $computer_model\\nRam: ${ram}MB\\nDisk Space: ${disk_space}B\\nTeamViewer ID: $TEAMVIEWER_ID\"
}"

# Send message to Slack
response=$(curl -s -X POST -H 'Content-type: application/json' --data "$payload" "$webhook_url")

# Check if message was sent successfully
if [ "$response" = "ok" ]; then
  echo "Computer Information has been successfully sent to your slack!"
else
  echo "Failed to send computer information to Slack."
fi
