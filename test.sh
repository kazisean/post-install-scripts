#!/bin/bash

# Try to put homebrew in path
installation_instructions='echo "export PATH=/usr/local/bin:$PATH" >> ~/.bash_profile && source ~/.bash_profile'

# Run installation instructions and check for errors
if ! eval "$installation_instructions"; then
    echo "Error adding Homebrew to PATH. Downloading and installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Run the installation instructions again
    eval "$installation_instructions"
else
    echo "Homebrew is already in PATH."
fi

# Refresh the terminal
exec "$SHELL"
