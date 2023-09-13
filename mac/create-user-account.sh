#!/bin/bash

## This script can be used to add a user account
## Make sure to set your default account password in line 49 (SETDEFAULTPASSWORD="YourDefaultPassword")

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (admin)."
    exit 1
fi

echo "List of existing users:"
dscl . -list /Users | grep -v '^_'

echo "Choose an action:"
echo "1. Keep existing users"
echo "2. Create a new user"

read choice
case $choice in
    1)
        echo "Keeping existing users"
        ;;
    2)
        echo "Creating a new user"
        
        echo "Choose account type:"
        echo "1. Admin account"
        echo "2. Standard account"
        read account_type_choice

        if [ "$account_type_choice" -eq 1 ]; then
            account_type="admin"
        elif [ "$account_type_choice" -eq 2 ]; then
            account_type="standard"
        else
            echo "Invalid choice. Exiting."
            exit 1
        fi

        echo "Enter Full Name for the new user account:"
        read full_name

        # Prompt the user to enter an account name
        echo "Enter an Account Name for the new user account (netID):"
        read account_name

        # Set a default password
        SETDEFAULTPASSWORD="YourDefaultPassword"

        # Create the user account
        sudo dscl . -create "/Users/$account_name"
        sudo dscl . -create "/Users/$account_name" RealName "$full_name"
        sudo dscl . -create "/Users/$account_name" UserShell "/bin/bash"
        sudo dscl . -create "/Users/$account_name" UniqueID "1001" # Assign a unique ID
        sudo dscl . -create "/Users/$account_name" PrimaryGroupID "1000" # Standard user group
        sudo dscl . -create "/Users/$account_name" NFSHomeDirectory "/Users/$account_name"
        sudo dscl . -passwd "/Users/$account_name" "$SETDEFAULTPASSWORD"

        # Add the user to the desired group based on account type
        if [ "$account_type" == "admin" ]; then
            sudo dscl . -append "/Groups/admin" GroupMembership "$account_name"
        fi

        echo "User '$account_name' created as $account_type."
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Script ends automatically after completion
exit 0
