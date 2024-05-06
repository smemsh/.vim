"
" scott@smemsh.net
" https://github.com/smemsh/.vim/
" https://spdx.org/licenses/GPL-2.0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use register `a' to store 14 characters of date output, paste it,
"
function! Read_shell_histtimeformat()
	let nowdate = system("date +$HISTTIMEFORMAT")
	call setreg('a', nowdate, 'b14')
	normal "ap
endfunction

" refresh the currently loaded colorscheme from its source file
" (as declared by the standard g:colors_name)
"
function! Reload_colorscheme()
	execute ":colorscheme " . g:colors_name
endfunction
