#!/bin/bash

# Define the array
scripts=(
    "1"
    "Google Chrome"
    "dmg"
    "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"
    "2"
    "Google Chrome V2"
    "dmg"
    "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"
)

# Get the number of items in the array
num_items=${#scripts[@]}

# Define the temp folder
temp_folder="temp"
mkdir -p "$temp_folder"

# Display the selection menu and process user input
while true; do
    # Create the selection menu
    selection_menu=""
    for ((i = 0; i < num_items; i += 4)); do
        selection_menu+="$((${scripts[$i]})). ${scripts[$i + 1]}\n"
    done

    # Print the selection menu and prompt user for input
    echo -e "$selection_menu"
    read -p "Enter the tool number you would like to execute (or type 'exit' to quit): " user_input

    if [[ "$user_input" == "exit" ]]; then
        break
    fi

    # Find the selected item in the array
    selected_item_index=-1
    for ((i = 0; i < num_items; i += 4)); do
        if [[ "${scripts[$i]}" -eq "$user_input" ]]; then
            selected_item_index=$i
            break
        fi
    done

    if [[ $selected_item_index -ne -1 ]]; then
        selection_name="${scripts[$selected_item_index + 1]}"
        download_link="${scripts[$selected_item_index + 3]}"
        file_type="${scripts[$selected_item_index + 2]}"

        # Download the file and store in the temp folder
        temp_file="$temp_folder/$selection_name.$file_type"
        wget "$download_link" -O "$temp_file"

        # Install the downloaded file based on its type
        if [[ "$file_type" == "dmg" ]]; then
            # Install DMG files (example command)
            hdiutil attach "$temp_file"
            # Add installation steps here for DMG files

        elif [[ "$file_type" == "pkg" ]]; then
            # Install PKG files (example command)
            sudo installer -pkg "$temp_file" -target /
            # Add installation steps here for PKG files

        elif [[ "$file_type" == "sh" ]]; then
            # Install SH files (example command)
            chmod +x "$temp_file"
            "$temp_file"
            # Add installation steps here for SH files

        else
            echo "Unsupported file type: $file_type"
            exit 1
        fi

        # Remove the temporary file
        rm -f "$temp_file"

        echo "Installation of $selection_name complete."
    else
        echo "Tool number not found."
        echo "Installation failed. Manual intervention required to install Tool $user_input."
    fi
done

# Clean up
rm -rf "$temp_folder"
echo "Thank you for using Lan Made Easy! Have a great day :)"
