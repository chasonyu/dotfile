#!/bin/bash

## 创建一个新的space
## arg[0] == 1, 将当前窗口移动至新的space

set -x

moveCurrentWindow=${1:-}

/opt/homebrew/bin/yabai -m space --create

[[ ! -z $moveCurrentWindow ]] && windowId="$(/opt/homebrew/bin/yabai -m query --spaces --display | /opt/homebrew/bin/jq 'map(select(."has-focus"))[-1].id')"
spaceIndex="$(/opt/homebrew/bin/yabai -m query --spaces --display | /opt/homebrew/bin/jq 'map(select (."is-native-fullscreen" == false))[-1].index')"

if [[ ! -z $moveCurrentWindow && ! -z $windowId && $windowId != 'null' ]]
then
  /opt/homebrew/bin/yabai -m window --space ${spaceIndex}
fi

/opt/homebrew/bin/yabai -m space --focus  ${spaceIndex}