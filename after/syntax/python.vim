"
" http://docs.python.org/release/2.6.6/reference/
"
"     2.5. Operators
"
"      +       -       *       **      /       //      %
"      <<      >>      &       |       ^       ~
"      <       >       <=      >=      ==      !=      <>
"
"     2.6. Delimiters
"
"      (       )       [       ]       {       }      @
"      ,       :       .       `       =       ;
"      +=      -=      *=      /=      //=     %=
"      &=      |=      ^=      >>=     <<=     **=

"syn match pythonOperator /(/
"syn match pythonOperator /)/

"
"syn region Function
" 	\ matchgroup=pythonOperator
"	\ contains=ALL
"	\ oneline
" 	\ keepend
" 	\ start=/\[/ end=/\]/
" 
" syn region Function
" 	\ matchgroup=pythonOperator
" 	\ keepend
" 	\ start=/(/ end=/)/
" 
" syn region Function
" 	\ matchgroup=pythonOperator
" 	\ keepend
" 	\ start=/{/ end=/}/
