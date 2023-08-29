#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (sudo)."
    exit 1
fi

# Function to display and log errors
handle_error() {
    local error_message="$1"
    echo "Error: $error_message"
    echo "Error: $error_message" >> error_log.txt
    exit 1
}

# Check for system updates
echo "Checking for system updates..."
update_list=$(softwareupdate -l)

if [ -z "$update_list" ]; then
    echo "System is up to date."
else
    echo "Installing system updates..."
    echo "To see progress go to Settings > General > Software Update"
    
    # Install updates
    if ! softwareupdate -i -a; then
        handle_error "Failed to install updates."
    fi
    
    # Check if restart needed 
    needs_restart=$(needsrestart -r)
    if [ -n "$needs_restart" ]; then
        echo "Updates installed. Restart required."
        
        # Reboot the system
        echo "Rebooting the system..."
        sudo reboot
    else
        echo "Updates installed. No restart required."
    fi
fi

echo "MacOS is up to date. Currently running $(sw_vers -productName) $(sw_vers -productVersion)"

exit 0