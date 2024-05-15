"

au BufNewFile,BufRead ~/{,src/}.bash/*\(.git/*\)\@<! set filetype=bash
au BufNewFile,BufRead ~/lib/sh/*\(.git/*\)\@<! set filetype=bash
