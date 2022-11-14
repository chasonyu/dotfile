syntax on
set number
set hls
set incsearch
set nocompatible "不与 Vi 兼容


" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。
set autoindent            
" 设置自动将 Tab 转为空格。 
set expandtab              
" 编辑模式的时候按退格键的时候退回缩进的长度 
set softtabstop =4      
" >> 下级自动缩进的时候下一行缩进多少长度，比如函数进入函数体
set shiftwidth  =4         
" >> 下级缩进是整数倍的shiftwidth，
set shiftround             
" 让退格键正常使用
set backspace   =indent,eol,start 
" 最后本页显示不下最后一行的时候也尽可能多的显示而不是用@代替
set display     =lastline
" 显示键入的命令，但不知道为啥不生效
set showcmd 
" 新开的窗口在下面，右面
set splitbelow          
set splitright         
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 突出显示当前行
set cursorline
" 突出显示当前列
set cursorcolumn
" 显示括号匹配
set showmatch
" 总是显示状态栏'
set laststatus=2
" 显示光标当前位置'
set ruler
" 保存的时候自动重新载入
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"==============================快捷键映射================================="

" 重新学习一个mapping的窍门就是强制将之前的按键设置为不可用，强迫自己使用新的mapping"
" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap <Leader>n <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>l <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>h <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>k <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>j <C-W>j
" 重载vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" 编辑vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 将tab键绑定为跳出括号
inoremap <TAB> <c-r>=SkipPair()<CR>
" 设置括号自动补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>i
" easymotion shortcut"
nmap ss <Plug>(easymotion-s2)
 
"=====================================自定义函数==================================="

" 定义跳出括号函数，用于跳出括号
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == '>'
        return "\<Right>"
    else
        return "\t"
    endif
endfunc

"========================================插件======================================"
call plug#begin()
" 导航栏
    Plug 'vim-airline/vim-airline'
" python 补全"
    Plug 'rkulla/pydiction'
" markdown 高亮插件
""    Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
""    Plug 'plasticboy/vim-markdown'
" 通过浏览器预览 markdown 文件"
""    Plug 'iamcco/markdown-preview.vim'
"快速移动"
Plug 'easymotion/vim-easymotion'
call plug#end()

"=====================================全局量定义==================================="
"python 补全prdiction
let g:pydiction_location = '~/.vim/plugged/pydiction/complete-dict'
let g:pydiction_menu_height = 5

"==========================ii==abbreviations纠正笔误及snippets======================="
" 输入完错误的单词比如adn之后输入任何字符都可以自动转换,前提是adn前面是空格.例如ladn那么就不会进行替换,想要不管任何情况都要进行替换的话请使用map映射;"

" 纠正笔误"
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev cahson chason
iabbrev chaosn chason

" snippets"
iabbrev @@ chasonyu@foxmail.com
iabbrev ccopy Copyright 2020 Chasonyu , all rights reserved.

