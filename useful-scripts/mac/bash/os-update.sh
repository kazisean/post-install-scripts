#!/bin/bash


# Download software update 
echo "Downloading software update"
softwareupdate -da
# Install the after after its done downloading
softwareupdate --no-scan -aiR
echo "MacOs Is upto date. Currentry running $(sw_vers -productName) $(sw_vers -productVersion)"