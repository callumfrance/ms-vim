" css file options
let g:user_emmet_install_global = 0
EmmetInstall
setlocal tabstop=2
setlocal foldmethod=manual
colorscheme Revolution

" CSS Omnicomplete

filetype plugin on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" remap
inoremap <tab> <C-X><C-O>
