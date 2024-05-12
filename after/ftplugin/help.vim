"

" make a lone 'q' exit the help buffer, without waiting to disambiguate other
" keys that start with 'q', which have no use in a help buffer
"
" update: we sometimes use a couple bindings like for bufexplorer, nohlsearch
" macros, so we made the timeout 100 instead of 1
"
if exists("b:did_ftplugin_after") | finish | endif

noremap <buffer> q :bw<return>
augroup TimeoutRestore
	autocmd!
	autocmd BufEnter <buffer> let b:oldtm = &timeoutlen | set tm=100
	autocmd BufLeave <buffer> let &timeoutlen = b:oldtm
augroup END

" override the global 'list' setting for help buffers.  because of the help
" window trickery we implemented in helpcurwin.vim we have to attach this to
" buffer events.  note that this is a window, not buffer specific local option.
" WinEnter, WinNew, BufNew, or failing to use <buffer> seem not to work...
"
augroup HelpWindowNolist
	autocmd!
	autocmd BufEnter <buffer> setlocal nolist
augroup END

let b:did_ftplugin_after = 1
