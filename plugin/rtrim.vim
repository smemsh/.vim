"
" trims whitespace in the given range, defaults to whole file
"
" https://stackoverflow.com/questions/62075745/ (command to operate on range)
" https://stackoverflow.com/questions/11011304/ (range space pattern)
"

function! Rtrim() range abort
	for n in range(a:firstline, a:lastline)
		let l:old = getline(n)
		let l:new = substitute(l:old, '\s*$', '', '')
		call setline(n, l:new)
	endfor
endfunction

" we have to stash the position before calling the function because
" when using a function having the 'range' attribute, getpos() just
" returns the first line in the range.  it's unclear why, but even using
" "call Rtrim(getpos('.')" does not work, the retreived position is
" still the first line.  so we have to do the position manipulation
" entirely outside the called function
"
command -range=% Rtrim
\ let s:savedpos = getpos('.') |
\ <line1>,<line2> call Rtrim() |
\ call setpos('.', s:savedpos)

" match range spec, up to the rest of the command
let s:rendpt = '\%(\d\+\|[.$%]\|''\S\|\\[/?&]\|/[^/]*/\|?[^?]*?\)\%([+-]\d*\)\?'
let s:rexpr = s:rendpt . '\%([,;]' . s:rendpt . '\)\?'
let s:rupto = '^\%(.*\\\@<!|\)\?\s*' . s:rexpr . '\ze\s*\h'

function s:RtrimAbbrev() abort
	let l:cmdline = getcmdline()
	let l:rtocmd = matchstr(l:cmdline, s:rupto) " possible range before cmd
	let l:rafter = strpart(l:cmdline, strlen(l:rtocmd)) " cmd itself after
	if getcmdtype() == ":" && l:rafter =~ '^rtrim'
		return 'Rtrim'
	else
		return 'rtrim'
	endif
endfunction
cnoreabbrev <expr> rtrim <SID>RtrimAbbrev()

map <leader>m :rtrim<return>
