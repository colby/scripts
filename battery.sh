#!/bin/bash
#
# To include the line below into your .tmux.conf to see battery % or charging icon.
# set -g status-right "#(/Users/colbyolson/src/scripts/battery.sh) #H %H:%M"

ok_color="colour236"
warn_percent="20%"
warn_color="colour208"

status=`pmset -g batt`
percent=`echo $status | cut -d' ' -f7 | cut -d';' -f1`

if [ "$percent" \< "$warn_percent" ]
    then
        color="#[fg=$warn_color]"
    else
        color="#[fg=$ok_color]"
fi

if [[ $status == *Battery*Power* ]]
    then
        printf "%s%s%s" "$color" "$percent" "#[default]"
    else
        printf "%s%s%s" "$color" "⚡" "#[default]"
fi
