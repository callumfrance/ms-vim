colorscheme birds-of-paradise

let b:ale_linters = {'dart': []}

if !has("gui_macvim")
	set lines=60 columns=85
	set colorcolumn=81
endif

" language specific settings
set tabstop=2
set shiftwidth=2

set list listchars=tab:\ \ ,trail:·

nnoremap <space> :DartFmt<CR>:w<CR>:nohl<CR>
