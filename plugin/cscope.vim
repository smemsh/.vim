"
" scott@smemsh.net
" https://github.com/smemsh/.vim/
" https://spdx.org/licenses/GPL-2.0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" see gscope.vim instead, cscope is older, does not handle spaces in filenames,
" not developed any longer, so we use gnu global with cscope mode
"
" TODO: remove this file after some time, they cannot co-exist because they use
" the same bindings.  used to have both available, but consensus seems to be
" that global is better anyways
"
finish

""" EOF """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if ! has("cscope")
	finish
endif

set cscopetag

set cscopetagorder =1 " tags file, then cscope
set cscopequickfix =s-,c-,d-,i-,t-,e-

" only be verbose about it on the initial load
"
set nocscopeverbose
	if filereadable("cscope.out")
		cscope add cscope.out
	elseif $CSCOPE_DB != ""
		cscope add $CSCOPE_DB
	endif
set cscopeverbose

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap csd :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap css :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap csa :!cscope -bR <CR>:cs add cscope.out<CR>

function! Cscope_menu ()
	echo
	\"cscope find:\n"
	\"  (c)allers   find functions calling this function\n"
	\"  (d)epends   find functions this one depends on\n"
	\"  (e)grep     find this egrep pattern\n"
	\"  (f)ile      find this file\n"
	\"  (g)lobal    find this definition\n"
	\"  (i)nclude   find files #including this file\n"
	\"  (s)ymbol    find this C symbol\n"
	\"  (t)o        find assignments to\n"
	\"? "
	let gotchar = getchar()
	execute "normal cs" . nr2char(gotchar)
endf
nnoremap csh :call Cscope_menu()<return>
