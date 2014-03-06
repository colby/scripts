#!/bin/bash

osascript <<EOD
    tell application "Adium"
        go away with message "Taking my lunch break."
    end tell
EOD
