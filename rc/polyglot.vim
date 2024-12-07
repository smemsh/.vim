"

let g:polyglot_disabled = []

" syntax highlighting only, don't try to do other things; see also #672, #748
let g:polyglot_disabled += ['sensible']
let g:polyglot_disabled += ['ftdetect']
let g:polyglot_disabled += ['autoindent']
let g:polyglot_disabled += ['sleuth']

" we want the system yaml, which has a lot better syntax for operators and the
" like.  the one included with polyglot basically sucks (TODO: was 2017, retry)
"
let g:polyglot_disabled += ['yaml']

" system provided one recently and now seems to be maintained
"
let g:polyglot_disabled += ['jinja', 'jinja2']
