"
" vim runcom
" scott@smemsh.net
" https://github.com/smemsh/.vim/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set hlsearch
set hidden
set incsearch
set ignorecase
set lazyredraw
set list
set ruler
set showcmd
set showfulltag
set showmatch
set smartcase
set smartindent
set splitbelow
set ttyfast
set visualbell
set wildmenu

"""

set nocompatible
set nocursorcolumn
set nocursorline
set nocindent
set noesckeys
set nofoldenable
set norestorescreen
set nostartofline

" irritating menace
set nodigraph

" possibly dangerous
set nomodeline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace           =2
set complete            =t,.,i,w,b,k
set cpoptions           -=ae
set cpoptions           +=Er$
set cpoptions           +=d " tags file relative to cwd, not the file we edit
set diffopt             =filler,vertical,foldcolumn:0
set fileformats         =unix,dos,mac
set history             =1000
set laststatus          =2
set matchtime           =15
set report              =1
set scrolloff           =999
set selection           =old
set shortmess           +=aI
set showbreak           =<
set sidescroll          =1
set textwidth           =78
set ttyscroll           =999
set viminfo             =%,'999,f1
set whichwrap           =b,s,h,l,<,>,[,]
set wildmode            =list,full

"""

let &listchars =
	\"tab:\u00b7\x20," .
	\"trail:$," .
	\"extends:\u21e8," .
	\"precedes:\u21e6," .
	\"nbsp:\u2581," .
	\""

let &fillchars =
	\"vert:\u250a," .
	\"fold:\u22ef," .
	\"diff:\u2591," .
	\""
"	\"vert:\u2502," .

set statusline =
	\%-5.50f
	\%m
	\%r
	\%w
	\%y
	\\ b%n%=%b
	\\ 0x%B,
	\\ %o
	\\ 0x%O,
	\\ L%l/%L
	\\ C%c%V
	\\ %P

"""

if ! &compatible
	set dictionary =
	\/usr/share/dict/words,
	\$HOME/.ispell_english,
	\$HOME/.aspell.en.pws
endif

if ! &compatible
"	nnoremap q: :
"	nnoremap : q:
	autocmd CmdwinEnter [:/?] startinsert
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"	vimvar          subdir      append              setflag
let datadirs =[
	\['backupdir',  'backups',  '',                 ''          ],
	\['directory',  'swaps',    '//,.',             ''          ],
	\['undodir',    'undo',     '',                 'undofile'  ],
	\['spellfile',  'spell',    '/en.latin1.add',   ''          ],
\]

for dir in datadirs
	let vimvar = dir[0]
	let subdir = dir[1]
	let append = dir[2]
	let setflag = dir[3]
	let path = $HOME . "/var/vim/" . subdir

	" exists(&var) generalizes has("feature") without needing
	" feature name; only make the path if dne, set the variable
	" thereto, and set any supplied auxiliary boolean
	"
	if (exists('&' . vimvar) && exists("*mkdir"))
		if ! isdirectory(path)
			call mkdir(path, "p")
		endif
		execute "set " . vimvar . '=' . path . append
		if ! empty(setflag)
			if (exists('&' . setflag))
				execute "set " . setflag
			endif
		endif
	endif
endfor

" write swapfile asynchronously but more frequently
"
if exists('&fsync')
set nofsync
set swapsync =
set updatetime =1000 " msecs idle before swapfile writes
set updatecount =20 " chars between swapfile writes
endif

" lost edits too many times...
"
set writebackup
set backup
set backupskip =
set patchmode = " prefer backupdir/backupext
autocmd BufWritePre * let &backupext = '-' . strftime("%Y%m%d%H%M%S")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader> is expanded in keymaps at define-time, and could be
" used anywhere; set early before any sourcings are done
"
let mapleader = ","

" bundle-specific variables initialized in their own files
runtime! packrc/**/*.vim

"
filetype plugin indent on
syntax enable

" always sync whole file, defined last to override earlier syntax autocmds
autocmd Syntax * syntax sync fromstart

"
colorscheme smemsh256

"
source ~/.vim/maps.vim
