"
" vim statusline
"
" TODO: implement parallel function in vim9 and test for capability
" using this (8.2.2529+) idiom:
"
"   if !has('vim9script')
"       "legacy script implementation
"       finish
"   endif
"   vim9script
"   " vim9script implementation
"
" but then we have to maintain two parallel versions.  also vim8 and vim9 do
" not share comment character (?), so not sure how the files can coexist?
" for now we just write a vim8-only
"

" subtract from StatusLinePrefix ctermfg values to get StatusLinePrefixNC
let s:nc_hi_offset = 12

" highlight group prefix (group=StatusLinePrefixSuffix), ctermfg=
let s:hipairs =	[
	\ [ 'filename',   226 ],
	\ [ 'bracket',    114 ],
	\ [ 'modified',   213 ],
	\ [ 'flags',       35 ],
	\ [ 'filetype',    75 ],
	\ [ 'paste',      214 ],
	\ [ 'charcode',    44 ],
	\ [ 'offset',      38 ],
	\ [ 'letter',     142 ],
	\ [ 'coord',      116 ],
	\ [ 'percent',    112 ],
	\ [ 'bufnum',      82 ],
	\ [ 'comma',       71 ],
\ ]

" highlight group name suffix, cterm=<str>, ctermbg=<1-255>
let s:attrpairs = [
	\ [ '', 'italic', 17 ],
	\ [ 'NC', 'NONE', 17 ],
\ ]

for hipair in s:hipairs
	let s:firstloop = v:true
	for attrpair in s:attrpairs
		let s:suffix = attrpair[0]
		let s:cterm = attrpair[1]
		let s:bg = attrpair[2]
		let s:hi = hipair[0]
		let s:fg = hipair[1]
		execute ':hi '
		\ 'StatusLine' . toupper(s:hi[0]) . s:hi[1:] . s:suffix .
		\ ' cterm=' . s:cterm .
		\ ' ctermfg=' . (s:firstloop? s:fg: (s:fg - s:nc_hi_offset)) .
		\ ' ctermbg=' . s:bg .
		\''
		let s:firstloop = v:false
	endfor
endfor

