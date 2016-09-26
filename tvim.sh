#!/bin/bash

# Start vim in a terminal! I'd rather use the cterm vim than gvim.
# Set the working directory as the directory in which the file is present.
wd=$(dirname "$1")
env TERM=xterm-256color-italic gnome-terminal -e "vim \"$1\"" --working-directory="$wd"

# In order to make all this work, it is also necessary to create a .desktop
# file. This file must be placed in .local/share/applications/. There is
# currently a tvim.desktop file there. The tvim.desktop file can serve as a
# template for creating more files of the same kind. In order to find out more
# about .desktop files, read from the following link:
#
#     https://help.ubuntu.com/community/UnityLaunchersAndDesktopFiles
