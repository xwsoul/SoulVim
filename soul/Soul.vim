function SoulComment(str)
	let lineStr = getline(line("."))
	let str = a:str.l:lineStr
	setline(".", l:str)
endfunction
