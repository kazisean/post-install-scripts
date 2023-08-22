#!/bin/bash

homebrew_dir="$HOME/out/homebrew"

# Check if the directory exists
if [ ! -d "$homebrew_dir" ]; then
    # Directory doesn't exist, run the Homebrew installation command
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    # Directory exists, proceed with captured installation instructions
    installation_instructions=$(brew help 2>&1 | awk '/- Run these two commands in your terminal to add Homebrew to your PATH:/,/- Run brew help to get started/' | sed '1d;$d')
    eval "$installation_instructions"
fi

# Refresh the terminal
exec "$SHELL"
