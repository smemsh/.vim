"
" bufexplorer plugin

"
"nnoremap       <leader>l :ls<return>
nmap            <leader>l <leader>be

"
let g:bufExplorerShowDirectories        =0
let g:bufExplorerShowRelativePath       =1
let g:bufExplorerDefaultHelp            =0

" see bufexplorer.vim::BESetupSyntax
" for exactly which syntax patterns these correspond to
" below are defaults plucked from the source asof v7.2.8
"
"hi def link bufExplorerBufNbr Number
"hi def link bufExplorerMapping NonText
"hi def link bufExplorerHelp Special
"hi def link bufExplorerOpenIn Identifier
"hi def link bufExplorerSortBy String
"hi def link bufExplorerSplit NonText
"hi def link bufExplorerTitle NonText
"hi def link bufExplorerSortType bufExplorerSortBy
"hi def link bufExplorerToggleSplit bufExplorerSplit
"hi def link bufExplorerToggleOpen bufExplorerOpenIn
"hi def link bufExplorerActBuf Identifier
"hi def link bufExplorerAltBuf String
"hi def link bufExplorerCurBuf Type
"hi def link bufExplorerHidBuf Constant
"hi def link bufExplorerLockedBuf Special
"hi def link bufExplorerModBuf Exception
"hi def link bufExplorerUnlBuf Comment
