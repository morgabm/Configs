#!/bin/bash

query=$(rofi -dmenu -p "Search")
if [ -n "$query" ]; then
    xdg-open "https://www.google.com/search?q=$(printf "%s" "$query" | jq -sRr @uri)"
    i3-msg workspace Browser
fi
