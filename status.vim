"

if has('patch-7.4.2204') " getbufinfo()
	let s:statusline_modified =
	\'[' .
	\'%{getbufinfo("%")[0].changed? "+": "-"}' .
	\']'
else
	let s:statusline_modified = '%m'
endif

if has('patch-8.1.1372')
	let s:statusline_paste =
	\'%{&paste && g:statusline_winid == g:actual_curwin ? " *" : ""}'
else
	let s:statusline_paste =
	\'%{&paste ? " *" : ""}'
endif

let s:statusline =
	\'%-5.50f' .
	\ s:statusline_modified .
	\'%r' .
	\'%w' .
	\'%y' .
	\' b%n' .
	\ s:statusline_paste .
	\"%=" .
	\" %b 0x%B," .
	\" %o 0x%O," .
	\" L%l/%L" .
	\" C%c%V" .
	\" %P" .
	\""

let &statusline = s:statusline
