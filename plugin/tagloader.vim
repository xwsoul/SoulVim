"
" A tool to make, load, manage tags
" Maintainer:   Wayne Xue <xwsoul@gmail.com>
" Version:      Vim 7.2 or higher
" URL:          http://github.com/xwsoul/SoulVim
"

if !exists("g:tagloader_cmd")
	finish
endif

if !executable(g:tagloader_cmd)
	echoerr "File " . g:tagloader_cmd . " can't be executable."
	finish
endif

function! SoulTagPath()
	return $PWD . '/' . g:tagloader_filename
endfunction

function SoulTagLoad()
	let l:tagpath = SoulTagPath()
	if(!filereadable(l:tagpath))
		call SoulTagMaker()
	endif
	exe "set tags=" . l:tagpath
	echo 'Tag loaded.'
endfunction

function SoulTagReload()
	call SoulTagMaker()
	exe "set tags=" . SoulTagPath()
	echo 'Tag reloaded.'
endfunction

function SoulTagMaker()
	let l:mkResult = system("ctags -R -f" . SoulTagPath())
	if empty(l:mkResult)
		echo "Tag generated."
	else
		echoerr l:mkResult
	endif
endfunction

if exists("g:tagloader_autoload") && g:tagloader_autoload
	if exists("g:tagloader_autoload_config") && filereadable(g:tagloader_autoload_config)
		let tagloader_paths = readfile(g:tagloader_autoload_config)
		for path in tagloader_paths
			if strpart(path, 0, 1) == '#'
				continue
			endif
			if strpart(path, strlen(path) - 1, 1) == '/'
				let path = strpart(path, 0, strlen(path)-1)
			endif
			if $PWD == path
				call SoulTagLoad()
			endif
		endfor
	endif
endif
