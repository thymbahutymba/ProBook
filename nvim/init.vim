" setlocal spell spelllang=en_us
set title
set titlestring=NVIM:\ %-25.55F\ %a%r%m titlelen=70
filetype plugin indent on

" Tabs
set tabstop=4       " Number of spaces that a <Tab> in the file counts for. 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set autoindent
set si
set noexpandtab
set softtabstop=0
set preserveindent
set wrap

set showcmd         " Show (partial) command in status line.
set number          " Show line numbers.
set showmatch
set hlsearch
set incsearch
set ruler           " show cursor position all the time
set background=dark
set cursorline
set noswapfile
set history=500

" set linebreak
" set wrap
" set nolist
" set list listchars=tab:»\ ,nbsp:_,trail:·
set list listchars=tab:▸\ ,eol:¬
" set list
" set showmode
" set nowrap

" Persistent undo
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000
set undoreload=10000

hi Normal ctermbg=none
set colorcolumn=81
set laststatus=2
" set statusline=\ "
" set statusline+=%f\ " file name
" set statusline+=[
" set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
" set statusline+=%{&fileformat}] " file format
" set statusline+=%h%1*%m%r%w%0* " flag
" set statusline+=%= " right align
" set statusline+=%-14.(%l,%c%V%)\ %<%P " offsetset linespace=0
set linespace=0
set modifiable

set noshowmode

" Leader and Keybind

nmap <silent><S-l> :bn<CR>
nmap <silent><S-h> :bp<CR>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

map <silent> <leader><cr> :noh<cr>
nmap <silent> <leader>hh :split<CR>
nmap <silent> <leader>vv :vsplit<CR>

colorscheme molokai

set t_Co=256
if has('mouse')
    set mouse=a
endif

set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
"Plugin 'scrooloose/syntastic'
"Plugin 'roxma/nvim-completion-manager'
"Plugin 'phpactor/phpactor' ,  {'do': 'composer install'}	" PHP
"Plugin 'roxma/ncm-phpactor'
"Plugin 'roxma/ncm-clang'		" CPP
"Plugin 'calebeby/ncm-css'		" CSS
Plugin 'lilydjwg/colorizer'
Plugin 'lervag/vimtex'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
call vundle#end()

" Nerd tree
map <silent><F10> :NERDTreeToggle<CR>
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
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" NCM
" set shortmess+=c
" inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Tagbar
map <F9> :TagbarToggle<CR>

" Vim Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#branch#enabled = 1			" Fugitive required
" let g:airline_powerline_fonts = 1					" Fugitive required
" let g:airline#extensions#ale#enabled = 1

" Deoplete vimtex
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

set shell=/bin/bash
syntax on
