colorscheme sourcerer

set tabstop=4 " tabstop can be 2, 3, or 4 in FORTRAN
set colorcolumn=80 " fortran only goes up to 80 chars per line

" suitable for free source fortran (instead of fixed)
let fortran_free_source=1

" tabs are generally not allowed in fortran but this
" will allow them to be used
let fortran_have_tabs=1 

" makes the syntax highlighting more precise at the cost of speed
let fortran_more_precise=1

let fortran_do_enddo=1
