"
" cvimrc
"   gpg-based, safe encrypted edits with vim (uses aes256+pass)
"
" usage:
"   vim -S thisfile encrypted_file
"
" desc:
"   puts vim in a special mode for editing encrypted data
"   files with the support of an external encryption filter,
"   trying to make sure no data ever hits the disk in its
"   unencrypted state, including temporary files created by
"   vim to pass data to an external program
"
" todo:
"   we may need to use autocommands to make sure these are set
"   for all buffers we enter; however, our usual pattern is to
"   just cvim one file
"
" scott@smemsh.net
" http://smemsh.net/src/vim/
" http://spdx.org/licenses/GPL-2.0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" global
"
set secure
set nobackup
set nowritebackup
set noshelltemp
set viminfo=
set history=0

" local
"
set noswapfile
set noundofile

"""

function! BackupBeforeEncrypt()
	let l:origpath = expand('%:p')
	let l:nowdate = system('date +%Y%m%d%H%M%S')
	let l:bakpath = l:origpath . '.' . l:nowdate
	call system("cp -ia " . l:origpath . " " . l:bakpath)
endfunction

function! Encrypt()
	call BackupBeforeEncrypt()
	%!gpg -q --cipher-algo aes256 --symmetric --armor 2>/dev/null
endfunction

function! Unencrypt()
	%!gpg -q --cipher-algo aes256 --decrypt --armor 2>/dev/null
endfunction

"""

nmap <silent> ZX :call Encrypt()<return>
nmap <silent> Zx :call Unencrypt()<return>
