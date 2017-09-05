"
" pomoutils.vim
"   vim syntax highlighting for pomoutils data file
"
" http://smemsh.net/src/pomoutils/
" http://spdx.org/licenses/GPL-2.0
" scott@smemsh.net
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" todo: check what this does and if actually needed
" todo: if this means skip if already loaded, how do we pick up changes?
" snarfed from http://vim.wikia.com/wiki/Creating_your_own_syntax_files
"
if exists("b:current_syntax")
	finish
endif

syn match pomoUtilsGroup ^[a-z]+
