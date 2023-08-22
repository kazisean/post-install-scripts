#!/bin/bash

# Try to put Homebrew in path
step_1='echo; echo "eval \"\$(/opt/homebrew/bin/brew shellenv)\"" >> "/Users/$(whoami)/.zprofile"'
step_2='eval "$(/opt/homebrew/bin/brew shellenv)"'

# Run step 1 and check for errors
if ! eval "$step_1"; then
    echo "Adding Homebrew to PATH failed."
    if ! eval "$step_2"; then
        echo "Running step 2 failed. Downloading and installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$step_2"

        # Reload the modified .zprofile
        source "/Users/$(whoami)/.zprofile"
    else
        echo "Homebrew is already in PATH."
    fi
fi

# Reload the terminal
exec "$SHELL"
