"
" like the cscope interface, but uses gutentags-generated db
"

if !has("cscope") || !has("channel") | finish | endif

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
nnoremap csa <plug>GscopeFindAssign
nnoremap csc <plug>GscopeFindCallingFunc
nnoremap csd <plug>GscopeFindCalledFunc
nnoremap cse <plug>GscopeFindEgrep
nnoremap csf <plug>GscopeFindFile
nnoremap csg <plug>GscopeFindDefinition
nnoremap csi <plug>GscopeFindInclude
nnoremap css <plug>GscopeFindSymbol
nnoremap cst <plug>GscopeFindText
nnoremap csz <plug>GscopeFindCtag

function s:GsgAbbrev(cstype) abort
	return (((getcmdtype() == ":" && (getcmdline() =~ ('^cs' . a:cstype)))
		\ ?  'GscopeFind ' : 'cs') . a:cstype)
endfunction
for s:abb in "acdefgistz"
exec 'cnoreabbrev <expr> cs' . s:abb . ' <SID>GsgAbbrev("' . s:abb . '")'
endfor

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
	\"  (z)tags     find matching ctags\n"
	\"? "
	let gotchar = getchar()
	execute "normal cs" . nr2char(gotchar)
endf
nnoremap csh :call Gscope_menu()<return>
