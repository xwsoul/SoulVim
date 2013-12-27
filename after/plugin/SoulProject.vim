"
" Using NERDTreeBookmark as Project
"
" Deps:       NERDTree
" Maintainer: Wayne Xue <xwsoul@gmail.com>
" Version:    Vim 7.2 or higher
" URL:        http://github.com/xwsoul/SoulVim
"

if !exists("g:tagloader_cmd")
	finish
elseif !executable(g:tagloader_cmd)
	echoerr "File " . g:tagloader_cmd . " can't be executable."
	finish
endif

" auto load tag file
au VimEnter * call SoulTagAutoload()
" open Project
command! -n=1 -complete=customlist,SoulCompleteBookmarks -bar SoulProject call SoulOpenProject('<args>')

function SoulTagLoad()
	call SoulTagMaker()
	exe "set tags=" . g:tagloader_filename
endfunction

function SoulTagReload()
	call SoulTagLoad()
	echo 'Tag reloaded.'
endfunction

function SoulTagMaker()
    let l:cmd = g:tagloader_cmd . " -R"
    if exists("g:tagloader_ignorefile")
        if filereadable(g:tagloader_ignorefile)
            let l:cmd = l:cmd . " --exclude=@" . g:tagloader_ignorefile
        else
            call writefile([], g:tagloader_ignorefile)
        endif
    endif
    let l:cmd = l:cmd . " -f " . g:tagloader_filename
	let l:mkResult = system(l:cmd)
	if !empty(l:mkResult)
		echoerr l:mkResult
	endif
endfunction

function SoulTagList()
	let l:cWord = expand("<cword>")
	if empty(l:cWord)
		echo "Please select a word."
	else
		exe "ts " . l:cWord
	endif
endfunction

function SoulTagAutoload()
	let bookmarks = g:NERDTreeBookmark.BookmarkNames()
	if(len(bookmarks))
		let loadtag = 0
		for bookmark in bookmarks
			if len(g:NERDTreeBookmark.BookmarkFor(bookmark))
				let path = SoulGetBookmarkPath(bookmark)
				if getcwd() == path
					call SoulTagLoad()
					break
				endif
			endif
		endfor
	endif
endfunction

function SoulOpenProject(name)
	if len(g:NERDTreeBookmark.BookmarkFor(a:name))
		let path = SoulGetBookmarkPath(a:name)
		exec ":NERDTreeFromBookmark " . a:name
		exec ":cd " . path
		call SoulTagAutoload()
	else
		echoerr "Not an valid bookmark."
	endif
endfunction

function SoulGetBookmarkPath(name)
	let _path = g:NERDTreeBookmark.BookmarkFor(a:name).path
	if $OS == 'Windows_NT'
		let path = _path.drive . '\' . join(_path.pathSegments, '\')
	else
		let path = '/'. join(_path.pathSegments, '/')
	endif
	return path
endfunction

function SoulCompleteBookmarks(A,L,P)
	return filter(g:NERDTreeBookmark.BookmarkNames(), 'v:val =~ "^' . a:A . '"')
endfunction
