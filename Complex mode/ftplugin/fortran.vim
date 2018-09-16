colorscheme onedark
set colorcolumn=80 " fortran only goes up to 80 chars per line

" Spatial formatting
filetype plugin indent off
set tabstop=3 " tabstop can be 2, 3, or 4 in FORTRAN
set softtabstop=3
set shiftwidth=3
" set noautoindent
" set nosmartindent
" set nosmarttab

" Whitespace handling
set expandtab
retab

" suitable for free source fortran (instead of fixed)
let fortran_free_source=1

" tabs are generally not allowed in fortran but this
" will allow them to be used
let fortran_have_tabs=1 

" makes the syntax highlighting more precise at the cost of speed
let fortran_more_precise=1

let fortran_do_enddo=1


" --------------------------------------------
"  Plugin: indentLine
"  https://github.com/Yggdroot/indentLine
let g:indentLine_enabled = 0
" --------------------------------------------

" --------------------------------------------
"  FORTRAN 77
"
"  Columns 1 to 5    -   Statement Label
"  Column 6          -   Continuation Indicator
"  Columns 7 on      -   Statement
"  Column 73 on      -   Comments (optional)
" --------------------------------------------
