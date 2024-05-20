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

	let l:winid = win_getid()
	if has('patch-8.1.1372')
		let l:our_win_current = (g:statusline_winid == l:winid)
	else | :
		" todo: how to do this on older versions?
	endif

	let l:status = ""

	" path to the file currently being edited
	let l:status .= '%-5.50f'

	" buffer is modified
	"
	if has('patch-7.4.2204') " getbufinfo()
		let l:status .=
		\'[' .
		\'%{getbufinfo("%")[0].changed? "+": "-"}' .
		\']' .
		\''
	else
		let l:status .= '%m'
	endif

	" buffer is readonly
	"
	if &readonly
		let l:status .=
		\'[' .
		\'RO' .
		\']' .
		\''
	endif

	" preview window is active
	"
	if &previewwindow
		let l:status .=
		\'[' .
		\'preview' .
		\']' .
		\''
	endif

	" ftdetected syntax type if known
	"
	if len(&filetype) > 0
		let l:status .=
		\'[' .
		\ &filetype .
		\']' .
		\''
	endif

	" buffer number represented by this window
	let l:status .= ' b%n'

	" paste mode is active
	"
	if exists('l:our_win_current')
		let l:status .= " "
		if &paste && l:our_win_current
			let l:status .= "*"
		endif
	else
		let l:status .= '%{&paste ? " *" : ""}'
	endif

	" relative to this mark, text justification is ipsilateral
	"
	let l:status .= "%="

	" decimal and hex code for character under cursor
	"
	let l:status .= " %b 0x%B,"

	" byte offset into file
	"
	let l:status .= " %o 0x%O,"

	" line offset into file / total
	"
	let l:status .= " L%l/%L"

	" column offset
	"
	let l:status .= " C%c%V"

	" hundredths into file
	"
	let l:status .= " %P"

	"
	return l:status
endfunc

set statusline=%!StatusLine()
