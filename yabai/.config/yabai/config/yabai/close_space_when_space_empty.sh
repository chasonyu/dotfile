#!/bin/bash

space_index=$(/usr/local/bin/yabai -m query --spaces --space | /usr/local/bin/jq '.index')

if [[ -n $space_index && "0" != $space_index ]]; then
  active_window_count=$(/usr/local/bin/yabai -m query --windows --space $space_index | /usr/local/bin/jq 'map(select(."is-sticky" == false)) | length')
  if [[ -n $active_window_count && "0" = $active_window_count ]]; then
    /bin/bash ~/.config/yabai/config/yabai/destory_space.sh
  fi
fi

