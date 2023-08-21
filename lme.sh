#!/bin/sh

# Lan computer setup and maintenance script (Lan Made Easy)
# by Kazi Hossain <kazi.h@nyu.edu>
# License: GNU GPLv3

### check if the computer is running windows or mac ###
if [[ $(uname) == "Darwin" ]]; then
    mac=true
else
    mac=false
fi

echo "Is macOS: $mac"