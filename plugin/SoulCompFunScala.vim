function SoulCompFunScala(findstart, base)
    if a:findstart
        let line = getline('.')
        let start = col('.') - 1
        while start >= 0 && line[start - 1] =~ '[a-zA-Z_0-9]'
            let start -= 1
        endwhile
        return start
    else
        let res = []
        for k in s:scalalists
            if k =~ '^' . a:base
                call add(res, k)
            endif
        endfor
        return res
    endif
endfunction

let s:scalalists = [
\ 'apply(',
\ 'Array',
\ 'Boolean',
\ 'Byte',
\ 'capitalize',
\ 'Char',
\ 'count(',
\ 'contains(',
\ 'Double',
\ 'drop(',
\ 'dropRight(',
\ 'exists(',
\ 'extends',
\ 'filter(',
\ 'Float',
\ 'forall(',
\ 'foreach(',
\ 'head',
\ 'init',
\ 'Int',
\ 'isEmpty',
\ 'isInfinity',
\ 'last',
\ 'length',
\ 'List',
\ 'Long',
\ 'Map',
\ 'map(',
\ 'mkString(',
\ 'new',
\ 'object',
\ 'override',
\ 'package',
\ 'print(',
\ 'println(',
\ 'private',
\ 'range(',
\ 'readLine()',
\ 'reduce(',
\ 'remove(',
\ 'require(',
\ 'reverse',
\ 'Set',
\ 'Short',
\ 'sort(',
\ 'String',
\ 'super',
\ 'Symbol',
\ 'tail',
\ 'toString',
\ 'trait',
\ 'Unit',
\ 'update(',
\ 'val',
\ 'var',
\ 'with'
\ ]
