"

set cscopetag
set cscopetagorder =1 " tags file, then cscope
"set cscopetagorder =0 " cscope, then tags file
set cscopequickfix =s-,c-,d-,i-,t-,e-

" do our own maps (in plugin/gscope.vim)
let g:gutentags_plus_nomap = 1

" switch to the quickfix window after a gscope command
let g:gutentags_plus_switch = 1
