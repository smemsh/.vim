"

let g:gutentags_modules = ['ctags', 'gtags_cscope', 'cscope']

" designate a project even in absence of .git by touching a .root
let g:gutentags_project_root = ['.root']

" always make a tags file
let g:gutentags_generate_on_empty_buffer = 1
