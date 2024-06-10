"

" we don't use the old cscope, gtags is better and has a cscope interface
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" always try to make a tags file in a project, even without a file yet
let g:gutentags_generate_on_empty_buffer = 1

" ctags should not follow symbolic links (ie installx dirs)
let g:gutentags_ctags_extra_args = ['--links=no']

" avoid keeping db files in project root, rarely used outside vim
" note: corresponding mkdir -p in rc.vim datadirs loop
let g:gutentags_cache_dir = expand('~/var/vim/tags')

" neither should gtags, but is set via environment in update_gtags.sh
let $GTAGS_ARGS = '--skip-symlink'

" we want gscope, ie gutentags_plus, to manage cscope for us
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_auto_add_cscope = 0
let g:gutentags_auto_add_pycscope = 0

" DEBUG
let g:gutentags_trace = 0
