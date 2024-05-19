"
" scott@smemsh.net
" like the cscope interface, but uses gutentags-generated db
"

if ! has("cscope") && has("channel")
	finish
endif

" todo: this is almost identical to cscope.vim, but with g* instead of c*,
" would be good to find some way to merge them
"
nnoremap gsa :GscopeFind a <C-R><C-W><cr>
nnoremap gsc :GscopeFind c <C-R><C-W><cr>
nnoremap gsd :GscopeFind d <C-R><C-W><cr>
nnoremap gse :GscopeFind e <C-R><C-W><cr>
nnoremap gsf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
nnoremap gsg :GscopeFind g <C-R><C-W><cr>
nnoremap gsi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
nnoremap gss :GscopeFind s <C-R><C-W><cr>
nnoremap gst :GscopeFind t <C-R><C-W><cr>

function! Gscope_menu ()
	echo
	\"gscope find:\n"
	\"  (a)ssigns   find places this is assigned to\n"
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
	execute "normal gs" . nr2char(gotchar)
endf
nnoremap gsh :call Gscope_menu()<return>
