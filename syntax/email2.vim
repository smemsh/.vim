"Rule for [A-Za-z][-A-Za-z0-9_]*
syn match Type "\v((\:)(\s*\n\s*|\s*))@<=([A-Za-z][-A-Za-z0-9_]*)\ze(\s*\n\s*|\s*)(\;)" 
"Rule for [A-Za-z][-A-Za-z0-9_]*
syn match String "\v((var)(\s*\n\s*|\s*))@<=([A-Za-z][-A-Za-z0-9_]*)\ze(\s*\n\s*|\s*)(\:)" 
"Rule for [A-Za-z][-A-Za-z0-9_]*
syn match Identifier "\v((%^|\;)(\s*\n\s*|\s*))@<=([A-Za-z][-A-Za-z0-9_]*)\ze(\s*\n\s*|\s*)(\=)" 
"Rule for [A-Za-z][-A-Za-z0-9_]*
syn match Identifier "\v((\=)(\s*\n\s*|\s*))@<=([A-Za-z][-A-Za-z0-9_]*)\ze(\s*\n\s*|\s*)(\;)" 
"Rule for [A-Za-z][-A-Za-z0-9_]*
syn match Identifier "\v((Print)(\s*\n\s*|\s*))@<=([A-Za-z][-A-Za-z0-9_]*)\ze(\s*\n\s*|\s*)(\;)" 
"Rule for var
syn match Statement "\v((%^|\;)(\s*\n\s*|\s*))@<=(var)\ze(\s*\n\s*|\s*)([A-Za-z][-A-Za-z0-9_]*)" 
"Rule for Print
syn match Statement "\v((%^|\;)(\s*\n\s*|\s*))@<=(Print)\ze(\s*\n\s*|\s*)([0-9]+|[A-Za-z][-A-Za-z0-9_]*)" 
"Rule for [0-9]+
syn match Constant "\v((\=)(\s*\n\s*|\s*))@<=([0-9]+)\ze(\s*\n\s*|\s*)(\;)" 
"Rule for [0-9]+
syn match Constant "\v((Print)(\s*\n\s*|\s*))@<=([0-9]+)\ze(\s*\n\s*|\s*)(\;)" 
