cat << "EOF"

                       _____________________________________________________
                      |                                                     |
             _______  |                                                     |
            / _____ | |                      SySeasy.org                    |
           / / __  || |                  MacOs Automation Script            |
  ________/ / |OO| || |                  Version: 0.1                       |
 |         |-------|| |                                                     |
(|         |     -.|| |_______________________                              |
 |  ____   \       ||_________||____________  |             ____      ____  |
/| / __ \   |______||     / __ \   / __ \   | |            / __ \    / __ \ |\
\|| /  \ |_______________| /  \ |_| /  \ |__| |___________| /  \ |__| /  \|_|/
   | () |                 | () |   | () |                  | () |    | () |
    \__/                   \__/     \__/                    \__/      \__/


EOF

###############################################################
#                                                             #
#                                                             #
#  Description: This script is used to automate MacOs setup   #
#                                                             #
#  Author: SySeasy.org                                        #
#  Version: 0.1                                               #
#                                                             #
#                                                             #
###############################################################


# Run this script as admin
sudo -v

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (admin)."
    exit 1
fi























# End of the script 

