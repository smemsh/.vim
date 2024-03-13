"
" subtly highlight text at 80 columns to indicate margin
"
" todo: this should really be in filetype-specific files, but 'match' is
" window-local so it means if we set it once for a window, then edit a
" different type of file in that window, it will still have the old
" value.  so we need to use autocommands to re-set based on filetype.
" we'll centralize in this file for now...
"
" note: cannot use 'colorcolumn' since it matches even if no text

hi warncol ctermbg=234
augroup eightycols
	autocmd!
	" need to use %</%> rather than just %80v to handle tabs, etc
	autocmd FileType * match warncol /\%<81v.\%>80v/
	autocmd FileType rust match warncol /\%<101v.\%>100v/
augroup END
