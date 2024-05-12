"

if has('patch-7.4.2204') " getbufinfo()
	let s:statusline_modified =
	\'[' .
	\'%{getbufinfo("%")[0].changed? "+": "-"}' .
	\']'
else
	let s:statusline_modified = '%m'
endif

let statusline =
	\'%-5.50f' .
	\ s:statusline_modified .
	\'%r' .
	\'%w' .
	\'%y' .
	\' b%n' .
	\'%{&paste && g:statusline_winid == g:actual_curwin ? " *" : ""}' .
	\"%=" .
	\" %b 0x%B," .
	\" %o 0x%O," .
	\" L%l/%L" .
	\" C%c%V" .
	\" %P" .
	\""

let &statusline = statusline
