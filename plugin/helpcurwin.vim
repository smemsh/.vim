"
" uses current window for help buffer, replacing the active buffer, rather than
" making a new window, as vim normally does.  probably broken with tabs in use.
"

if !has('patch-7.4.2204') | finish | endif " getwininfo()
"if !has('patch-7.4.1154') | finish | endif " v:true/v:false
"if !has('patch-8.1.1310') | finish | endif " default function args
command -nargs=? -complete=help Help call s:Help(<q-args>, 0)
command -nargs=? Helpgrep call s:Help(<q-args>, 1)
function s:Helpgrep(arg) abort
	call s:Help(a:arg, 1)
endfunction
function s:Help(subject, grep) abort

	" upstream patch 28f7e701b seems to cause a problem: if we start with
	" two vertical panes that are less than 80 columns and try to open
	" help in one of them, it results in horizontal windows if we have set
	" the 'splitbelow' option.  unsetting this option (or using windows
	" above 80 columns) makes it work correctly.  the proper solution is
	" probably to save and restore the layout, but let's see if it really
	" needs a deeper fix than this in practice.
	"
	let l:savedsb = &splitbelow
	set nosplitbelow

	" before opening new help window, temporarily change buftype for all
	" extant 'help' buffers, or vim will re-use that window for new help.
	" however, if the current buffer is already help, we will reuse it,
	" which is necessary to change cursor to new location if help target
	" is inside the same helpfile that's already open.  if we make a new
	" window, we have to recreate the tagstack, so we'll have to save it
	"
	if getbufvar("", '&buftype') != 'help'
		if has('patch-8.1.0519')
			let l:tagstack = gettagstack()
		endif
		let l:is_help = 0
		let l:helpbufs = []
		for w in getwininfo()
			if getbufvar(w.bufnr, '&buftype') == 'help'
				call setbufvar(w.bufnr, '&buftype', 'nowrite')
				call add(l:helpbufs, w.bufnr)
			endif
		endfor
	else
		let l:is_help = 1
	endif

	" run help, or case-insensitive helpgrep (depending on invocation)
	let l:subject = a:subject . (a:grep ? '\c' : '')
	execute 'help' . (a:grep ? 'grep' : '') . ' ' l:subject

	if l:is_help
		" re-use existing window, vim handles everything (no-op)
		execute
	else
		" new window was created:
		"
		" - save newly created tagstack (depth 1)
		" - note buffer number
		" - close window (becomes unlisted, back to orig win)
		" - switch to the now-unlisted buffer
		" - restore 'help' buftypes on those we saved earlier
		" - restore original tag stack
		" - append the depth 1 tagstack from tmp help window
		"
		if has('patch-8.1.0519')
			let l:newstack = gettagstack()
		endif
		let l:helpbufnum = bufnr()
		execute 'helpclose'
		execute 'buffer ' . l:helpbufnum
		for n in l:helpbufs
			call setbufvar(n, '&buftype', 'help')
		endfor
		if has('patch-8.1.0519')
			call settagstack(winnr(), l:tagstack, 'r')
			call settagstack(winnr(), l:newstack, 'a')
		endif
	endif

	let &splitbelow = l:savedsb

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
let s:did_open_help = 0
function s:Help(subject) abort
	let mods = 'silent noautocmd keepalt'
	if !s:did_open_help
		execute mods . ' help'
		execute mods . ' helpclose'
		let s:did_open_help = 1
	endif
	if !getcompletion(a:subject, 'help')->empty()
		execute mods . ' edit ' . &helpfile
		set buftype=help
	endif
	return 'help ' . a:subject
endfunction
