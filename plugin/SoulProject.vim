"
" Using NERDTreeBookmark as Project
"
" Deps:       NERDTree plugin
" Maintainer: Wayne Xue <xwsoul@gmail.com>
" Version:    Vim 7.2 or higher
" URL:        http://github.com/xwsoul/SoulVim
"

command! -n=1 -complete=customlist,SoulCompleteBookmarks -bar SoulProject call SoulOpenProject('<args>')

function SoulOpenProject(name)
	let path = ""
	if len(g:NERDTreeBookmark.BookmarkFor(a:name))
		let _path = g:NERDTreeBookmark.BookmarkFor(a:name).path
		if $OS == 'Windows_NT'
			let path = _path.drive . '\' . join(_path.pathSegments, '\')
		else
			let path = '/'. join(_path.pathSegments, '/')
		endif
		exec ":NERDTreeFromBookmark " . a:name
		exec ":cd " . path
		call SoulTagAutoload()
	else
		Error "Not an valid bookmark."
	endif
endfunction

function SoulCompleteBookmarks(A,L,P)
	return filter(g:NERDTreeBookmark.BookmarkNames(), 'v:val =~ "^' . a:A . '"')
endfunction
