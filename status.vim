"
" vim statusline
"
" TODO: implement parallel function in vim9 and test for capability
" using this (8.2.2529+) idiom:
"
"   if !has('vim9script')
"       "legacy script implementation
"       finish
"   endif
"   vim9script
"   " vim9script implementation
"
" but then we have to maintain two parallel versions.  also vim8 and vim9 do
" not share comment character (?), so not sure how the files can coexist?
" for now we just write a vim8-only
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" subtract from StatusLinePrefix ctermfg values to get StatusLinePrefixNC.  by
" using 12 it looks unformly darker, this is two rows on the 16-231 6-value
" rows list output by show-all-256-colors.py
"
let s:nc_hi_offset = 12

" see dist ftplugin/qf.vim, otherwise our status is not used for quickfix
let g:qf_disable_statusline = 1

" highlight group prefix (group=StatusLinePrefixSuffix), ctermfg=
let s:hipairs =	[
	\ [ 'filename',   226 ],
	\ [ 'bracket',    114 ],
	\ [ 'modified',   213 ],
	\ [ 'flags',       35 ],
	\ [ 'filetype',    75 ],
	\ [ 'paste',      214 ],
	\ [ 'charcode',    44 ],
	\ [ 'offset',      38 ],
	\ [ 'letter',     142 ],
	\ [ 'coord',      116 ],
	\ [ 'percent',    112 ],
	\ [ 'bufnum',      82 ],
	\ [ 'comma',       71 ],
\ ]
let s:hikeys = []
for pair in s:hipairs | call add(s:hikeys, pair[0]) | endfor

" highlight group name suffix, cterm=<str>, ctermbg=<1-255>
"  [0] -> current window [1] -> not current window
"
let s:attrpairs = [
	\ [ '', 'italic', 17 ],
	\ [ 'NC', 'NONE', 17 ],
\ ]

" 0 -> current window, 1 -> not current window, 2 -> not fullstatus.
" at each index is a dict indexed by the lowercase hi base string.  value is
" the corresponding highlight escape string "%#groupname#".  for index 2, all
" values are empty strings: we emit no highlights, relying only on StatusLine
" and StatusLineNC
"
let s:hlstrs = []

call add(s:hlstrs, {}) " 0
call add(s:hlstrs, {}) " 1
call add(s:hlstrs, {}) " 2

for hipair in s:hipairs
	let s:hi = hipair[0]
	let s:fg = hipair[1]
	let s:loop = 0
	for attrpair in s:attrpairs " hlstrs[0], hlstrs[1]
		let s:suffix = attrpair[0]
		let s:cterm = attrpair[1]
		let s:bg = attrpair[2]
		let s:hiname = 'StatusLine' . toupper(s:hi[0]) . s:hi[1:] . s:suffix
		execute ':hi ' .
		\ s:hiname
		\ ' cterm=' . s:cterm .
		\ ' ctermfg=' . (s:loop ? (s:fg - s:nc_hi_offset) : s:fg) .
		\ ' ctermbg=' . s:bg .
		\''
		let s:hlstrs[s:loop][s:hi] =
		\ 'let l:hi_' . s:hi . ' = ' . '"%#' . s:hiname . '#"'
		let s:loop += 1
	endfor
	let s:hlstrs[2][s:hi] = 'let l:hi_' . s:hi . ' = ""'
endfor

