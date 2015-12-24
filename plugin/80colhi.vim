"
" subtly highlight text at 80 columns to indicate margin
"
hi terminalWidthWarning ctermbg=234
match terminalWidthWarning /\%<81v.\%>80v/
