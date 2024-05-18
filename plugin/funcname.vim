"
" snarfed from https://stackoverflow.com/a/41747129/5616796
"

function! s:Funcname() abort
	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bWn'))
endfunction

command -nargs=? Funcname call s:Funcname()
function s:FuncnameAbbrev() abort
	if getcmdtype() == ":" && getcmdline() =~ '^funcname'
		return 'Funcname'
	else
		return ''
	endif
endfunction
cnoreabbrev <expr> funcname <SID>FuncnameAbbrev()

nmap <leader>F :call <SID>Funcname()<return>