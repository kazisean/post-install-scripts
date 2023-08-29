#!/bin/bash

# Print current computer name
current_name=$(scutil --get ComputerName)
echo "Current computer name: $current_name"

# Display menu and get user's choice
echo "Options:"
echo "1. Keep current name"
echo "2. Change computer name"
read -p "Enter your choice (1 or 2): " choice

if [[ $choice == "1" ]]; then
    echo "Keeping current name: $current_name"
elif [[ $choice == "2" ]]; then
    read -p "Enter a new computer name: " new_name
    sudo scutil --set ComputerName "$new_name"
    sudo scutil --set HostName "$new_name"
    sudo scutil --set LocalHostName "$new_name"
    echo "Computer name changed to: $new_name"
else
    echo "Invalid choice. Exiting."
fi

# Script ends automatically after completion
exit