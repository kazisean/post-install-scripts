#!/bin/bash

# Lan computer setup and maintenance script (Lan Made Easy)
# by Kazi Hossain <kazi.h@nyu.edu>
# License: GNU GPLv3
# For more information about how to set this up for your need check out : ENTER READ ME LINK HERE

# change this app list to your own app list txt file. It is currently set to the default list from the git repo
app_list = "https://raw.githubusercontent.com/kazisean/Lan-made-easy/main/useful-scripts/mac/homebrew/default_list.txt"

# change this shell list to your own app list txt file. It is currently set to the default list from the git repo
shell_list = 























# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi




# Display the ASCII art banner
cat << "EOF"
                         ______                     
 _________        .---"""      """---.              
:______.-':      :  .--------------.  :             
| ______  |      | :                : |             
|:______B:|      | |  Lan made easy | |             
|:______B:|      | |                | |             
|:______B:|      | |  by            | |             
|         |      | |  kazi.         | |             
|:_____:  |      | |                | |             
|    ==   |      | :                : |             
|       O |      :  '--------------'  :             
|       o |      :'---...______...---'              
|       o |-._.-i___/'             \._              
|'-.____o_|   '-.   '-...______...-'  `-._          
:_________:      `.____________________   `-.___.-. 
                 .'.eeeeeeeeeeeeeeeeee.'.      :___:
               .'.eeeeeeeeeeeeeeeeeeeeee.'.         
              :____________________________:"
EOF

echo "  " 
echo "  " 
echo "  " 



# Download software update 
echo "Downloading software update"
softwareupdate -da
# Install the after after its done downloading
softwareupdate --no-scan -aiR
echo "MacOs Is upto date. Currentry running $(sw_vers -productName) $(sw_vers -productVersion)"

echo "  " 
echo "  " 
echo "  " 
