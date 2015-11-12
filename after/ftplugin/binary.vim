" vim -b : edit binary using xxd-format!
"augroup binary
"au!
"au BufReadPre  *.exe let &bin=1
au BufReadPost *.exe %!xxd
au BufReadPost *.exe set ft=xxd
au BufReadPost *.exe set binary
au BufWritePre *.exe %!xxd -r
au BufWritePost *.exe %!xxd
au BufWritePost *.exe set nomod
"augroup END
