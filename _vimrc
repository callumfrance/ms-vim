set nocompatible
" File ~\vimfiles\_vimrc
" {
" ($HOME\_vimrc on Windows)
source $VIMRUNTIME/defaults.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set splitright

" use `zo` to open folds and `zc` to close them
" use `zO` and `zC` to do the same but for all heirarchies

" pathogen {
" execute pathogen#infect()
" syntax on
" filetype plugin indent on
" }

"plugins and vundle {
" for vundle to work on windows, you need to install Git for Windows
" you also need to install Curl from the cURL downloads page
" also make sure that the %HOME% variable is set like ~/. in Unix

"Alternate lines for Windows
set nocompatible
filetype off
set rtp+='$Vim/vimfiles/bundle/Vundle.vim'
call vundle#begin('$Vim/vimfiles/bundle/')

"Let vundle manage vundle
Plugin 'VundleVim/Vundle.vim'
" vundle plugins go here
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
Plugin 'Yggdroot/indentLine'
Plugin 'Ron89/thesaurus_query.vim'
Plugin 'reedes/vim-wordy'
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-textobj-quote'
Plugin 'vim-scripts/ScrollColors'

Plugin 'valloric/youcompleteme'

Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'

call vundle#end()
filetype plugin indent on
" }

filetype plugin indent on
winpos 9999 2			"vim always opens on RHS screen

" cabbrev Goyo Goyo 85%x85%-2%
cabbrev shiba !shiba --detach %

" useful tips {
" `:SCROLL`	followed by UP/DOWN arrow keys will scroll through colour schemes
" }

" default styling {
colorscheme solarized

set antialias									"smooths fonts
set tw=0											" textwidth doesnt wrap
set relativenumber            "page numbering
set nowrap
set tabstop=4
set shiftwidth=4
set smarttab
set smartcase
set autoindent
set shiftround										"indents rounded to a multiple
set noexpandtab

set ignorecase		" searching
set showmatch
set hlsearch

set history=100		" history
set undolevels=100
set noerrorbells	" error noise

set title
set modelines=0
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8

set nowritebackup
set noswapfile
set nobackup

" set lines=43 columns=80	" from macbook
set lines=50 columns=70	"might also work

nnoremap ; :
command WQ wq
command Wq wq
command W w
command Q q

" }

" file types {
augroup word_processors
	autocmd!
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


" word processor {

" `:call WP()`		opens the word processor mode
" `z=`				displays corrections
" `zg`				adds words to dictionary
function! WP()
	setlocal noexpandtab        "When the tab key is pressed, inserts a tab and not several spaces
	setlocal formatoptions=1
	map j gj
	map k gk
	setlocal formatprg=par
	setlocal wrap
	setlocal linebreak
	setlocal spellfile="C:\Program Files (x86)\Vim\vimfiles\spell\en.utf-8.add"
	setlocal spell spelllang=en_au		" http://vimdoc.sourceforge.net/htmldoc/spell.html
  setlocal spell syntax=off
	setlocal complete+=s
  retab

	UniCycleOn
	Goyo 85%x85%-2%						" margins
  
	colorscheme pencil
	setlocal lines=65 columns=90
endfunction

function! LazyWP()
	setlocal noexpandtab
	setlocal formatoptions=1
	map j gj
	map k gk
	setlocal formatprg=par
	setlocal wrap
	setlocal linebreak	" line wraps don't break up words

	UniCycleOn

  colorscheme materialtheme
	setlocal lines=65 columns=90
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

" vim-textobj-quote and vim-textobj-user {
" configure for each filetype
" https://github.com/reedes/vim-textobj-quote
"
" these aren't working
"augroup textobj_quote
"  autocmd!
"  autocmd FileType markdown call textobj#quote#init()
"  autocmd FileType rst call textobj#quote#init()
"  autocmd FileType textile call textobj#quote#init()
"  autocmd FileType text call textobj#quote#init({'educate': 0})
" augroup END
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

" java coding standards - move this to an ftplugin {
augroup java_standards
  autocmd!
  autocmd Filetype java set tabstop=4
  autocmd Filetype java set shiftwidth=4
augroup END
" }

" folds {
set foldmethod=marker
set foldmarker={,}
set foldlevel=2
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
" }
" }
