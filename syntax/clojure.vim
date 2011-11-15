" Vim syntax file
" Language:	Clojure
" Last Change:	2011 Nov 15
" Maintainer:	Wayne Xue <xwsoul@gmail.com>
" Original author:	Sergey Khorev <sergey.khorev@gmail.com>

" This script incorrectly recognizes some junk input as numerals:
" parsing the complete system of Scheme numerals using the pattern
" language is practically impossible: I did a lax approximation.

" MzScheme extensions can be activated with setting is_mzclojure variable

" Suggestions and bug reports are solicited by the author.

" Initializing:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"syn case ignore

" Fascist highlighting: everything that doesn't fit the rules is an error...

syn match	clojureError	![^ \t()\[\]";]*!
syn match	clojureError	")"

" Quoted and backquoted stuff

syn region clojureQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc

syn region clojureQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc
syn region clojureQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc

syn region clojureStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc
syn region clojureStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc

" Popular Scheme extension:
" using [] as well as ()
syn region clojureStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc
syn region clojureStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc

syn region clojureUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc
syn region clojureUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc

syn region clojureUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region clojureUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region clojureUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc
syn region clojureUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc

syn region clojureUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region clojureUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region clojureUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc
syn region clojureUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc

" R5RS Scheme Functions and Syntax:

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

" clojure
syn region clojureUnquote matchgroup=Delimiter start="#{" end="}" contains=ALLBUT,clojureStruc,clojureSyntax,clojureFunc
" syntax
syn keyword clojureSyntax quote first rest cons apply filter map
syn keyword clojureSyntax def let defn fn defstruct deref ref refer use
syn keyword clojureSyntax require load-file import
syn keyword clojureSyntax if do when forloop recur
syn keyword clojureSyntax nil new
syn keyword clojureSyntax take into
syn keyword clojureSyntax compile
syn keyword clojureSyntax try throw finally catch
" function
syn keyword clojureFunc doc find-doc class bean println format
syn keyword clojureFunc > >= < <= =
syn keyword clojureFunc + - * / . .. quot rem inc dec
" type test
syn keyword clojureFunc true? false? nil? empty? zero? string? keyword? symbol? instance?
" type convert
syn keyword clojureFunc str seq to-array
"for String
syn keyword clojureFunc interleave
"for vector & list
syn keyword clojureFunc range repeat iterate cycle concat count reverse drop-last sorted-set sorted-map
"for map
syn keyword clojureFunc get assoc keys
"for set
syn keyword clojureFunc dosync conj alter
"for struct
syn keyword clojureFunc struct struct-map
"for java.Array
syn keyword clojureFunc make-array into-array aset aget alength amap areduce memfn
"for meta
syn keyword clojureFunc meta
"for namespace
syn keyword clojureFunc resolve in-ns ns
"for benchmarking
syn keyword clojureFunc dotimes time
" constant
syn keyword clojureConstant	*e
" end clojure

" ... so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a clojureFunc)

syn match	clojureDelimiter	!\.[ \t\[\]()";]!me=e-1
syn match	clojureDelimiter	!\.$!
" ... and a single dot is not a number but a delimiter

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:

syn match	clojureOther	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	clojureError	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	clojureOther	"\.\.\."
syn match	clojureError	!\.\.\.[^ \t\[\]()";]\+!
" ... a special identifier

syn match	clojureConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*[ \t\[\]()";],me=e-1
syn match	clojureConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*$,
syn match	clojureError	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	clojureConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match	clojureConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	clojureError	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" Non-quoted lists, and strings:

syn region clojureStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region clojureStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region clojureStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region clojureStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Simple literals:
syn region clojureString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+

" Comments:

syn match	clojureComment	";.*$"


" Writing out the complete description of Scheme numerals without
" using variables is a day's work for a trained secretary...

syn match	clojureOther	![+-][ \t\[\]()";]!me=e-1
syn match	clojureOther	![+-]$!
"
" This is a useful lax approximation:
syn match	clojureNumber	"[-#+.]\=[0-9][-#+/0-9a-f@i.boxesfdl]*"
syn match	clojureError	![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!

syn match	clojureBoolean	"true|false"
syn match	clojureError	!#[tf][^ \t\[\]()";]\+!

syn match	clojureCharacter	"#\\"
syn match	clojureCharacter	"#\\."
syn match   clojureError		!#\\.[^ \t\[\]()";]\+!
syn match	clojureCharacter	"#\\space"
syn match	clojureError		!#\\space[^ \t\[\]()";]\+!
syn match	clojureCharacter	"#\\newline"
syn match	clojureError		!#\\newline[^ \t\[\]()";]\+!

" R6RS
syn match clojureCharacter "#\\x[0-9a-fA-F]\+"


" Synchronization and the wrapping up...

syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_clojure_syntax_inits")
  if version < 508
    let did_clojure_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink clojureSyntax		Statement
  HiLink clojureFunc		Function

  HiLink clojureString		String
  HiLink clojureCharacter	Character
  HiLink clojureNumber		Number
  HiLink clojureBoolean		Boolean

  HiLink clojureDelimiter	Delimiter
  HiLink clojureConstant	Constant

  HiLink clojureComment		Comment
  HiLink clojureMultilineComment	Comment
  HiLink clojureError		Error

  HiLink clojureExtSyntax	Type
  HiLink clojureExtFunc		PreProc
  delcommand HiLink
endif

let b:current_syntax = "clojure"
