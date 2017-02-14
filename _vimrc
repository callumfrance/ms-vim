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
winpos 9999 2			"vim always opens on RHS screen

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

" file types {
augroup word_processors
	autocmd!
	autocmd BufNewFile,BufRead *.md,*.markdown call LazyWP()
	autocmd BufNewFile,BufRead *.txt call WP()
	autocmd BufNewFile,BufRead *.textile call LazyWP()
	autocmd BufNewFile,BufRead *.rst call LazyWP()

	autocmd BufNewFile,BufRead *.text let g:limelight_paragraph_span = 1

	autocmd BufNewFile,BufRead *.md,*.markdown call HideUglies(1)
	autocmd BufNewFile,BufRead *.txt call HideUglies(1)
	autocmd BufNewFile,BufRead *.textile call HideUglies(1)
	autocmd BufNewFile,BufRead *.rst call HideUglies(1)
	autocmd BufNewFile,BufRead *.html call HTMLSettings()
augroup END
" }

" html settings {
let g:user_emmet_install_global = 0

function! HTMLSettings() 
	EmmetInstall
	set lines=50 columns=92
	setlocal tabstop=2
	bufdo colorscheme Tomorrow-Night-Eighties
	setlocal foldmethod=syntax
	bufdo syntax spell toplevel
	bufdo syn case ignore
	bufdo syn match htmlError "[<>&]"
endfunction

" }

" vimrc folds organisation {
set foldmethod=marker
set foldmarker={,}
set foldlevel=0
" }

" Word processor mode {
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
	setlocal formatprg=par
	setlocal wrap
	setlocal linebreak
	setlocal spellfile=~\vimfiles\spell\en.utf-8.add
	setlocal spell spelllang=en_au		" http://vimdoc.sourceforge.net/htmldoc/spell.html
	setlocal complete+=s

	Goyo 85%x85%-2%						" margins
endfunction

function LazyWP()
	colorscheme Tomorrow-Night-Bright
	setlocal lines=65 columns=90
	setlocal formatoptions=1
	setlocal noexpandtab
	map j gj
	map k gk
	setlocal formatprg=par
	setlocal wrap
	setlocal linebreak

	Goyo 75%x80%-5%
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
