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

" all ctermfg are 12 more than their NC-suffixed equivalents
hi StatusLineFilename     cterm=italic      ctermfg=226     ctermbg=17
hi StatusLineBracket      cterm=italic      ctermfg=114     ctermbg=17
hi StatusLineModified     cterm=italic      ctermfg=213     ctermbg=17
hi StatusLineFlags        cterm=italic      ctermfg=35      ctermbg=17
hi StatusLineFiletype     cterm=italic      ctermfg=75      ctermbg=17
hi StatusLinePaste        cterm=italic      ctermfg=214     ctermbg=17
hi StatusLineCharcode     cterm=italic      ctermfg=44      ctermbg=17
hi StatusLineOffset       cterm=italic      ctermfg=38      ctermbg=17
hi StatusLineLetter       cterm=italic      ctermfg=142     ctermbg=17
hi StatusLineCoord        cterm=italic      ctermfg=116     ctermbg=17
hi StatusLinePercent      cterm=italic      ctermfg=112     ctermbg=17
hi StatusLineBufnum       cterm=italic      ctermfg=82      ctermbg=17
hi StatusLineComma        cterm=italic      ctermfg=71      ctermbg=17

" all ctermfg are 12 less than their non-NC equivalents
hi StatusLineFilenameNC   cterm=NONE        ctermfg=214     ctermbg=17
hi StatusLineBracketNC    cterm=NONE        ctermfg=102     ctermbg=17
hi StatusLineModifiedNC   cterm=NONE        ctermfg=201     ctermbg=17
hi StatusLineFlagsNC      cterm=NONE        ctermfg=23      ctermbg=17
hi StatusLineFiletypeNC   cterm=NONE        ctermfg=63      ctermbg=17
hi StatusLinePasteNC      cterm=NONE        ctermfg=202     ctermbg=17
hi StatusLineCharcodeNC   cterm=NONE        ctermfg=32      ctermbg=17
hi StatusLineOffsetNC     cterm=NONE        ctermfg=26      ctermbg=17
hi StatusLineLetterNC     cterm=NONE        ctermfg=130     ctermbg=17
hi StatusLineCoordNC      cterm=NONE        ctermfg=104     ctermbg=17
hi StatusLinePercentNC    cterm=NONE        ctermfg=100     ctermbg=17
hi StatusLineBufnumNC     cterm=NONE        ctermfg=70      ctermbg=17
hi StatusLineCommaNC      cterm=NONE        ctermfg=59      ctermbg=17

function StatusLine()

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
