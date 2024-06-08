"
" makes ":vedit <foo>" become ":Bufferize <foo>"
"
function s:VeditAbbrev() abort
	return (getcmdtype() == ":" && getcmdline() =~ '^vedit')
		\ ?  'Bufferize' : 'vedit'
endfunction
cnoreabbrev <expr> vedit <SID>VeditAbbrev()
