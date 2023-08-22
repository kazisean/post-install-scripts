#!/bin/bash

# Append Homebrew shell environment setup to .zprofile
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$(whoami)/.zprofile

# Try running Homebrew shell environment setup
eval "$(/opt/homebrew/bin/brew shellenv)"
if [ $? -ne 0 ]; then
    # If the previous command failed, install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null 2>&1 &
    
    # Wait for the installation to complete
    wait $!
    
    # Check the installation status
    if [ $? -eq 0 ]; then
        echo "Homebrew installation successful."
        
        # Now that Homebrew is installed, try setting up the environment again
        eval "$(/opt/homebrew/bin/brew shellenv)"
        if [ $? -ne 0 ]; then
            echo "Error setting up Homebrew environment after installation."
            exit 1
        fi
    else
        echo "Homebrew installation failed."
        exit 1
    fi
    
    # Quit the terminal after installing Homebrew
    osascript -e 'tell application "Terminal" to quit'
fi
