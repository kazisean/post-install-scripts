#!/bin/bash

# Lan computer setup and maintenance script (Lan Made Easy)
# by Kazi Hossain <kazi.h@nyu.edu>
# License: GNU GPLv3

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Check if the computer is running macOS or not
if [[ $(uname) == "Darwin" ]]; then
    mac=true
else
    mac=false
fi

# Display main menu
while true; do
    echo "Lan Made Easy - Main Menu"
    echo "1) Check computer info"
    echo "2) Check for updates"
    echo "3) Install new software"
    echo "4) Send host-master"
    echo "0) Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Computer Name : $(hostname)"
            echo "Manufacturer : Apple"
            echo "Serial Number : $(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')"
            echo "Operating System : $(sw_vers -productName) $(sw_vers -productVersion)"
            echo "Mac Address : $(ifconfig en0 | awk '/ether/{print $2}')"
            echo "Computer Model : $(sysctl -n hw.model)"
            echo "RAM : $(sysctl -n hw.memsize | awk '{print $0/1024/1024/1024 " GB"}')"
            echo "Disk : $(df -h / | awk '/\// {print $2}')"
            teamviewer_id=$(teamviewer --info 2>/dev/null | awk '/TeamViewer ID:/{print $NF}')
            if [ -n "$teamviewer_id" ]; then
                echo "Teamviewer ID : $teamviewer_id"
            else
                echo "Teamviewer ID : Not installed or corrupted"
            fi
            ;;
        2)
            echo "Checking for updates..."
            # Add update check logic here
            ;;
        3)
            echo "Installing new software..."
            # Add software installation logic here
            ;;
        4)
            echo "Sending host-master..."
            # Add host-master sending logic here
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
    echo
done
