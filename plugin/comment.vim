"
" comment for your script
" Maintainer:   Wayne Xue <xwsoul@gmail.com>
" Version:      Vim 7.2 or higher
" URL:          http://github.com/xwsoul/SoulVim
"

"comment for one line
function SoulLineComment(char)
	let l:len = strlen(a:char)
	let l:line = getline('.')
	if strlen(l:line) == 0
		return 0
	endif
	if strpart(l:line, 0, l:len) == a:char
		let l:newline = strpart(l:line, l:len)
	else
		let l:newline = a:char . l:line
	endif
	call setline(".", l:newline)
endfunction
