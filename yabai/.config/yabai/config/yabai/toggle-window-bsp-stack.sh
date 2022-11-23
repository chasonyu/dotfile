#!/usr/bin/env bash

# 如果当前window不处于stack状态则优先和上下的窗口进行合并，否则和左右的窗口进行合并
# 如果当前window处于stack状态，则执行两次float，使其脱离stack（因为没有直接exit stack的方法）

isStack=$(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq '."stack-index"')

if [ $isStack -eq 0 ]
then
  windowId=$(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq -r '.id')
  # 优先和上面或者下面的窗口stack，其次和左右的窗口stack
  /usr/local/bin/yabai -m window north --stack $windowId \
  || /usr/local/bin/yabai -m window south --stack $windowId \
  || /usr/local/bin/yabai -m window west --stack $windowId \
  || /usr/local/bin/yabai -m window east --stack $windowId
else
  echo "haha"
  /usr/local/bin/yabai -m window --toggle float && /usr/local/bin/yabai -m window --toggle float
fi
