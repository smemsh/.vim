" this file is a total hack and should be redesigned

" - $_bufenter will be defined if we are leaving the buffer
if _bufenter
	" maybe do this later when there is an official one...
	"	source		$VIM/syntax/info.vim

	function Git()
		let c = getline(".")[col(".") - 1]
		if c != "*"
			echo "cursor must be on a tag asterisk"
		else
			normal l
			let c = getline(line("."))[col(".") - 1]
			if c == "N"
				normal w
			else
				normal l
			endif

			normal mz

			normal f:l
			let c = getline(".")[col(".") - 1]
			if c != ":"
				normal wvt.
			else
				normal `zvt:
			endif

			normal	"zyF*
			
			execute "tag" @z
		endif

	endfunction

	command		Getit	call Git()
	nmap		<C-]>	:Getit<CR>

else "leaving
	delcommand	Getit
	delfunction	Git
	nunmap		<C-]>
endif
