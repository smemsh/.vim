"


function StatusLine()

	" buffer is modified
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
	if len(&filetype) > 0
		let l:statusline_filetype =
		\'[' .
		\ &filetype .
		\']' .
		\''
	else
		let l:statusline_filetype = ""
	endif

	return
	\'%-5.50f' .
	\ l:statusline_modified .
	\ l:statusline_readonly .
	\ l:statusline_preview .
	\ l:statusline_filetype .
	\' b%n' .
	\ l:statusline_paste .
	\"%=" .
	\" %b 0x%B," .
	\" %o 0x%O," .
	\" L%l/%L" .
	\" C%c%V" .
	\" %P" .
	\""
endfunc

set statusline=%!StatusLine()
