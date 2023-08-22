#!/bin/bash

# Lan computer setup and maintenance script (Lan Made Easy)
# by Kazi Hossain <kazi.h@nyu.edu>
# License: GNU GPLv3

scripts = (

###############################################################################
#
#       add your apps / scripts below this # box
#       use this template to help you
#       "number to showcase in the menu"
#       "name-of-app-or-script"
#       "type"
#       "stable-direct-download-link"  
#   an example is given below which downloads google chrome
#
###############################################################################

# Downloading google chrome 
    "1"
    "Google Chrome"
    "dmg"
    "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"










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

done
