"
" this changes jinja2 comment to need a space after it, otherwise
" some bash idioms cause it to act like a comment (such as array
" length), when embedded in yaml scalar block changes from '{#'
" to '{# ' (maybe others would not use a space, but this author
" always would with this type of comment)
"
syn clear jinjaComment
syn region jinjaComment matchgroup=jinjaCommentDelim
	\ start="{#\s" end="\s#}"
	\ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaString

"syn region yamlComment display oneline
"	\ start='\%\(^\|\s\)#\s'
"	\ end='$'
"	\ contains=yamlTodo
