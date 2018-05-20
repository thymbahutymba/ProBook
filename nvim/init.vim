set title
set titlestring=NVIM:\ %-25.55F\ %a%r%m titlelen=70
set encoding=utf8
filetype plugin indent on
set nocompatible
filetype on
set modeline

" Tabs
set smarttab
set tabstop=4		" Number of spaces that a <Tab> in the file counts for. 
set shiftwidth=4	" Number of spaces to use for each step of (auto)indent.
set autoindent
set si
set preserveindent
set copyindent
set noexpandtab
set softtabstop=0

set textwidth=200
set wrap			" Warp lines

set splitright		" Vertical split to right
set splitbelow

" set completeopt=menuone,preview,noinsert
set completeopt=menuone,preview,noinsert

set showcmd		 " Show (partial) command in status line.
set number		  " Show line numbers.
set showmatch
set hlsearch
set incsearch
set ruler		   " show cursor position all the time
set background=dark
set cursorline
set noswapfile
set history=500

" list possible simbol ↲┆▸· ▏
set list listchars=tab:▸\ ,trail:·,nbsp:␣,extends:⟩,precedes:⟨
set list

" Persistent undo
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000
set undoreload=10000

hi Normal ctermbg=none
set colorcolumn=81
set laststatus=2
set linespace=0
set modifiable

set noshowmode

set termguicolors
colorscheme quantum

cnoremap w!! w !sudo tee > /dev/null % 

" Leader and Keybind
let mapleader=";"
nmap <silent><S-l> :bn<CR>
nmap <silent><S-h> :bp<CR>

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

map <silent> <leader><cr> :noh<cr>
nmap <silent> <leader>hh :split<CR>
nmap <silent> <leader>vv :vsplit<CR>

set t_Co=256
if has('mouse')
	set mouse=a
endif
if !&scrolloff
	set scrolloff=7
endif

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'lilydjwg/colorizer'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'

Plug 'Shougo/neco-vim'
Plug 'rust-lang/rust.vim'

Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyrannicaltoucan/vim-quantum'

Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'

Plug 'mhinz/vim-startify'

call plug#end()

" Nerd tree
map <silent><F10> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
" map <F9> :NERDTreeFind<CR>

" A.L.E
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Lightline
let g:lightline = {
	  \ 'colorscheme': 'quantum',
	  \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \			 [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	  \ },
	  \ 'component_function': {
	  \   'gitbranch': 'fugitive#head'
	  \ },
	  \ }

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"

" Ultisnips Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Tagbar
map <silent><F9> :TagbarToggle<CR>

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#enabled = 1			" Fugitive required
let g:airline_powerline_fonts = 1					" Fugitive required
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'	" default, unique_tail, unique_tail_improved 
let g:airline_theme='quantum'
let g:airline_section_warning=''

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete	" vimtex
let g:deoplete#sources#jedi#show_docstring = 1					" deoplete
let g:deoplete#sources#rust#racer_binary = '/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/usr/lib/rustlib/src/rust/src'
autocmd CompleteDone * pclose!		" Close preview window after completition

" Append modeline after last line in buffer.
function! AppendModeline()
	let l:modeline = printf("vim: set ts=%d sw=%d tw=%d %set :",
		\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent><Leader>ml :call AppendModeline()<CR>

let g:python_recommended_style = 0

" Vim quantum
let g:quantum_black=1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <silent> <F9> :TagbarToggle<CR>

set shell=/bin/bash
syntax on

" vim: set ts=4 sw=4 tw=80 noet :
