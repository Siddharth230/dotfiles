#!/bin/bash

STATUS=$(hyprctl getoption input:touchpad:enabled | grep int | awk '{print $2}')

if [ "$STATUS" = "1" ]; then
    hyprctl keyword input:touchpad:enabled false
else
    hyprctl keyword input:touchpad:enabled true
fi