function StatusLine()

	let l:status = ""

	if has('patch-8.1.1372')
		let l:bufn = winbufnr(g:statusline_winid)
		let l:bufinfo = getbufinfo(l:bufn)[0]
		let l:our_win_current = (g:statusline_winid == win_getid())
		let l:fullstatus = v:true
	else
		let l:fullstatus = (has('patch-7.4.1154') ? v:false : 0)
	endif

	" /etc/passwd [-] [RO]
	" <filename> <bracket> <modified> <bracket> <bracket> <flags> <bracket>
	"
	" [passwd] b2 *?
	" <bracket> <filetype> <bracket> <letter> <bufnum> <paste>
	"
	" %=
	"
	" 120 0x78, 6 0x6,
	" <charcode> <comma> <offset> <comma>
	"
	" L1/45 C6 Top
	" <letter> <coord> <letter> <coord> <percent>

	" the hlstrs[] were already made for us at load time, indexed by
	" whether we are current (0), non-current (1), or no-highlight (2).
	" then we define a variable l:hi_<group> with the result that we can
	" expand inline later.  this saves a bit by using precomputed strings,
	" but we still have to concatenate them all, at least this saves
	" multiple exec calls
	"
	let l:execstr = ""
	let l:statindex = l:fullstatus ? (l:our_win_current ? 0 : 1) : 2
	for key in s:hikeys | let l:execstr .= s:hlstrs[l:statindex][key] . '| '
	endfor | exec l:execstr

	" we use a lot of brackets
	let l:lbracket = l:hi_bracket . '['
	let l:rbracket = l:hi_bracket . ']'

	" path to the file currently being edited
	let l:status .= l:hi_filename
	let l:status .= '%-5.50f'

	" buffer is modified
	if l:fullstatus
		let l:status .=
		\ l:lbracket .
		\ l:hi_modified .
		\ (l:bufinfo.changed ? "+" : "-") .
		\ l:rbracket .
		\''
	else
		let l:status .= '%m'
	endif

	" buffer is readonly
	if l:fullstatus
		if getbufvar(l:bufn, "&readonly")
			let l:status .=
			\ l:lbracket .
			\ l:hi_flags .
			\'RO' .
			\ l:rbracket .
			\''
		endif
	else
		let l:status .= '%r'
	endif

	" preview window is active
	if l:fullstatus
		if getbufvar(l:bufn, '&previewwindow')
			let l:status .=
			\ l:lbracket .
			\'Preview' .
			\ l:rbracket .
			\''
		endif
	else
		let l:status .= '%w'
	endif

	" quickfix window is active
	" todo: can distinguish location and quickfix with
	"  getwininfo() -> ['loclist'] == 1, ['quickfix'] == 1
	"
	if l:fullstatus
		if getbufvar(l:bufn, '&buftype') == 'quickfix'
			let l:title = (
				\ exists('w:quickfix_title')
				\ && strlen(w:quickfix_title)
			\ )
			let l:qfstr = l:title ? w:quickfix_title : 'Fix'
			let l:status .=
			\ l:lbracket .
			\ l:hi_filetype .
			\ l:qfstr .
			\ l:rbracket .
			\''
		endif
	else
		let l:status .= '%q'
	endif

	" ftdetected syntax type if known
	if l:fullstatus
		let l:ft = getbufvar(l:bufn, '&filetype')
		if strlen(l:ft) != 0
			let l:status .=
			\ l:lbracket .
			\ l:hi_filetype .
			\ l:ft .
			\ l:rbracket .
			\''
		endif
	else
		let l:status .= '%y'
	endif

	" buffer number represented by this window
	let l:status .= l:hi_letter .  ' b' .  l:hi_bufnum .  '%n'

	" paste mode is active
	if l:fullstatus
		let l:status .= " "
		if getbufvar(l:bufn, &paste) && l:our_win_current
			let l:status .= l:hi_paste . "*"
		endif
	else
		let l:status .= '%{&paste ? " *" : ""}'
	endif

	" relative to this mark, text justification is ipsilateral
	let l:status .= "%="

	" decimal and hex code for character under cursor
	let l:status .= l:hi_charcode . " %b 0x%B" .  l:hi_comma .  ","

	" byte offset into file
	let l:status .= l:hi_offset . " %o 0x%O" .  l:hi_comma . ","

	" line offset into file / total
	let l:status .= l:hi_letter . " L" . l:hi_coord . "%l/%L"

	" column offset
	let l:status .= l:hi_letter . " C" . l:hi_coord . "%c%V"

	" hundredths into file
	let l:status .= l:hi_percent . " %P"

	"
	return l:status
endfunc

set statusline=%!StatusLine()
