#!/bin/bash

# write true to implement or false to not implement (make sure everything is lower case). 

# creating a new user if true uncomment and edit account name, type and id inbetween the ""
# create a new admin user
create_Admin_User = true
# account_name = "ChangeMe"
# account_type = "admin or standard"
# account_id = "userID change me"

# creating other user
create_User = false
# account_name = "ChangeMe"
# account_type = "admin or standard"
# account_id = "userID change me"



# download, install softwares from web

install_Zoom = false
install_Chrome = false
install_TeamViewer = false



# custom scripts
send_HostMaster_To_Slack = true
turn_on_Screen_Share = true




















































##############################
#                            #
#   For default edits only   #
#                            #  
##############################

# make sure to keep the quotes when you make change 

# change this to your default password a password is required to create a user. You can change it in the settings if you don't want one.
defaultAccountPassword="YourDefaultPassword"

# you can add application download links here
chrome_dl_link = "https://dl.google.com/chrome/mac/universal/stable/CHFA/googlechrome.dmg"
zoom_dl_link = "https://zoom.us/client/latest/ZoomInstallerIT.pkg"
teamViewer_dl_link = "https://download.teamviewer.com/download/TeamViewerHost.dmg"

# to download or install software from a samba server
useSambaServer = true
# edit this to your samba directory that you want to mount
sambaServerIP = ""































##############################
#                            #
#   For advance edits only   #
#                            #  
##############################

# Check if the script has root privilege 
# If not exit the script

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (admin)."
    exit 1
fi


# you can also install custom softwares from a Samba Server
if [ $useSambaServer == true ]; then

  # ask for domain username and password
  read -p "Enter your domain username: " sambaUser
  read -sp "Enter your domain password: " sambaPass

  # Mount the share
  mount_smbfs "$sambaServerIP" "/mnt/sambashare" -o "user=$sambaUser,pass=$sambaPass"

  # Unset the password variable for security 
  unset sambaPass
fi

# Apps download and install functions

# Zoom download and install function 
if [ $install_Zoom ]; then

  appName="Zoom"
  appProcess="zoom.us"
  
  # Check if app is running
    if pgrep -xq "$appName"; then
    echo "Updating $appName"
    killall "$appName" 
    fi

  # Create temp directory
  tempDir=$(mktemp -d -t zoomInstall)

  # Download installer
  curl -fsSL "$zoom_dl_link" -o "$tempDir/$appName.pkg"

  # Install package
  installer -pkg "$tempDir/$appName.pkg" -target /

  # Delete temp directory
  rm -rf "$tempDir" 

fi


# TeamViewer download and install function 
if [ $install_TeamViewer ]; then
    # exit if error occurs 
    set -e

    # Settings
    pkgFile="TeamViewerHost.dmg"
    appName="TeamViewer" 
    url = $teamViewer_dl_link
    teamviewer_bundle_id="com.teamviewer.TeamViewer"


    # Check if installed already
    if pgrep -xq "$appName"; then
    echo "Updating $appName"
    killall "$appName" 
    fi

    # Create temp dir in temp
    workDir=$(mktemp -d /tmp/${0##*/}.XXXXXX)

    # Download pkg to temp
    echo "Downloading $pkgFile"
    /usr/local/bin/curl -L "$url" -o "$workDir/$pkgFile" 2>&1 | tee $workDir/install.log

    # Install app
    echo "Installing $appName"
    hdiutil attach "$workDir/$pkgFile" 
    ditto "/Volumes/$appName/$appName.app" "/Applications/$appName.app"
    hdiutil detach "/Volumes/$appName"

    # Set permissions
    tccutil reset Accessibility,ScreenCapture,SystemPolicyAllFiles "$teamviewer_bundle_id"

    # Clean up 
    rm -rf "$workDir"

    echo "Done installing $appName"

fi























# unmount the samba server if it was mounted
if $useSambaServer ; then
    umount "/mnt/sambashare"
fi

echo "Congratulations your computer is now setup"











