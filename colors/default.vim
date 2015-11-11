"" highlighting

"" XXX TODO specific syntax highlighting

" generic color settings
highlight Cursor	cterm=NONE ctermfg=white	ctermbg=black
highlight Directory	cterm=NONE ctermfg=lightblue	ctermbg=black
highlight ErrorMsg	cterm=NONE ctermfg=lightred	ctermbg=black
highlight IncSearch	cterm=NONE ctermfg=yellow	ctermbg=blue
highlight ModeMsg	cterm=NONE ctermfg=white	ctermbg=black
highlight MoreMsg	cterm=NONE ctermfg=yellow	ctermbg=blue
highlight NonText	cterm=NONE ctermfg=lightcyan	ctermbg=black
highlight Question	cterm=NONE ctermfg=yellow	ctermbg=blue
highlight SpecialKey	cterm=NONE ctermfg=lightred	ctermbg=black
highlight StatusLine	cterm=NONE ctermfg=lightgreen	ctermbg=blue
highlight StatusLineNC	cterm=NONE ctermfg=grey		ctermbg=blue
highlight WarningMsg	cterm=NONE ctermfg=yellow	ctermbg=red
highlight LineNr	cterm=NONE ctermfg=lightgreen	ctermbg=black
highlight Normal	cterm=NONE ctermfg=grey		ctermbg=black
highlight Search	cterm=NONE ctermfg=yellow	ctermbg=blue
highlight Pmenu		cterm=NONE ctermfg=blue		ctermbg=grey
highlight PmenuSel	cterm=NONE ctermfg=red		ctermbg=white
highlight SpellBad	cterm=NONE ctermfg=lightred	ctermbg=black
highlight SpellCap	cterm=NONE ctermfg=blue		ctermbg=black
highlight SpellRare	cterm=NONE ctermfg=magenta	ctermbg=black
highlight SpellLocal	cterm=NONE ctermfg=lightblue	ctermbg=black

" subtly highlight text at 80 columns to indicate margin
highlight SubtleWarningMsg cterm=NONE ctermbg=blue
match SubtleWarningMsg /\%<81v.\%>80v/
