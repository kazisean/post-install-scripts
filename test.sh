#!/bin/bash

# Download and install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Find the installation instructions in the output gre the path command and run it
installation_instructions=$(brew help 2>&1 | awk '/- Run these two commands in your terminal to add Homebrew to your PATH:/,/- Run brew help to get started/' | sed '1d;$d')

# Run the installation instructions
eval "$installation_instructions"

# Refresh the terminal
exec "$SHELL"
