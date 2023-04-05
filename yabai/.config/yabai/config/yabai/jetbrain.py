#!/usr/bin/env python
import os
import re
import json
import time

time.sleep(3)
temp = r'osascript -e "display notification \"manage\" with title \"{}窗口已被yabai管理\"";'

# app列表
jetbrains_app = ['IntelliJ IDEA', 'PyCharm']
# jetbrains_app 窗口标题正则
pattern = r'.*\[.*?\/.*?\].*'
# 查询窗口命令
query_command = '/usr/local/bin/yabai -m query --windows'
# 置为浮动命令模板
toggle_float_command = '/usr/local/bin/yabai -m window "{}"  --toggle float'
# 执行查询窗口命令
tt = os.popen(query_command)
# 获取命令执行结果
tmp = tt.read()
# 解析命令结果
result_dict = json.loads(tmp)

# 处理结果
for content in result_dict:
    if content['app'] in jetbrains_app:
        if re.search(pattern, content['title']):
            if content['is-floating']:
                os.system(toggle_float_command.format(content['id']))
                os.system(temp.format(content['app']))


