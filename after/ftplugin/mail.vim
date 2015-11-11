"

set nosmartindent

set expandtab

set tabstop		=4
set shiftwidth		=4
set textwidth		=55
set formatoptions	+=an

set spelllang		=en_us
set spell

" we get artifacts where the parent is getting suspended of
" us if we don't do this, and then on resume the tty input
" goes to either us or the parent or both!
"
map <C-Z>		:shell<CR>
