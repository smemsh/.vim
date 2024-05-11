"
" uses current window for help buffer, replacing the active buffer, rather than
" making a new window, as vim normally does.
"

" snarfed from tips.txt help file, tag 'help-curwin', added in non-patch
" runtime file update just prior to vim 8.2.2276 (commit 7e6a515ed1)
"
" issues:
" - leaves around a help.txt listed buffer
" - only one help window can be used at a time
" - goes to the right help file, but not the tag offset
"
if !has('patch-7.4.2011') | finish | endif " getcompletion()
command -nargs=? -complete=help Help execute s:Help(<q-args>)
let s:did_open_help = v:false
function s:Help(subject) abort
	let mods = 'silent noautocmd keepalt'
	if !s:did_open_help
		execute mods . ' help'
		execute mods . ' helpclose'
		let s:did_open_help = v:true
	endif
	if !getcompletion(a:subject, 'help')->empty()
		execute mods . ' edit ' . &helpfile
		set buftype=help
	endif
	return 'help ' . a:subject
endfunction

" make :help and :h commands run our :Help rather than builtin
" (really it just replaces the command in realtime whilst typing)
"
" getcmdtype() = 7.0149
" getcmdline() = 7.0001
"
function HelpAbbrev(arg) abort
	let pat = '^' . a:arg
	return getcmdtype() == ":" && getcmdline() =~ pat ? 'Help' : a:arg
endfunction

if has('patch-8.2.4883') " string interpolation
	for a in ['help', 'h']
	execute $"cnoreabbrev <expr> {a} HelpAbbrev('{a}')" | endfor
else
	" todo: remove this case once all deployed vims are recent enough
	cnoreabbrev <expr> h HelpAbbrev('h')
	cnoreabbrev <expr> help HelpAbbrev('help')
endif
