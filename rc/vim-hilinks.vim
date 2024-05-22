"

" toggle display of syntax stack (uses drchip hilinks plugin)
" (note: plugin provided mapping <leader>hlt does not seem to work, so)
"        we overwrote <leader>h with something else and use this instead)
"
if ! exists(':HLTm')
nmap <leader>H          :HLTm<return>
endif
