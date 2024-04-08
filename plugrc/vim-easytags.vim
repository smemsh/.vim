
" stop easytags from using a global tags file, make them
" project-specific, otherwise we have issues with identifiers
" that have nothing to do with each other in different projects
" being highlighted and jumping to other unrelated projects
"
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