function StatusLine() abort

	let l:status = ""

	if has('patch-8.1.1372')
		let l:bufn = winbufnr(g:statusline_winid)
		let l:bufinfo = getbufinfo(l:bufn)[0]
		let l:our_win_current = (g:statusline_winid == win_getid())
		let l:fullstatus = v:true
	else
		let l:fullstatus = v:false
	endif

	" /etc/passwd [-] [RO]
	" <filename> <bracket> <modified> <bracket> <bracket> <flags> <bracket>
	"
	" [passwd] b2 *?
	" <bracket> <filetype> <bracket> <letter> <bufnum> <paste>
	"
	" %=
	"
	" 120 0x78, 6 0x6,
	" <charcode> <comma> <offset> <comma>
	"
	" L1/45 C6 Top
	" <letter> <coord> <letter> <coord> <percent>
	"
	if l:fullstatus
		if l:our_win_current
			let l:hi_filename   = '%#StatusLineFilename#'
			let l:hi_bracket    = '%#StatusLineBracket#'
			let l:hi_modified   = '%#StatusLineModified#'
			let l:hi_flags      = '%#StatusLineFlags#'
			let l:hi_filetype   = '%#StatusLineFiletype#'
			let l:hi_paste      = '%#StatusLinePaste#'
			let l:hi_charcode   = '%#StatusLineCharcode#'
			let l:hi_offset     = '%#StatusLineOffset#'
			let l:hi_letter     = '%#StatusLineLetter#'
			let l:hi_coord      = '%#StatusLineCoord#'
			let l:hi_percent    = '%#StatusLinePercent#'
			let l:hi_bufnum     = '%#StatusLineBufnum#'
			let l:hi_comma      = '%#StatusLineComma#'
		else
			let l:hi_filename   = '%#StatusLineFilenameNC#'
			let l:hi_bracket    = '%#StatusLineBracketNC#'
			let l:hi_modified   = '%#StatusLineModifiedNC#'
			let l:hi_flags      = '%#StatusLineFlagsNC#'
			let l:hi_filetype   = '%#StatusLineFiletypeNC#'
			let l:hi_paste      = '%#StatusLinePasteNC#'
			let l:hi_charcode   = '%#StatusLineCharcodeNC#'
			let l:hi_offset     = '%#StatusLineOffsetNC#'
			let l:hi_letter     = '%#StatusLineLetterNC#'
			let l:hi_coord      = '%#StatusLineCoordNC#'
			let l:hi_percent    = '%#StatusLinePercentNC#'
			let l:hi_bufnum     = '%#StatusLineBufnumNC#'
			let l:hi_comma      = '%#StatusLineCommaNC#'
		endif
	else
		" if we don't provide any highlighting escapes, the whole thing
		" will be StatusLine or StatusLineNC depending on if active.
		" this will be fine for older vim versions.
		"
		let l:hi_filename   = ''
		let l:hi_bracket    = ''
		let l:hi_modified   = ''
		let l:hi_flags      = ''
		let l:hi_filetype   = ''
		let l:hi_paste      = ''
		let l:hi_charcode   = ''
		let l:hi_offset     = ''
		let l:hi_letter     = ''
		let l:hi_coord      = ''
		let l:hi_percent    = ''
		let l:hi_bufnum     = ''
		let l:hi_comma      = ''
	endif

	"
	let l:lbracket = l:hi_bracket . '['
	let l:rbracket = l:hi_bracket . ']'

	" path to the file currently being edited
	let l:status .= l:hi_filename
	let l:status .= '%-5.50f'

	" buffer is modified
	if l:fullstatus
		let l:status .=
		\ l:lbracket .
		\ l:hi_modified .
		\ (l:bufinfo.changed ? "+" : "-") .
		\ l:rbracket .
		\''
	else
		let l:status .= '%m'
	endif

	" buffer is readonly
	if l:fullstatus && getbufvar(l:bufn, "&readonly")
		let l:status .=
		\ l:lbracket .
		\ l:hi_flags .
		\'RO' .
		\ l:rbracket .
		\''
	else
		let l:status .= '%r'
	endif

	" preview window is active
	if l:fullstatus && getbufvar(l:bufn, '&previewwindow')
		let l:status .=
		\ l:lbracket .
		\'preview' .
		\ l:rbracket .
		\''
	else
		let l:status .= '%w'
	endif

	" ftdetected syntax type if known
	if l:fullstatus
		let l:ft = getbufvar(l:bufn, '&filetype')
		if strlen(l:ft) != 0
			let l:status .=
			\ l:lbracket .
			\ l:hi_filetype .
			\ l:ft .
			\ l:rbracket .
			\''
		endif
	else
		let l:status .= '%y'
	endif

	" buffer number represented by this window
	let l:status .= l:hi_letter .  ' b' .  l:hi_bufnum .  '%n'

	" paste mode is active
	if l:fullstatus
		let l:status .= " "
		if getbufvar(l:bufn, &paste) && l:our_win_current
			let l:status .= l:hi_paste . "*"
		endif
	else
		let l:status .= '%{&paste ? " *" : ""}'
	endif

	" relative to this mark, text justification is ipsilateral
	let l:status .= "%="

	" decimal and hex code for character under cursor
	let l:status .= l:hi_charcode . " %b 0x%B" .  l:hi_comma .  ","

	" byte offset into file
	let l:status .= l:hi_offset . " %o 0x%O" .  l:hi_comma . ","

	" line offset into file / total
	let l:status .= l:hi_letter . " L" . l:hi_coord . "%l/%L"

	" column offset
	let l:status .= l:hi_letter . " C" . l:hi_coord . "%c%V"

	" hundredths into file
	let l:status .= l:hi_percent . " %P"

	"
	return l:status
endfunc

set statusline=%!StatusLine()
