"
" scott@smemsh.net
" https://github.com/smemsh/.vim/
" https://spdx.org/licenses/GPL-2.0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" buffer selection
"
nmap <c-j>              <c-w>j
nmap <c-k>              <c-w>k
nmap <c-y>              <c-w>p
nmap <c-n>              :bn<return>
nmap <c-p>              :bp<return>
nnoremap <leader>.      :b#<return>
nmap <leader><space>    :wincmd w<return>

" to tabs (T), to spaces (t)
"
nmap <leader>t          :set expandtab<return> :retab!<return>
nmap <leader>T          :set noexpandtab<return> :retab!<return>

" temporal undo
"
nmap -                  g-
nmap +                  g+
nmap =                  g+

" resets
"
nmap <leader>5          :set tw=55<return>
nmap <leader>6          :set tw=64<return>
nmap <leader>7          :set tw=72<return>
nmap <leader>0          :set tw=0<return>
nmap <leader>2          :set ts=2 sw=2<return>
nmap <leader>4          :set ts=4 sw=4<return>
nmap <leader>8          :set ts=8 sw=8<return>
nmap <leader>c          :set noai nosi nocin tw=0
                        \ fo-=a fo-=t
                        \ indentexpr=
                        \<return>

" change fold levels
"
nmap <leader><leader>f  :set foldlevel+=1<return>
nmap         <leader>f  :set foldlevel-=1<return>

" auto-format +/-
"
nmap <leader><leader>a  :set fo+=a fo+=t<return>
nmap         <leader>a  :set fo-=a fo-=t<return>
nmap         <leader>N  :set fo+=n<return>
nmap         <leader>n  :set fo-=n<return>

" various toggles
"
nmap         #          :set number!<return>
nmap         <leader>e  :set expandtab!<return>
nmap         <leader>p  :set paste!<return>
nmap         <leader>w  :set wrap!<return>
nmap         <leader>L  :set list!<return>
nmap         <leader>h  :set hlsearch!<return>
nmap         <leader>R  :set wrap nolist showbreak=
                        \ breakindent linebreak<return>
nmap <leader><leader>R  :set nowrap list showbreak="> "
                        \ nobreakindent nolinebreak<return>

" for outlines and similar
"
nmap <leader>o          :set tabstop=4 shiftwidth=4 indentexpr=
                        \ noexpandtab<return>

" for line-paragraphs: open fixed 80col win, wrap at word breaks
"
nmap <leader>v          :set formatoptions-=a textwidth=0 nolist
                        \ wrap linebreak showbreak= <return>
                        \:match WarningMsg ''<return>
                        \:vspl /dev/null<return>
                        \:wincmd x<return>
                        \:set winwidth=80<return>
                        \:set winfixwidth<return>

" useful for editing text/plain format=flowed (cf mutt):
"
nmap <leader>W          :set formatoptions-=w<return>
nmap <leader><leader>W  :set formatoptions+=w<return>

" quickfix prev-next maps to a led vi left-right, one row down
"
nmap <leader>m          :cp<return>
nmap <leader>/          :cn<return>

" temporary solution to having nonfunctioning F-keys
"
noremap <f1>            <c-^>
noremap <c-^>           <f1>

" screen redraw
"
nmap <leader><leader>l  :redraw!<return>
nmap <c-l>              :redraw!<return>

" refresh the currently loaded colorscheme from its source file
" (as declared by the standard g:colors_name)
"
function! Reload_colorscheme()
	execute ":colorscheme " . g:colors_name
endfunction
nmap <leader>C <esc>:call Reload_colorscheme()<return>

" type while inserting, inputs the date, and then continues
" appending in insert mode after going to the end of the new
" date
"
function! Read_shell_date()
	let nowdate = system("date +$HISTTIMEFORMAT")
	call setreg('a', nowdate, 'b14')
	normal "ap
endfunction
map! <leader><leader>d <esc>:call Read_shell_date()<return>Ea<space>

"""

" diff this buffer against the pristine version and use
" split screen to show differences, of course will look
" better on larger screen
"
if ! exists(":DiffOrig")
command DiffOrig
	\ vert new              |
	\ set bt=nofile         |
	\ r #                   |
	\ 0d_                   |
	\ diffthis              |
	\ wincmd p              |
	\ diffthis
nmap <leader>d :DiffOrig<return>
endif

" toggle whitespace mattering whilst diffing
if ! exists(":DiffWhiteToggle")
command DiffWhiteToggle
	\ if &diffopt =~ 'iwhite'       |
	\ set diffopt-=iwhite           |
	\ else                          |
	\ set diffopt+=iwhite           |
	\ endif
nmap <leader>dw :DiffWhiteToggle<return>
endif

" diff from local version
nnoremap < :diffget LOCAL<return>:diffupdate<return>

" diff from remote version
nnoremap > :diffget REMOTE<return>:diffupdate<return>

" resync diff highlighting
nnoremap <leader>$ :diffupdate<return>

" write this buffer and quit others (they should have no changes)
nnoremap <leader>x :w<return>:qa<return>

""" APPS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TODO app-specific should probably go into syntax and ftplugin files
"

" Trac wiki RST
"
map <leader><leader>r   :set fo-=a<return>
                        \a{{{<return>#!rst<return><return><return><return>}}}
                        \<esc>kka<esc>
                        \:set ft=rst nospell tw=72 fo-=a<return>
                        \i

map <leader>r           \:set nospell ft=rst<return>

map <leader>q           m`WBi``<esc>Ea``<esc>`` | " quote
nmap <leader><leader>9  a`#99999`:trac:<esc>

" mutt signatures with and without the horiz underline
" TODO remove personalizations into separate file and git-crypt it,
"      these are safe for the time being
"
nmap <leader><leader>s  ,c0o--<space><return>
                        \Scott<esc>
nmap <leader><leader>S  ,,sa<return><return><esc>
                        \78i_<esc>
                        \A<return><esc>
nmap <leader><leader>o  ,c0o--<space><esc>
                        \:read<space>~/.mutt/crypt/signature.smemsh<return>
                        \<esc>
nmap <leader><leader>O  ,c0,,o}A<return><esc>
                        \78i_<esc>
                        \A<return><esc>
