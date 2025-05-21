#!/bin/bash

query=$(rofi -dmenu -p "Search" -theme-str "window {height: 60px;}")
if [ -n "$query" ]; then
    xdg-open "https://www.google.com/search?q=$(printf "%s" "$query" | jq -sRr @uri)"
    # Get workspace data in JSON format
    workspaces=$(i3-msg -t get_workspaces)
    # Use jq to extract the number of the urgent workspace
    urgent_id=$(echo "$workspaces" | jq -r '.[] | select(.urgent == true) | .id')
    i3-msg "[con_id=$urgent_id] focus"
fi
