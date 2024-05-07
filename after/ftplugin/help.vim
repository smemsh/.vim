"

" make a lone 'q' exit the help buffer, without waiting to disambiguate other
" keys that start with 'q', which have no use in a help buffer
"
if exists("b:did_ftplugin_after") | finish | endif
noremap <buffer> q :bw<return>
augroup TimeoutRestore
	autocmd!
	autocmd BufEnter <buffer> let b:oldtol = &timeoutlen | set timeoutlen=1
	autocmd BufLeave <buffer> let &timeoutlen = b:oldtol
augroup END
let b:did_ftplugin_after = 1
