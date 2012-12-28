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
" line num
set nu
" code hightlight
set hls
syntax on
" width char
set ambiwidth=double
" cold folding
set foldmethod=syntax
" tab to blank
set expandtab
" shift width
set sw=4
" tab stop
set ts=4
" smart tab
set smarttab
set ai
" filetype
filetype on
" autoload filetype plugin
filetype plugin on
" wrapping
set wrap
" no cp
set nocp
" line is too long
set colorcolumn=81
" show blank at the end of a line
au BufRead,BufNewFile *.* match Underlined /\s\+$/
" for Windows
if $OS == 'Windows_NT'
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	set guifont=Consolas:h11:i
	" behave mswin
else
	if has('gui_running')
		set guifont=文泉驿等宽微米黑
	endif
endif
" 
" set autoread
color molokai
" file coding
set encoding=utf-8
set fileencodings=utf-8,chinese
language messages zh_CN.utf-8
" other file
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin
set nobackup
" no swp
set nowb
set noswapfile
" spell check
"set spell
" show invisible chars
"set list
" auto focus finding string
set incsearch

"""""""""""""""""
" some key maps "
"""""""""""""""""
imap fd <ESC>

" leader key
let mapleader = "ff"
" @ just email
imap <leader>@ xwsoul@gmail.com
" append ; to the end of line
map <leader>, <ESC>A,
" . means current
imap <leader>. <C-R>=expand('%')<CR>
" append ; to the end of line
map <leader>; <ESC>A;
" // style comment
map <leader>/ <ESC>:call SoulLineComment()<CR>
" append at end of line
imap <leader>a <ESC>A
" add present word directory into config file
map <leader>b <ESC>:Bookmark 
" close tab
map <leader>c <ESC>:tabclose<CR>
" date
imap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>
" move to tab
nmap <leader>h :tabnext<CR>
nmap <leader>l :tabprevious<CR>
" load project
map <leader>p <ESC>:SoulProject 
" quit
map <leader>q <ESC>:q<CR>
" full time
imap <leader>t <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
" save file
map <leader>w <ESC>:w<CR>a
" save and exit
map <leader>x <ESC>:wq<CR>
" reload tag file
map <leader>5 <ESC>:call SoulTagReload()<CR>
" set hot key for Taglist's open and close
map <leader>7 <ESC>:TlistToggle<CR>
" map for NERDTree
map <leader>8 <ESC>:NERDTreeToggle<CR>

""""""""""""""""""""""
" NERDTree configure "
""""""""""""""""""""""
" NERDTree width
let NERDTreeWinSize = 22

""""""""""""""""""""""
" SnipMate configure "
""""""""""""""""""""""
let g:snips_author ="xwsoul"


"""""""""""""""""""""
" Taglist configure "
"""""""""""""""""""""
let Tlist_Auto_Open = 0
" show tags for current file only
let Tlist_Show_One_File = 1
" Ctags command
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Exit_OnlyWindow = 1
" taglist on the right
let Tlist_Use_Right_Window = 1


"""""""""""""""""""""""
" Tagloader configure "
"""""""""""""""""""""""
"tag maker command
let g:tagloader_cmd = 'ctags'
"where to save the tags
let g:tagloader_filename = '.soultags'
"where to save the tags
let g:tagloader_ignorefile = '.soulignore'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto close                                           "
" http://www.vim.org/scripts/script.php?script_id=2009 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", "`": "`"}


"""""""""""
" matchit "
""""""""'""
"let loaded_matchit = 1

""""""""
" omni "
""""""""
set completeopt=longest,menu

""""""""""""""""
" auto command "
""""""""""""""""
" NERDTree automatic
au VimEnter * NERDTree
" Share NERDTree Mirror
au BufEnter * NERDTreeMirror

"Position when init
if has("gui_running")
	" close toolbar
	set guioptions-=T
	winpos 100 50
endif

"""""""""""""""
" Set for PHP "
"""""""""""""""
au filetype php set omnifunc=SoulCompFunPHP
au filetype php let php_sql_query=0
au filetype php let php_htmlInStrings=0
