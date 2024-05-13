"
" uses current window for help buffer, replacing the active buffer, rather than
" making a new window, as vim normally does.  probably broken with tabs in use.
"

if !has('patch-7.4.2204') | finish | endif " getwininfo()
command -nargs=? -complete=help Help call s:Help(<q-args>)
command -nargs=? Helpgrep call s:Help(<q-args>, v:true)
function s:Helpgrep(arg) abort
	call s:Help(a:arg, v:true)
endfunction
function s:Help(subject, grep = v:false) abort

	let l:helpbufs = []

	" before opening new help window, temporarily change buftype for all
	" extant 'help' buffers, or vim will re-use that window for new help
	"
	for w in getwininfo()
		if getbufvar(w.bufnr, '&buftype') == 'help'
			call setbufvar(w.bufnr, '&buftype', 'nowrite')
			call add(l:helpbufs, w.bufnr)
		endif
	endfor

	" open new help, close, becomes unlisted, change original to that buf
	execute 'help' . (a:grep ? 'grep' : '') . ' ' . a:subject
	let l:helpbufnum = bufnr()
	execute 'helpclose'
	execute 'buffer ' . l:helpbufnum

	" restore original 'help' buftype on all we temporarily made 'nowrite'
	for n in l:helpbufs
		call setbufvar(n, '&buftype', 'help')
	endfor

endfunction

" make :help and :h commands run our :Help rather than builtin
" (really it just replaces the command in realtime whilst typing)
"
" getcmdtype() = 7.0149
" getcmdline() = 7.0001
"
function s:HelpAbbrev(arg) abort
	let l:helpfunc = (a:arg == 'helpgrep' ? 'Helpgrep' : 'Help')
	if (getcmdtype() == ":") && (getcmdline() =~ ('^' . a:arg))
		return l:helpfunc
	else
		return a:arg
	endif
endfunction

if has('patch-8.2.4883') " string interpolation
	for a in ['help', 'h', 'helpgrep']
	execute $"cnoreabbrev <expr> {a} <SID>HelpAbbrev('{a}')" | endfor
else
	" todo: remove this case once all deployed vims are recent enough
	cnoreabbrev <expr> h <SID>HelpAbbrev('h')
	cnoreabbrev <expr> help <SID>HelpAbbrev('help')
	cnoreabbrev <expr> helpgrep <SID>HelpAbbrev('helpgrep')
endif

finish

""" EOF """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""

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
