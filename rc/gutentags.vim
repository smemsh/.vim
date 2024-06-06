"

" we don't use the old cscope, gtags is better and has a cscope interface
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" do our own maps (in plugin/gscope.vim)
let g:gutentags_plus_nomap = 1

" always try to make a tags file in a project, even without a file yet
let g:gutentags_generate_on_empty_buffer = 1

" ctags should not follow symbolic links (ie installx dirs)
let g:gutentags_ctags_extra_args = ['--links=no']

" neither should gtags, but is set via environment in update_gtags.sh
let $GTAGS_ARGS = '--skip-symlink'

" DEBUG
"let g:gutentags_trace = 1
