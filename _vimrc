""""""""""""""""""""""""""""""""""""""
" Created by Wayne Xue
" E-mail   : xwsoul@gmail.com
" Blog     : http://xwsoul.com
" Created  : 2011-07-04
" Modified : 2011-07-25 19:45
""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""
" common configure "
""""""""""""""""""""
" 显示行号
set nu
" 高亮代码
set hls
" 宽字符支持
set ambiwidth=double
" 代码折叠
set foldmethod=syntax
" 空格宽度
set sw=4
" 制表符长度
set ts=4
" 智能空格
set smarttab
set ai
" filetype
filetype on
" autoload filetype plugin
filetype plugin on
" 将Python的tab转换为空格 
au filetype python set expandtab
" 换行
set wrap
" 关闭兼容模式
set nocp
" 兼容 Windows
if $OS == 'Windows_NT'
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	" behave mswin
endif
" 自动加载外部改动
" set autoread
" 配色方案
color ir_black
" 文件编码
set encoding=utf-8
set fileencodings=utf-8,chinese
language messages zh_CN.utf-8
" 加载其他文件
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 加载自定义的函数
" source ~/.vim/soul/Soul.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin
" 禁用自动备份
set nobackup
" 禁用swp文件
set nowb
set noswapfile
" spell check
"set spell
" show invisible chars
"set list

""""""""""""""
" leader key "
""""""""""""""
let mapleader = ","
" save file
imap <leader>w <ESC>:w<CR>a
nmap <leader>w :w<CR>
" quit
imap <leader>q <ESC>:q<CR>
nmap <leader>q :q<CR>
" save and exit
imap <leader>x <ESC>:wq<CR>
nmap <leader>x :wq<CR>
" // style comment
imap <leader>/ <ESC>:call SoulLineComment()<CR>
nmap <leader>/ :call SoulLineComment()<CR>
" append ; to the end of line
imap <leader>; <ESC>A;
nmap <leader>; A;
" append at end of line
imap <leader>a <ESC>A
" full time
imap <leader>t <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
" date
imap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>
" @ 就是 at
imap <leader>@ xwsoul@gmail.com
" .就是当前的
imap <leader>. <C-R>=expand('%')<CR>

""""""""""""""""""""""
" NERDTree configure "
""""""""""""""""""""""
" NERDTree 界面宽度
let NERDTreeWinSize = 22
" 打开 NERDTree
map <A-F10> <esc>:NERDTreeFromBookmark 
nmap <leader>fb :NERDTreeFromBookmark 
map <C-F10> <esc>:Bookmark 
nmap <leader>b :Bookmark 
map <F10> <esc>:NERDTreeToggle<CR>


""""""""""""""""""""""
" SnipMate configure "
""""""""""""""""""""""
let g:snips_author ="xwsoul"


"""""""""""""""""""""
" Taglist configure "
"""""""""""""""""""""
" 自动打开
let Tlist_Auto_Open = 0
" 只显示当前文件的标签列表
" let Tlist_Show_One_File = 1
" Ctags 命令配置
let Tlist_Ctags_Cmd = 'ctags'
" 如果标签列表页是当前窗口的最后一个页面则自动关闭
let Tlist_Exit_OnlyWindow = 1
" 在右边窗口显示标签列表
let Tlist_Use_Right_Window = 1
" set hot key for Taglist's open and close
map <F9> <esc>:TlistToggle<CR>


"""""""""""""""""""""""
" Tagloader configure "
"""""""""""""""""""""""
"tag maker command
let g:tagloader_cmd = 'ctags'
"where to save the tags
let g:tagloader_filename = '.soultags'
"auto load tags
let g:tagloader_autoload = 1
"auto load config file path: one full path per line
let g:tagloader_autoload_config = $HOME.'/.vim/.tagloader'
" reload tag file
map <F5> <esc>:call SoulTagReload()<CR>
" load tag file
map <C-F5> <esc>:call SoulTagLoad()<CR>
" add present word directory into config file
map <S-F5> <esc>:call SoulTagAddPath()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto close                                           "
" http://www.vim.org/scripts/script.php?script_id=2009 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", "`": "`"}


"""""""""""
" matchit "
""""""""'""
" 关闭自动加载插件
"let loaded_matchit = 1


"""""""""""""""""
" omni complete "
"""""""""""""""""
" omni for Python
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" omni for PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType python set omnifunc=pythoncomplete#Complete
let php_sql_query=0
let php_htmlInStrings=0


""""""""""""""""
" auto command "
""""""""""""""""
" 自动打开 NERDTree
au VimEnter * NERDTree
" 为每个buffer共享NERDTree镜像
au BufEnter * NERDTreeMirror


"初始窗口的位置
if has("gui_running")
	" 关闭工具栏
	set guioptions-=T
	winpos 0 0
endif
