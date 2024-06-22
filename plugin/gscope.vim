"
" like the cscope interface, but uses gutentags-generated db
"

if !exists("g:gscope_done") | let g:gscope_done = 1 | else | finish | endif
if !has("cscope") || !has("channel") | finish | endif

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

" cs[acdefgistz]/:
"
function! s:GsgAbbrev(cschar) abort
	return (((getcmdtype() == ":" && (getcmdline() =~ ('^cs' . a:cschar)))
		\ ?  'GscopeFind ' : 'cs') . a:cschar)
endfunction
for s:abb in "acdefgistz"
exec 'cnoreabbrev <expr> cs' . s:abb . ' <SID>GsgAbbrev("' . s:abb . '")'
endfor

" cs[rhuk]/:
"
function! s:GsAbbrev(cschar, cmd) abort
	return ((getcmdtype() == ":" && (getcmdline() =~ ('^cs' . a:cschar)))
		\ ? a:cmd : ('cs' . a:cschar))
endfunction
for [cschar, cmd] in [
	\ ['r', 'call gutentags#rescan()'],
	\ ['h', 'call Gscope_menu()'],
	\ ['u', 'GutentagsUpdate'],
	\ ['k', 'GscopeKill'],
\ ]
	let s:abb = 'cs' . cschar
	let s:abbfunc = 'GsAbbrev(' . s:abb . ", '" . cmd . "')"
	let s:gsfunc = expand('<SID>') . s:abbfunc
	exec 'nnoremap ' . s:abb . ' :' . cmd . '<return>'
	exec 'cnoreabbrev <expr> ' . s:abb . ' ' . s:gsfunc
endfor

" menu for csh
"
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

" gutentags_plus takes care of 'cscope add' and db management.  restart every
" time we change working directory.  this lets us start with an empty buffer
"
if !has('patch-8.0.1459') | finish | endif
augroup DirChangedGroup
	au!
	autocmd DirChanged global
	\ if exists('*gutentags#rescan') | call gutentags#rescan() | endif
augroup END
