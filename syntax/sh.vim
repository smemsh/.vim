"
" we have to set this before the normal syntax is sourced, and it does not
" belong in global config, so we do this hack of sourcing the system one after
" setting it manually
"
let g:is_bash=1
source	$VIM/syntax/sh.vim
