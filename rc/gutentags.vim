"

" we try to always use ctags and gtags, but if no gtags, try cscope
"
let g:gutentags_modules = []
if executable('ctags') | let g:gutentags_modules += ['ctags'] | endif
if executable('gtags') | let g:gutentags_modules += ['gtags_cscope']
elseif executable('cscope') | let g:gutentags_modules += ['cscope'] | endif
if empty(g:gutentags_modules) | let g:gutentags_dont_load = 1 | endif

" always try to make a tags file in a project, even without a file yet
"let g:gutentags_generate_on_empty_buffer = 1

" XXX gutentags is giving us problems, require it to be run explicitly
" see task b9efdc9d
"
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_write = 0

" let the user toggle
let g_gutentags_define_advanced_commands = 1

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

" no need for gtags to run when we're working with the scm metadata
let g:gutentags_exclude_filteypes = []
let g:gutentags_exclude_filteypes += ['gitcommit']
let g:gutentags_exclude_filteypes += ['gitrebase']
let g:gutentags_exclude_filteypes += ['gitattributes']
let g:gutentags_exclude_filteypes += ['gitignore']

" DEBUG
let g:gutentags_trace = 0
