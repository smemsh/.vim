"
" like the cscope interface, but uses gutentags-generated db
"

if !has("cscope") || !has("channel") | finish | endif

set cscopetag
"set cscopetagorder =1 " tags file, then cscope
set cscopetagorder =0 " cscope, then tags file
set cscopequickfix =s-,c-,d-,i-,t-,e-

"" gutentags_plus bundle takes care of db load and switch
""
" only be verbose about it on the initial load
"set nocscopeverbose
"	if filereadable("cscope.out")
"		cscope add cscope.out
"	elseif $CSCOPE_DB != ""
"		cscope add $CSCOPE_DB
"	endif
"set cscopeverbose

" todo: this is almost identical to cscope.vim, but with g* instead of c*,
" would be good to find some way to merge them
"
nnoremap csa <plug>GscopeFindAssign         <C-R><C-W><cr>
nnoremap csc <plug>GscopeFindCallingFunc    <C-R><C-W><cr>
nnoremap csd <plug>GscopeFindCalledFunc     <C-R><C-W><cr>
nnoremap cse <plug>GscopeFindEgrep          <C-R><C-W><cr>
nnoremap csf <plug>GscopeFindFile           <C-R>=expand("<cfile>")<cr><cr>
nnoremap csg <plug>GscopeFindDefinition     <C-R><C-W><cr>
nnoremap csi <plug>GscopeFindInclude        <C-R>=expand("<cfile>")<cr><cr>
nnoremap css <plug>GscopeFindSymbol         <C-R><C-W><cr>
nnoremap cst <plug>GscopeFindText           <C-R><C-W><cr>

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
	execute "normal cs" . nr2char(gotchar)
endf
nnoremap csh :call Gscope_menu()<return>
