"
" uses current window for help buffer, replacing the active buffer, rather than
" making a new window, as vim normally does.
"

" snarfed from https://stackoverflow.com/a/68448306/5616796
"
" issues:
" - does not handle windows < 80 cols
" - only one help window can be used at a time
"
command! -bar -nargs=? -complete=help Help call s:Help(<q-args>)
function! s:Help(subject) abort

	" remember the state of the windows
	let l:window_id = win_getid()
	let l:window_width = winwidth(0)
	let l:num_windows = winnr('$')

	" open the help window
	execute 'help ' .. a:subject

	" close the original window if a new help window was opened, and
	" if it should have opened immediately above the original window
	if l:num_windows < winnr('$') &&
	\ (l:num_windows == 1 || l:window_width >= 80)
		call win_execute(l:window_id, 'close')
	endif

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

finish

""" EOF """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
