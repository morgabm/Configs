#!/bin/bash

i3-msg -t subscribe -m '["workspace", "output"]' | {

	i3-msg -t get_tree;
	while read EVENT; do i3-msg -t get_tree; done;
} | jq --unbuffered -c '.nodes[] | .nodes[] | select(.type == "con") | .nodes[] | select(.type == "workspace") | {id, num, name: .nodes[0].window_properties.class, visible: true, focused, rect, output, urgent} | select(.num > 0)' | jq --unbuffered -s -c
