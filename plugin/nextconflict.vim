"
" got to next/prev conflict or hunk
"
let g:conflictpat	= '^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)' " @tpope
nmap ]n			:call search(g:conflictpat)<return>
nmap [n			:call search(g:conflictpat, 'b')<return>
