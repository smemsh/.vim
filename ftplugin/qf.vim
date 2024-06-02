"
" make the quickfix window only the height of the results, up to a maximum
" https://vim.fandom.com/wiki/Automatically_fitting_a_quickfix_window_height
"
execute max([min([line("$"), 10]), 1]) . "wincmd _"
