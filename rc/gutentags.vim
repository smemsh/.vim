"

let g:gutentags_modules = ['ctags', 'gtags_cscope', 'cscope']

" do our own maps (in gscope.vim plugin)
let g:gutentags_plus_nomap = 1

" always make a tags file
let g:gutentags_generate_on_empty_buffer = 1

" ctags should not follow symbolic links (ie installx dirs)
let g:gutentags_ctags_extra_args = ['--links=no']

" neither should gtags, but is set via environment in update_gtags.sh
let $GTAGS_ARGS = '--skip-symlink'
