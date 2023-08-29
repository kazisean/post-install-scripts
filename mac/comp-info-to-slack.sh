#!/bin/bash

## This script can be used to store important computer information in a Slack server.

# ENTER YOUR Slack webhook URL!!!
webhook_url="ENTER-YOUR-OWN-SLACK-WEBHOOK-URL-HERE"

# Gather computer information
computer_name=$(scutil --get ComputerName)
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $4}')
os_version=$(sw_vers -productVersion)
mac_address=$(ifconfig en0 | awk '/ether/ {print $2}')
computer_model=$(sysctl -n hw.model)
ram_gb=$(sysctl -n hw.memsize | awk '{print int($1/1024/1024/1024)}')  # Convert RAM to GB
disk_space=$(df -H / | awk '/\// {print $2}')

# Create JSON payload
payload="{
  \"text\": \"Computer name: $computer_name\\nManufacturer: Apple\\nSerial Number: $serial_number\\nOperating System: $os_version\\nMac Address: $mac_address\\nComputer Model: $computer_model\\nRAM: ${ram_gb}GB\\nDisk Space: ${disk_space}B\"
}"

# Send message to Slack
response=$(curl -s -X POST -H 'Content-type: application/json' --data "$payload" "$webhook_url")

# Check if message was sent successfully
if [ "$response" = "ok" ]; then
  echo "Computer Information has been successfully sent to your Slack!"
else
  echo "Failed to send computer information to Slack."
fi

# Script ends automatically after completion
exit 0