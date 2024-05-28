"
" note: netrw is a core plugin shipped with vim distribution
"

" normally netrw keeps .netrwhist in the first $rtp it finds,
" but we want to keep it with our other state files
" (directory is created if it does not exist)
"
let g:netrw_home = expand("~/var/vim/netrw")

" if set, viewer is invoked with 'shellredir' to /dev/null appended, which
" breaks programs that use the terminal.  this is ok only if we're going to
" fork, spawn another window, and return.  however if the viewer should be run
" on the vim terminal with vim blocked until completion, unset (no suppress)
"
"let g:netrw_suppress_gx_mesg = 0
"let g:netrw_browsex_viewer = 'elinks'

" in practice, seems better to create a new window and come back to vim, this
" lets the user switch back and forth doing more editing after browser opens
"
let g:netrw_suppress_gx_mesg = 1
let g:netrw_browsex_viewer = 'rpafter setsid -f st elinks'
