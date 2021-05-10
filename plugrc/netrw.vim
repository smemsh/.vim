"
" note: netrw is a core plugin shipped with vim distribution
"
" normally netrw keeps .netrwhist in the first $rtp it finds,
" but we want to keep it with our other state files
" (directory is created if it does not exist)
"
"
let g:netrw_home = expand("~/var/vim/netrw")
