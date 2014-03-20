#!/bin/bash

if [ -n $(pgrep adium) ]
then
osascript <<EOD
    tell application "Adium"
	go away with message "Taking my lunch break."
    end tell
EOD
fi

#TODO: 
# Timer for tmux countdown
# Cronjob? Separation of logic in function vs script
# Init a global variable and dec every second?
