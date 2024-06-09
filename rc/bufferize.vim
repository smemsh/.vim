"
" makes ":vedit <foo>" become ":Bufferize <foo>"
" makes ":bufferize <foo>" become ":Bufferize <foo>"
"
function s:VeditAbbrev() abort
	return (getcmdtype() == ":" && getcmdline() =~ '^vedit')
		\ ?  'Bufferize' : 'vedit'
endfunction
cnoreabbrev <expr> vedit <SID>VeditAbbrev()

function s:BufferizeAbbrev() abort
	return (getcmdtype() == ":" && getcmdline() =~ '^bufferize')
		\ ?  'Bufferize' : 'bufferize'
endfunction
cnoreabbrev <expr> bufferize <SID>BufferizeAbbrev()
