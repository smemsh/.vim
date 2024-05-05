"

let g:polyglot_disabled = []

" do syntax highlighting only, don't try to do other things, see #672
let g:polyglot_disabled += ['sensible']

" we want the system yaml, which has a lot better syntax for operators and the
" like.  the one included with polyglot basically sucks
"
let g:polyglot_disabled += ['yaml']
