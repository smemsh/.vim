"
" adds '//' as a comment for single line, since it's run through cpp
" todo: this is just copied from the upstream xdefaults.vim, there must be a
" way to do this more efficiently because it is almost all just redeclaration
" of same thing in that file, only thing different from eg xdefaultsCommentH
" (and then name added as 'DoubleSlash' instead) is the syn match pattern, but
" do not know how/if/syntax to 'add' to an existing syn match (maybe use
" 'nextgroup' or 'ext' or 'cluster' or...?)
"
" update: it might be that "syn foo" just keeps chaining on more things that
" trigger "foo" interpretation, so it's safe to just ignore having to re-add
" everything, but have not tested
"
"

syn match xdefaultsCommentDoubleSlash "^\/\/.*$"
syn region xdefaultsDefine
	\ start="^\s*#\s*\(define\|undef\)\>"
	\ skip="\\$"
	\ end="$"
	\ contains=
		\ALLBUT,
		\@xdefaultsPreProcGroup,
		\xdefaultsCommentH,
		\xdefaultsErrorLine,
		\xdefaultsLabel,
		\xdefaultsValue,
		\xdefaultsCommentDoubleSlash

syn region xdefaultsPreProc
	\ start="^\s*#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)"
	\ skip="\\$"
	\ end="$"
	\ keepend
	\ contains=
		\ALLBUT,
		\@xdefaultsPreProcGroup,
		\xdefaultsCommentH,
		\xdefaultsErrorLine,
		\xdefaultsLabel,
		\xdefaultsValue,
		\xdefaultsCommentDoubleSlash

highlight link xdefaultsCommentDoubleSlash xdefaultsComment

syn sync fromstart
