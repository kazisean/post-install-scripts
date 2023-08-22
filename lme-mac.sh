#!/bin/bash

# Lan computer setup and maintenance script (Lan Made Easy)
# by Kazi Hossain <kazi.h@nyu.edu>
# License: GNU GPLv3
# For more information about how to set this up for your need check out : ENTER READ ME LINK HERE

scripts = (

#---Enter the scripts / homebrew commands below this line ----- #

"Gooogle Chrome"
brew install --cask google-chrome


"VLC Media Player"
brew install --cask vlc







)
























































# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Check if the computer is running macOS or not
if [[ $(uname) == "Darwin" ]]; then
    mac=true
else
    echo " "
    echo "This Script can only be ran on a mac device!!"
    echo " "
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
# Installing homebrew and place in path so commands can be used in the terminal
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"




done
