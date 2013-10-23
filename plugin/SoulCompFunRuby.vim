function SoulCompFunRuby(findstart, base)
    if a:findstart
        let line = getline('.')
        let start = col('.') - 1
        while start >= 0 && line[start - 1] =~ '[a-zA-Z_0-9]'
            let start -= 1
        endwhile
        return start
    else
        let res = []
        for k in s:rubylists
            if k =~ '^' . a:base
                call add(res, k)
            endif
        endfor
        return res
    endif
endfunction

let s:rubylists = [
\ 'all',
\ 'attr_accessor',
\ 'attr_reader',
\ 'attr_writer',
\ 'any',
\ 'begin',
\ 'call',
\ 'capitalize',
\ 'capitalize',
\ 'class',
\ 'define_method',
\ 'delete_if',
\ 'downcase',
\ 'each',
\ 'each_with_index',
\ 'empty?',
\ 'end_with?',
\ 'ensure',
\ 'find_all',
\ 'initialize',
\ 'inject',
\ 'inspect',
\ 'is_a?',
\ 'join',
\ 'length',
\ 'methods',
\ 'new',
\ 'nil?',
\ 'open',
\ 'pop',
\ 'push',
\ 'puts',
\ 'raise',
\ 'rescue',
\ 'respond_to?',
\ 'reverse',
\ 'size',
\ 'super',
\ 'superclass',
\ 'sort',
\ 'start_with?',
\ 'to_f',
\ 'to_i',
\ 'to_s',
\ 'times',
\ 'upcase',
\ 'yield',
\ 'zero?'
\ ]
