set nocompatible
" File ~\vimfiles\_vimrc
" ($HOME\_vimrc on Windows)
source $VIMRUNTIME/defaults.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set encoding=utf-8
set splitright
cabbrev help vert help

" use `zo` to open folds and `zc` to close them
" use `zO` and `zC` to do the same but for all heirarchies

" pathogen {
execute pathogen#infect()
syntax on
filetype plugin indent on
" }

filetype plugin on
winpos -5 2

" useful tips {
" `:SCROLL`	followed by UP/DOWN arrow keys will scroll through colour schemes
" }

" default styling layout {
set guifont=Source_Code_Pro_SemiBold:h10:cANSI:qDRAFT "font

colorscheme solarized

set antialias										"smooths fonts
set tw=0											" textwidth doesnt wrap
set number											" page numbering
set relativenumber
set nowrap
set tabstop=4
set smarttab
set autoindent
set shiftwidth=4
set shiftround										"indents rounded to a multiple
set noexpandtab
set ignorecase		" searching
set showmatch
set hlsearch
set smartcase
set history=100		" history
set undolevels=100
set noerrorbells	" error noise
set title
" set lines=43 columns=80	" from macbook
set lines=50 columns=70	"might also work

" }

" word processor file types {
augroup word_processors
	autocmd!
	autocmd BufNewFile,BufRead *.md,*.markdown call WP()
	autocmd BufNewFile,BufRead *.txt call WP()
	autocmd BufNewFile,BufRead *.textile call WP()
	autocmd BufNewFile,BufRead *.rst call WP()

	autocmd BufNewFile,BufRead *.md,*.markdown call HideUglies(1)
	autocmd BufNewFile,BufRead *.txt call HideUglies(1)
	autocmd BufNewFile,BufRead *.textile call HideUglies(1)
	autocmd BufNewFile,BufRead *.rst call HideUglies(1)
augroup END
" }

" html settings {
let g:user_emmet_install_global = 0

augroup filetype_html
	autocmd!
	autocmd BufNewFile,BufRead *.html EmmetInstall
	autocmd BufNewFile,BufRead *.html colorscheme Tomorrow-Night-Eighties
	autocmd BufNewFile,BufRead *.html set tabstop=2
	autocmd BufNewFile,BufRead *.html set foldmethod=syntax
	autocmd BufNewFile,BufRead *.html syntax spell toplevel
	autocmd BufNewFile,BufRead *.html syn case ignore
	autocmd BufNewFile,BufRead *.html syn match htmlError "[<>&]"	"marks illegal character
augroup END
" }

" MyDiff function {
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
" }

" vimrc folds organisation {
set foldmethod=marker
set foldmarker={,}
set foldlevel=0
" }

" Word proessor mode {
" this has been moved to ~\vimfiles\ftplugins

" `:call WP()`		opens the word processor mode
" `z=`				displays corrections
" `zg`				adds words to dictionary
function WP()
	colorscheme pencil
	setlocal lines=65 columns=90
	setlocal formatoptions=1
	setlocal noexpandtab				" lots of spaces together will remain spaces
	map j gj
	map k gk
	setlocal spell spelllang=en_au		" http://vimdoc.sourceforge.net/htmldoc/spell.html
	setlocal complete+=s
	setlocal formatprg=par
	setlocal wrap
	setlocal linebreak
	setlocal spellfile=~\vimfiles\spell\en.utf-8.add

	Goyo 85%x85%-2%						" margins
	Limelight							" greys out unfocused paragraphs
endfunction
" }

" hide gvim ugly UI mode {
let g:hide_uglies = 0
function! HideUglies(hide_uglies)
	if a:hide_uglies != 0
		setlocal guioptions-=m				"removes gvim menubar
		setlocal guioptions-=T				"removes gvim toolbar
		setlocal guioptions-=r				"remove right scrollbar
		echo a:hide_uglies
	else
		setlocal guioptions+=m				"removes gvim menubar
		setlocal guioptions+=T				"removes gvim toolbar
		setlocal guioptions+=r				"remove right scrollbar
		echo a:hide_uglies
	endif
endfunction
" }

" airline tabs {
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse=1		" collapses parent directories in buffer name
let g:airline#extensions#tabline#fnamemode = ':t'		" shows tail of file name		
let g:airline#extensions#branch#format = 1				" only shows file name
let g:airline_theme='distinguished'
" }

" indentline settings {
let g:indentLine_setColors = 1	" 0 or 1 for grey or colourscheme
"let g:indentLine_color_gui = '#BADA55'
"let g:indentLine_char = '¦'
" }

" thesaurus_query {
" nnoremap <Leader>cs :ThesaurusQueryReplaceCurrentWord<CR> "default
" :Thesaurus your phrase
" }

" unicycle {
" best to use only for certain filetypes
" utf-8 MUST BE ON
" -- is en dash; --- is em dash; ---- is back to hyphen-minus
"  ... is ellipsis
"  double and single quotes are automatically done
" :UniCycleOn
" http://www.vim.org/scripts/script.php?script_id=1384
" }

" vim-textobj-quote and vim-textobj-user {
" configure for each filetype
" https://github.com/reedes/vim-textobj-quote
augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType rst call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END
" }

" goyo.vim {
" adds margins for word processing in vim
" https://github.com/junegunn/goyo.vim
" }

" limelight.vim {
" hyperfocus-writing in vim
" https://github.com/junegunn/limelight.vim
" }
