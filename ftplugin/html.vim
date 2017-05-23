" html file settings
EmmetInstall
set lines=50 columns=92
setlocal tabstop=2
bufdo colorscheme Tomorrow-Night-Eighties
setlocal foldmethod=syntax
bufdo syntax spell toplevel
bufdo syn case ignore
bufdo syn match htmlError "[<>&]"
