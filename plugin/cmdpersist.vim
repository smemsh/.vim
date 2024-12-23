"
" attempt to sync cmd window hist with the actual viminfo file, and the
" current session, so edits (especially deletions) are persistent
"
" snarfed from https://stackoverflow.com/questions/45365388
"
" todo:
"   - untested, but looks ok!
"   - hardcodes .viminfo filename, consult 'viminfo:n' and/or 'viminfofile'

augroup CmdlineSync
	au!
	au CmdWinEnter * let s:old_cmdline_hist = getline(1, line('$')-1)
	au CmdWinLeave * call s:update_history()
augroup END

function! s:update_history() abort
	let hist = filter(getline(1, '$'), 'v:val !~# "^\\s*$"')

	call histdel(':')
	for i in hist | call histadd(':', i) | endfor

	let viminfo = expand('~/.viminfo')
	if !filereadable(viminfo) | return | endif

	let info = readfile(viminfo)
	let deleted_entries = filter(copy(s:old_cmdline_hist),
	                      \      'index(hist, v:val) == -1')

	call map(deleted_entries, 'index(info, ":".v:val)')
	call sort(filter(deleted_entries, 'v:val >= 0'))
	if empty(deleted_entries) | return | endif

	for entry in reverse(deleted_entries)
		call remove(info, entry, entry + 1) | endfor

	call writefile(info, viminfo, 'b')
endfunction
