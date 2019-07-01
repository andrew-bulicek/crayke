#!/usr/bin/env bash

{
  # Start VLC and hide it
  open --background -a /Applications/VLC.app
  osascript -e 'tell application "Finder"' -e 'set visible of process "VLC" to false' -e 'end tell'
} &> /dev/null

# Display current time in top right
# while sleep 1;do tput sc;tput home;echo -e "\033[2m`date "+%H:%M:%S"`\033[0m";tput rc;done &

# Clear the window
tput reset

# Print Crayke art
cat << "EOF"


         ..::+o::\
             `oy.mm\
  Crayke    /oyyhhyo-`
   v1.0     .ssshmNNNd/`
             -oymNNNNNNy`
               .-soyoshm.\
                 :. +  `-./
              ..::  /
                ..:/:`


EOF

# Prompt user for video path
echo "Hi! Drag the video on to this window and press enter to begin:"
read -p "> " userPath
echo ""

# Prompt user for start time
echo -e "Ok, when should I start playing ${userPath##*/}?"
# echo -e "\033[2m(Current time is at the top right)\033[0m"
echo -e "\033[2m(Current time is `date "+%H:%M:%S"`)\033[0m"
read -p "> " userTime
echo ""

# Remove colons from the start time
userTime="${userTime//:}"

# Prompt user for video path and start time
currentTime=$(date '+%s')
startTime=$(date -j -f "%H%M%S" "$userTime" "+%s")
waitTime=$(( $startTime - $currentTime ))

# Countdown until the video plays
function countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "All set! Video starts in: $(date -ju -f %s $(($date1 - `date +%s`)) +%S)\r"
     sleep 0.1
   done
}
countdown $waitTime
#echo "Starting video in ${waitTime} seconds!"
#sleep $waitTime

# Tell user how to quit
echo ""; echo ""; echo "\033[1mVideo started! Press ⌘+q to exit.\033[0m"

# Start video playback
echo ""
/Applications/VLC.app/Contents/MacOS/VLC file://$userPath -f -q --macosx-dim-keyboard --macosx-black &> /dev/null
echo ""

# Quit Open Applications
osascript -e 'quit app "VLC"'
osascript -e 'quit app "Terminal"' & exit 0

# Exit after video ends
#exit 0


# SPINNER
#
# i=0
# sp='/-\|'
# n=${#sp}
# printf ' '
# sleep 0.1
# while true; do
#     printf '\b%s' "${sp:i++%n:1}"
#     sleep 0.1
# done
