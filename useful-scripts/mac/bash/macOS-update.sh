#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (sudo)."
    exit 1
fi

# Check for system updates
echo "Checking for system updates..."
update_list=$(softwareupdate -l)

if [ -z "$update_list" ]; then
    echo "System is up to date."
else
    echo "Installing system updates..."
    echo "To see progress go to Settings > General > Software Update"
    softwareupdate -i -a
    # Check for restart requirement
    needs_restart=$(needsrestart -r)
    if [ -n "$needs_restart" ]; then
        echo "Updates installed. Restart required."
    else
        echo "Updates installed. No restart required."
    fi
fi




