#!/usr/bin/env bash

SCREEN_L="LVDS-1"
SCREEN_L_MODE="1366x768"

SCREEN_C="VGA-1"
SCREEN_C_MODE="1920x1080"

SCREEN_R="HDMI-1"
SCREEN_R_MODE=$SCREEN_C_MODE


function one_screen() {
    xrandr --output $SCREEN_L --off \
        --output $SCREEN_C --primary --mode $SCREEN_C_MODE \
        --output $SCREEN_R --off
}

function two_screens() {
    xrandr --output $SCREEN_L --off \
        --output $SCREEN_C --mode $SCREEN_C_MODE --primary \
        --output $SCREEN_R --mode $SCREEN_R_MODE --right-of $SCREEN_C
}

function three_screens() {
    xrandr --output $SCREEN_L --mode $SCREEN_L_MODE \
        --output $SCREEN_C --mode $SCREEN_C_MODE --primary --right-of $SCREEN_L \
        --output $SCREEN_R --mode $SCREEN_R_MODE --right-of $SCREEN_C
}

while getopts ":123" opt; do
    case $opt in
        1)
            one_screen
            ;;
        2)
            two_screens
            ;;
        3)
            three_screens
            ;;
    esac
done
~/.config/i3/scripts/background.sh
