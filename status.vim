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

function StatusLine()

	if has('patch-7.4.1557')
		let l:winid = win_getid()
		if has('patch-8.1.1372')
			let l:our_win_current = (g:statusline_winid == l:winid)
		endif
	endif

	let l:status = ""

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
	if exists('l:winid') && exists('l:our_win_current')
		if l:our_win_current
			let l:hi_filename   = '%#StatusLineFileName#'
			let l:hi_bracket    = '%#StatusLineBracket#'
			let l:hi_modified   = '%#StatusLineModified#'
			let l:hi_flags      = '%#StatusLineFlags#'
			let l:hi_filetype   = '%#StatusLineFileType#'
			let l:hi_paste      = '%#StatusLinePaste#'
			let l:hi_charcode   = '%#StatusLineCharCode#'
			let l:hi_offset     = '%#StatusLineOffset#'
			let l:hi_letter     = '%#StatusLineLetter#'
			let l:hi_coord      = '%#StatusLineCoord#'
			let l:hi_percent    = '%#StatusLinePercent#'
			let l:hi_bufnum     = '%#StatusLineBufNum#'
			let l:hi_comma      = '%#StatusLineComma#'
		else
			let l:hi_filename   = '%#StatusLineFileNameNC#'
			let l:hi_bracket    = '%#StatusLineBracketNC#'
			let l:hi_modified   = '%#StatusLineModifiedNC#'
			let l:hi_flags      = '%#StatusLineFlagsNC#'
			let l:hi_filetype   = '%#StatusLineFileTypeNC#'
			let l:hi_paste      = '%#StatusLinePasteNC#'
			let l:hi_charcode   = '%#StatusLineCharCodeNC#'
			let l:hi_offset     = '%#StatusLineOffsetNC#'
			let l:hi_letter     = '%#StatusLineLetterNC#'
			let l:hi_coord      = '%#StatusLineCoordNC#'
			let l:hi_percent    = '%#StatusLinePercentNC#'
			let l:hi_bufnum     = '%#StatusLineBufNumNC#'
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
	if has('patch-7.4.2204') " getbufinfo()
		let l:status .=
		\ l:lbracket .
		\ l:hi_modified .
		\'%{getbufinfo("%")[0].changed? "+": "-"}' .
		\ l:rbracket .
		\''
	else
		let l:status .= '%m'
	endif

	" buffer is readonly
	if &readonly
		let l:status .=
		\ l:lbracket .
		\ l:hi_flags .
		\'RO' .
		\ l:rbracket .
		\''
	endif

	" preview window is active
	if &previewwindow
		let l:status .=
		\ l:lbracket .
		\'preview' .
		\ l:rbracket .
		\''
	endif

	" ftdetected syntax type if known
	if len(&filetype) > 0
		let l:status .=
		\ l:lbracket .
		\ l:hi_filetype .
		\ &filetype .
		\ l:rbracket .
		\''
	endif

	" buffer number represented by this window
	let l:status .= l:hi_letter .  ' b' .  l:hi_bufnum .  '%n'

	" paste mode is active
	if exists('l:our_win_current')
		let l:status .= " "
		if &paste && l:our_win_current
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
