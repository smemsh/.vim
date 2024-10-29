"

au BufNewFile,BufRead ~/{,src/}.bash/*\(.git/*\)\@<! set filetype=bash
