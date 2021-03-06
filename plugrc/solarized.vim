"

" default is 16; upstream wants us to change the terminal pallette... um, no.
"
let g:solarized_termcolors=256

" todo: while these are set on, and that is also the default, do not see any
" bold or italic displayed (in particular, want italic comments, but none seen)
"
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1

" this has also 'high' and 'low' solarized author says unwise
" todo: make this available with keypress
"
"let g:solarized_contrast="normal"

" this is for some whitespace and :set list type stuff, has high and low
let g:solarized_visibility="normal"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" todo: probably this is already tracked in solarized itself, but their
" ':ToggleBG' autoload is broken and no time at the moment, so hacking this
" (hence use of '__' prefixes for my own namespace)
"

if !exists("g:__solarized_contrast")
	let g:__solarized_contrasts = ['low', 'normal', 'high']
	let g:__solarized_contrast = index(g:__solarized_contrasts, 'normal')
endif

if !exists("g:__solarized_background")
	let g:__solarized_backgrounds = ['dark', 'light']
	let g:__solarized_background = index(g:__solarized_backgrounds, 'dark')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" TODO
"
" The 'background' setting is some kind of magic string that can only be
" either "light" or "dark", but despite this, we cannot ":set invbackground"
" or ":set background!".  This makes it NOT one of the documented types
" available for the ":set" command (which are 'toggle', 'number', 'string').
" This is strange and undocumented, but lots of existing viml is out there
" which has hardcoded values for this, so it needs to be left alone.
"
" We probably should add something like a "dark" or "light" toggle so we can do
" eg "set dark!" and this will toggle between light and dark.  Otherwise, it
" makes people have to write wrappers with hardcoded magic values in order to
" toggle between these two values.  If it has exactly two values that are
" opposite each other, this seems to be logically a toggle, so why implement
" this as a string? Unless there is some expectation of having more future
" values for "background" this does not make much sense.
"
" Furthermore, changing it supposedly reloads the colorscheme according to the
" help, but this does not seem to work properly unless doing so is followed by a
" ":colorscheme" command.
"
function! Solarized_cycle_contrast()
	let g:__solarized_contrast = (g:__solarized_contrast + 1) % len(g:__solarized_contrasts)
	let g:solarized_contrast = get(g:__solarized_contrasts, g:__solarized_contrast)
	let &background = get(g:__solarized_backgrounds, g:__solarized_background)
	" todo: this should work
	"colorscheme g:colors_name
	colorscheme solarized
endfunc

function! Solarized_cycle_background()
	let g:__solarized_background = (g:__solarized_background + 1) % len(g:__solarized_backgrounds)
	let g:solarized_background = get(g:__solarized_backgrounds, g:__solarized_background)
	let &background = get(g:__solarized_backgrounds, g:__solarized_background)
	" todo: this should work
	"colorscheme g:colors_name
	colorscheme solarized
endfunc

" todo: same exact routine s/background/contrast/
"
"function! Solarized_cycle_background()
"	let l:current = g:__solarized_background
"	let l:possible = len(g:__solarized_backgrounds)
"	let l:current = (l:current + 1) % l:possible
"	let g:__solarized_background = l:current
"	let g:solarized_background = get(g:__solarized_backgrounds, l:current)
"	let &background = get(g:__solarized_backgrounds, l:current)
"	colorscheme solarized
"endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: the background isn't a solarized-specific thing
"
nmap <leader>sc         :call Solarized_cycle_contrast()<return>
nmap <leader>sb         :call Solarized_cycle_background()<return>
