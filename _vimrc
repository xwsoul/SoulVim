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
" 换行
set wrap
" 关闭兼容模式
set nocp
" 自动加载外部改动
" set autoread
" 配色方案
color macvim
" 文件编码
set encoding=utf-8
set fileencodings=utf-8,chinese
language messages zh_CN.utf-8
" 加载其他文件
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 加载自定义的函数
" source ~/.vim/soul/Soul.vim
" 禁用自动备份
set nobackup
" source $VIMRUNTIME/mswin.vim
" behave mswin


""""""""""""""
" leader key "
""""""""""""""
let mapleader = ","
nmap <leader>s :w<cr>
" 添加 # 注释
imap <leader># <esc>0i#
nmap <leader># 0i#
" 添加 // 注释
imap <leader>/ <esc>0i//
nmap <leader>/ 0i//


"""""""""""""""""""""
" Hotkeys for table "
"""""""""""""""""""""
" 打开新标签页
map <F3> <esc>:tabnew 
nmap <leader>t :tabnew<cr>
" 关闭当前标签页
map <F4> <esc>:tabclose<CR>
" 标签页左移
map <A-Left> <esc>:tabprevious<CR>
" 标签页右移
map <A-Right> <esc>:tabnext<CR>


""""""""""""""""""""""
" NERDTree configure "
""""""""""""""""""""""
" NERDTree 界面宽度
let NERDTreeWinSize = 27
" 打开 NERDTree
map <A-F10> <esc>:NERDTreeFromBookmark 
nmap <leader>fb :NERDTreeFromBookmark 
map <C-F10> <esc>:Bookmark 
nmap <leader>b :Bookmark 
map <F10> <esc>:NERDTreeToggle<CR>


"""""""""""""""""""""
" Taglist configure "
"""""""""""""""""""""
" 载入标签
" set tags=~/.vim/data/tags/
" 自动打开
let Tlist_Auto_Open = 1
" 只显示当前文件的标签列表
" let Tlist_Show_One_File = 1
" Ctags 命令配置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" 如果标签列表页是当前窗口的最后一个页面则自动关闭
let Tlist_Exit_OnlyWindow = 1
" 在右边窗口显示标签列表
let Tlist_Use_Right_Window = 1
" set hot key for Taglist's open and close
map <F9> <esc>:TlistToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto close                                           "
" http://www.vim.org/scripts/script.php?script_id=2009 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}


"""""""""""
" matchit "
""""""""'""
" 关闭自动加载插件
"let loaded_matchit = 1


"""""""""""""""""
" onim complete "
"""""""""""""""""
" omni for Python
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" omni for PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1


""""""""""""""""
" auto command "
""""""""""""""""
" 自动打开 NERDTree
autocmd VimEnter * NERDTree
" 为每个buffer共享NERDTree镜像
autocmd BufEnter * NERDTreeMirror
