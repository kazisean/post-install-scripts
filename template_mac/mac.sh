#!/bin/bash

# Make sure to all your scripts in the scripts forlder to show up in the option menu.


scripts_dir="$(dirname "$0")/scripts"
script_list=($(ls "$scripts_dir" | grep ".sh$"))
num_scripts=${#script_list[@]}

# showcase all the scripts in the scripts folder as a menu

while true; do
    clear
    echo "Script Menu:"
    for ((i=0; i<num_scripts; i++)); do
        echo "$((i+1)). ${script_list[i]%.sh}"
    done
    echo "0. Exit"
    read -p "Enter your choice: " choice
    
    if [[ $choice == 0 ]]; then
        exit
    elif ((choice >= 1 && choice <= num_scripts)); then
        selected_script="${script_list[choice-1]}"
        clear
        echo "Running ${selected_script%.sh}..."
        sudo bash "$scripts_dir/$selected_script"
        read -rp "Press Enter to continue..."
    else
        echo "Invalid choice. Press Enter to continue..."
        read -r
    fi
done
