#!/bin/bash
# Script to automatically adjust wanted display configuration based on presence of Thunderbolt dock and lid state
# Copyright 2020 Kyle Brennan <kyle@metalspork.xyz>


THUNDERBOLT_DEVICE="0043a888-4074-1300-ffff-ffffffffffff"
NO_DOCK="/home/kbrennan/.screenlayout/internal.sh"
DOCK_LID_OPEN="/home/kbrennan/.screenlayout/both.sh"
DOCK_LID_CLOSED="/home/kbrennan/.screenlayout/external.sh"


function configure_workspaces {
    i3-msg [workspace="1"] "move workspace to output DP1-2"
    i3-msg [workspace="2"] "move workspace to output DP1-2"
    i3-msg [workspace="3"] "move workspace to output DP1-2"
    i3-msg [workspace="4"] "move workspace to output DP1-2"
    i3-msg [workspace="5"] "move workspace to output DP1-2"
    i3-msg [workspace="6"] "move workspace to output DP1-2"
    i3-msg [workspace="7"] "move workspace to output DP1-2"
    i3-msg [workspace="8"] "move workspace to output eDP1"
    i3-msg [workspace="9"] "move workspace to output eDP1"
    i3-msg [workspace="10"] "move workspace to output eDP1"

}

function check_ws {


    LID_STATE=$(cat /proc/acpi/button/lid/LID/state | cut -d' ' -f7)
    THUNDERBOLT_CONNECTED_UUIDS=$(boltctl | grep -B3 status:\ .\*authorized | awk ' { if ($2 == "uuid:") { print $3; exit } } ')
    echo $THUNDERBOLT_CONNECTED_UUIDS

    if [[ $THUNDERBOLT_DEVICE == $THUNDERBOLT_CONNECTED_UUIDS ]] ; then
        if [[ $LID_STATE == "closed" ]] ; then
            dunstify "Configuring Displays" "lid closed, TB connected."
            $DOCK_LID_CLOSED
            echo $DOCK_LID_CLOSED > ~/.screenlayout/.chosen
        else
            dunstify "Configuring Displays" "lid opened, TB connected."
            $DOCK_LID_OPEN
            echo $DOCK_LID_OPEN > ~/.screenlayout/.chosen
            configure_workspaces
        fi
    else
        dunstify "Configuring Displays" "TB disconnected"
        $NO_DOCK
        echo $NO_DOCK > ~/.screenlayout/.chosen
    fi
}

check_ws
sleep 3

xset r rate 300 50

nitrogen --restore
echo cmd:restart > /tmp/polybar_mqueue.$(pgrep polybar)

dunstify "Displays Configured" "service adjustment complete"
