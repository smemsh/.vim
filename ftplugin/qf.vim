"

" make the quickfix window only the height of the results, up to a maximum
" https://vim.fandom.com/wiki/Automatically_fitting_a_quickfix_window_height
"
execute max([min([line("$"), 10]), 2]) . "wincmd _"

" the buffer contents are usually either tags or cscope output
setlocal nowrap
setlocal cursorline

" whether to let $VIM/ftplugin/qf.vim status line to be used.  if set to 0,
" status.vim will not work in quickfix windows, it will instead use some
" default status line defined in aforementioned.  make sure to set to 1,
" currently we do this in status.vim and have code there just for quickfix
"
"let g:qf_disable_statusline = 0
