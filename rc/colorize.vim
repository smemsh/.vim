"
" makes ":colorize <foo>" become ":Colorize <foo>"
" makes ":ansiesc <foo>" become ":Colorize <foo>"
"
function s:ColorizeAbbrev() abort
	return (getcmdtype() == ":" && getcmdline() =~ '^colorize')
		\ ?  'Colorize' : 'colorize'
endfunction
cnoreabbrev <expr> colorize <SID>ColorizeAbbrev()

function s:AnsiEscAbbrev() abort
	return (getcmdtype() == ":" && getcmdline() =~ '^ansiesc')
		\ ?  'Colorize' : 'ansiesc'
endfunction
cnoreabbrev <expr> ansiesc <SID>AnsiEscAbbrev()
