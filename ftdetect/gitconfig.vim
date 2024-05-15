"

au BufNewFile,BufRead ~/{,src/}.gitcli/*\(.git/*\)\@<! set filetype=gitconfig
