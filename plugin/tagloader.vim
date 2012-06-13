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

let s:pwd = expand("%:h")

function SoulTagPath()
	return s:pwd . '/' . g:tagloader_filename
endfunction

function SoulTagAddPath()
	if !exists("g:tagloader_autoload_config")
		echoerr "Variable `g:tagloader_autoload_config` not set. "
		return
	endif
	" try to make config file
	if !filereadable(g:tagloader_autoload_config)
		try
			call writefile([], g:tagloader_autoload_config)
		catch
			echoerr "File `" . g:tagloader_autoload_config . "` is not readable."
			return
		endtry
	endif
	if !filewritable(g:tagloader_autoload_config)
		echoerr "File `" . g:tagloader_autoload_config . " is not writable.`"
		return
	endif
	let tagloader_paths = readfile(g:tagloader_autoload_config)
	let has_entry = 0
	for path in tagloader_paths
		if strpart(path, 0, 1) == '#'
			continue
		endif
		if strpart(path, strlen(path) - 1, 1) == '/'
			let path = strpart(path, 0, strlen(path)-1)
		endif
		if s:pwd == path
			let has_entry = 1
			break
		endif
	endfor
	if has_entry
		echo "Path `" . s:pwd . "` exists."
	else
		let tagloader_paths = add(tagloader_paths, s:pwd)
		call writefile(tagloader_paths, g:tagloader_autoload_config)
		echo 'Added.'
	end
endfunction

function SoulTagLoad()
	let l:tagpath = SoulTagPath()
	if(!filereadable(l:tagpath))
		call SoulTagMaker()
	endif
	exe "set tags=" . l:tagpath
	if exists("g:tagloader_loaded_notify")
		echo 'Tag loaded.'
	end
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
			if s:pwd == path
				call SoulTagLoad()
				finish
			endif
		endfor
	endif
endif
