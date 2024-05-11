"

let statusline =
	\'%-5.50f' .
	\'[' .
	\'%{getbufinfo("%")[0].changed? "+": "-"}' .
	\']' .
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
