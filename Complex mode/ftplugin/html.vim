" html file settings
" EmmetInstall
set lines=50 columns=92
set tabstop=2
set shiftwidth=2
bufdo colorscheme Tomorrow-Night-Eighties
setlocal foldmethod=syntax
bufdo syntax spell toplevel
bufdo syn case ignore
bufdo syn match htmlError "[<>&]"
set colorcolumn=
set expandtab
retab
