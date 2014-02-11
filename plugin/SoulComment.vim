"
" comment for your script
" Maintainer:   Wayne Xue <xwsoul@gmail.com>
" Version:      Vim 7.2 or higher
" URL:          http://github.com/xwsoul/SoulVim
"

let s:lanMaps = {'c': '//', 'cpp': '//', 'go': '//', 'lua': '--', 'php': '//', 'scala': '//', 'python': '#', 'vim': '"' }

"comment for one line
function SoulLineComment()
	let l:len = strlen(b:char)
	let l:line = getline('.')
	if strlen(l:line) == 0
		return 0
	endif
	if strpart(l:line, 0, l:len) == b:char
		let l:newline = strpart(l:line, l:len)
	else
		let l:newline = b:char . l:line
	endif
	call setline(".", l:newline)
endfunction

function s:SoulSetCommentStr(ft)
	if has_key(s:lanMaps, a:ft)
		let b:char = s:lanMaps[a:ft]
	else
		let b:char = '#'
	endif
endfunction

augroup SoulComment
	autocmd BufEnter,BufRead * :call s:SoulSetCommentStr(&filetype)
	autocmd Filetype * :call s:SoulSetCommentStr(&filetype)
augroup end
