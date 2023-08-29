#!/bin/zsh

	# Written by:William Smith
	# Professional Services Engineer
	# Jamf
	# bill@talkingmoose.net
	# https://gist.github.com/talkingmoose/5336e69480d87014a4c2ea1d6ec0ea4e

# enter the SHA 256 checksum for the download file
# download the package and run '/usr/bin/shasum -a 256 /path/to/file.pkg'
# this will change with each version
# leave blank to to skip the checksum verification (less secure) or if using a $4 script parameter with Jamf Pro

sha256Checksum="" # e.g. "67b1e8e036c575782b1c9188dd48fa94d9eabcb81947c8632fd4acac7b01644b"

if [ "$4" != "" ] && [ "$sha256Checksum" = "" ]
then
    sha256Checksum=$4
fi

# temporary file name for downloaded package
pkgFile="Zoom.us.pkg"

# process name of running app (check first to avoid installing while running)
appProcess="zoom.us"

# this is the full download URL to the latest version of the product
# https://support.zoom.us/hc/en-us/articles/115001799006-Mass-Deployment-with-Preconfigured-Settings-for-Mac
url="https://zoom.us/client/latest/ZoomInstallerIT.pkg"

# check for running process first
echo "Checking for process '$appProcess'"
if [[ $( /usr/bin/pgrep "$appProcess" ) = "" ]]; then
	echo "Verified '$appProcess' process is not running"
else
	echo "Application is running. Aborting installation."
	exit 1
fi

# create temporary working directory
echo "Creating working directory '$tempDirectory'"
workDirectory=$( /usr/bin/basename $0 )
tempDirectory=$( /usr/bin/mktemp -d "/private/tmp/$workDirectory.XXXXXX" )

# change directory to temporary working directory
echo "Changing directory to working directory '$tempDirectory'"
cd "$tempDirectory"

# download the installer package
echo "Downloading package $pkgFile"
/usr/bin/curl "$url" \
--location \
--silent \
--output "$pkgFile"

# checksum the download
downloadChecksum=$( /usr/bin/shasum -a 256 "$tempDirectory/$pkgFile" | /usr/bin/awk '{ print $1 }' )
echo "Checksum for downloaded package: $downloadChecksum"

# install the package if checksum validates
if [ "$sha256Checksum" = "$downloadChecksum" ] || [ "$sha256Checksum" = "" ]; then
	echo "Checksum verified. Installing package $pkgFile"
	/usr/sbin/installer -pkg "$pkgFile" -target /
	exitCode=0
else
	echo "Checksum failed. Recalculate the SHA 256 checksum and try again. Or download may not be valid."
	exitCode=1
fi

# remove the temporary working directory when done
/bin/rm -Rf "$tempDirectory"
echo "Deleting working directory '$tempDirectory' and its contents"

exit $exitCode