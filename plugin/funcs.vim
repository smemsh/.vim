"
" generate a quickfix window with all the functions in the current file
" https://stackoverflow.com/a/5638891/5616796
"
function s:Funcs() abort
	let l:qfcommand =
	\ "ctags -x " .
	\ "\"" . bufname('%') . "\" " .
	\ "| awk '$2 == \"function\" {" .
	\ "     printf(\"%s|%s| %s\\t\", $4, $3, $1); " .
	\ "     $1 = $2 = $3 = $4 = \"\"; " .
	\ "     gsub(\"\\t\", \"\\x20\"); " .
	\ "     print;" .
	\ "}' " .
	\ "| tr -s $'\\x20' " .
	\ "| column -s $'\\t' -t " .
	\''
	cexpr system(l:qfcommand)
	cwindow
	let w:quickfix_title = 'funcs'
endfunc

command -nargs=0 Funcs call s:Funcs()
function s:FuncsAbbrev() abort
	if getcmdtype() == ":" && getcmdline() =~ '^funcs'
		return 'Funcs'
	else
		return 'funcs'
	endif
endfunction
cnoreabbrev <expr> funcs <SID>FuncsAbbrev()
