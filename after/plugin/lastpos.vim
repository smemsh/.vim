"
" on start, restore last position in file; see :help last-position-jump
" (needs to run in after/ or else &filetype is still empty)
"
augroup RestoreCursor
  autocmd!
  autocmd BufReadPost *
    \ let line = line("'\"")
    \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
    \      && index(['xxd', 'gitrebase', 'help'], &filetype) == -1
    \ |   execute "normal! g`\""
    \ | endif
augroup END
