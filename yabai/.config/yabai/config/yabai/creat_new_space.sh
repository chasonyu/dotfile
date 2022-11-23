#!/bin/bash

## 创建一个新的space
## arg[0] == 1, 将当前窗口移动至新的space

set -x

moveCurrentWindow=${1:-}

/usr/local/bin/yabai -m space --create

[[ ! -z $moveCurrentWindow ]] && windowId="$(/usr/local/bin/yabai -m query --spaces --display | /usr/local/bin/jq 'map(select(."has-focus"))[-1].id')"
spaceIndex="$(/usr/local/bin/yabai -m query --spaces --display | /usr/local/bin/jq 'map(select (."is-native-fullscreen" == false))[-1].index')"

if [[ ! -z $moveCurrentWindow && ! -z $windowId && $windowId != 'null' ]]
then
  /usr/local/bin/yabai -m window --space ${spaceIndex}
fi

/usr/local/bin/yabai -m space --focus  ${spaceIndex}