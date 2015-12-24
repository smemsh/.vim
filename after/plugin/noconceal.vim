"

" disable concealing entirely for all files
"
" has to be the last autocommand (hence, presence in after/),
" otherwise syntax files will be sourced afterwards and try to
" be helpful by setting conceallevel nonzero
"
" TODO: disabling conceal should have a global vim setting
" TODO: check if can fail (not last au?) when conceal in after/syntax/
"
if has("conceal")
	autocmd FileType * setl conceallevel=0
endif
