"

" enable globally at vim startup
"
let g:IndentTab = 1

" keymaps to toggle the smart tabs vim-wide
"
nmap <leader>I :call IndentTab#Set(1, 1)<return>
nmap <leader>i :call IndentTab#Set(0, 1)<return>
