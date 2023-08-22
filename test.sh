#!/bin/bash

# Check if Brew is installed
if ! command -v brew &> /dev/null; then
    echo "Brew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Array of scripts
scripts=(
    "Google Chrome" 
    "brew install --cask google-chrome"


    "VLC Media Player" 
    "brew install --cask vlc"

    
    # Add more scripts in the same format
)

while true; do
    echo "Select a script:"
    for i in "${!scripts[@]}"; do
        if (( $i % 2 == 0 )); then
            echo "$((i / 2)): ${scripts[$i]}"
        fi
    done
    echo "q) Quit"

    read -p "Enter your choice: " choice

    case $choice in
        q)
            echo "Exiting..."
            exit 0
            ;;
        [0-9]*)
            if (( choice >= 0 && choice * 2 < ${#scripts[@]} )); then
                eval "${scripts[$((choice * 2 + 1))]}"
            else
                echo "Invalid choice."
            fi
            ;;
        *)
            echo "Invalid input."
            ;;
    esac
done
