"

" does not work until 8.2.2529
"if !has('vim9script')
"	"legacy script implementation
"	finish
"endif
"vim9script
"" vim9script implementation

function StatusLine()

	" path to the file currently being edited
	let l:statusline_filename = '%-5.50f'

	" buffer is modified
	"
	if has('patch-7.4.2204') " getbufinfo()
		let l:statusline_modified =
		\'[' .
		\'%{getbufinfo("%")[0].changed? "+": "-"}' .
		\']' .
		\''
	else
		let l:statusline_modified = '%m'
	endif

	" buffer is readonly
	"
	if &readonly
		let l:statusline_readonly =
		\'[' .
		\'ro' .
		\']' .
		\''
	else
		let l:statusline_readonly = ""
	endif

	" paste mode is active
	if has('patch-8.1.1372')
		let l:statusline_paste = " "
		if &paste && (g:statusline_winid == win_getid())
			let l:statusline_paste .= "*"
		endif
	else
		let l:statusline_paste = '%{&paste ? " *" : ""}'
	endif

	" preview window is active
	"
	if &previewwindow
		let l:statusline_preview =
		\'[' .
		\'preview' .
		\']' .
		\''
	else
		let l:statusline_preview = ""
	endif

	" ftdetected syntax type if known
	"
	if len(&filetype) > 0
		let l:statusline_filetype =
		\'[' .
		\ &filetype .
		\']' .
		\''
	else
		let l:statusline_filetype = ""
	endif

	" buffer number represented by this window
	let l:statusline_bufnum = ' b%n'

	" decimal and hex code for character under cursor
	"
	let l:statusline_cursorchar = " %b 0x%B,"

	" byte offset into file
	"
	let l:statusline_offset = " %o 0x%O,"

	" line offset into file / total
	"
	let l:statusline_linepos = " L%l/%L"

	" column offset
	"
	let l:statusline_colpos = " C%c%V"

	" hundredths into file
	"
	let l:statusline_percent = " %P"

	return
	\ l:statusline_filename .
	\ l:statusline_modified .
	\ l:statusline_readonly .
	\ l:statusline_preview .
	\ l:statusline_filetype .
	\ l:statusline_bufnum .
	\ l:statusline_paste .
	\"%=" .
	\ l:statusline_cursorchar .
	\ l:statusline_offset .
	\ l:statusline_linepos .
	\ l:statusline_colpos .
	\ l:statusline_percent .
	\""
endfunc

set statusline=%!StatusLine()
