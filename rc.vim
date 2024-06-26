"
" vim runcom
" scott@smemsh.net
" http://smemsh.net/src/.vim/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set smartindent
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
set splitbelow
set ttyfast
set visualbell
set wildmenu

"""

set nocompatible
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

set cpoptions           -=ae
set cpoptions           +=Er$
set cpoptions           +=d " tags file relative to cwd, not the file we edit
set diffopt             =filler,vertical,foldcolumn:0
set textwidth           =78
set backspace           =2
set complete            =t,.,i,w,b,k
set fileformats         =unix,dos,mac
set history             =10000
set laststatus          =2
set matchtime           =15
set report              =1
set scrolloff           =999
set selection           =old
set shortmess           +=aI
set showbreak           =<
set sidescroll          =1
set ttyscroll           =999
set viminfo             ='999,f1,%
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

"""

" history window, editable same as a buffer!
" sometimes messages do not show up; use q: in that case
"
if ! &compatible
	nnoremap q: :
	nnoremap : q:
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
set swapsync            =
set updatecount         =20     " chars between swapfile writes
set updatetime          =1000   " msecs idle before swapfile writes
endif

" lost edits too many times... this is before persistent undo
"
set writebackup
set backup
set backupskip          =
set patchmode           =       " patchmode always saves in pwd; if empty do not use
set backupext           =.bak   " would prefer empty but $patchmode cant be same

" we have to do this before the write because if it's just
" backupext, it has a permanent static value set at vim start
"
autocmd BufWritePre *   let &backupext = '-' . strftime("%Y%m%d%H%M%S")

" on start, restore last position in file; see :help last-position-jump
"
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader> is expanded in keymaps at define-time, and could be
" used anywhere; set early before any sourcings are done
"
let mapleader = ","

" plugin-specific variables initialized in their own files
"
runtime! plugrc/*.vim

" append bundles to runtime path
" (skips if submodules not initialized)
"   1. all ~/.vim/lib/* (for libraries, which need to load first),
"   2. then ~/.vim/bundle/* (for plugins, etc),
"   3. then ~/.vim/colors/*/ (only :colorscheme bundles)
"
filetype off

let s:pathogen = expand("~/.vim/bundle/vim-pathogen/autoload/pathogen.vim")
if filereadable(s:pathogen)
	execute "source " . s:pathogen
	execute pathogen#infect('lib/{}')
	execute pathogen#infect('bundle/{}')
	execute pathogen#infect('colors/{}')
else
	set runtimepath +=~/.vim/colors/vim-smemsh256
endif
filetype plugin indent on

" TODO: this shouldn't go here, but it's for vim's own rst.vim
let rst_use_emphasis_colors = 1

syntax enable

"
colorscheme smemsh256

"""

" TODO: use a globbing scheme and maybe rc.d/
"
source ~/.vim/functions.vim
source ~/.vim/maps.vim
source ~/.vim/cscope.vim
