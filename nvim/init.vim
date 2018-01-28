" setlocal spell spelllang=en_us
set title
set titlestring=NVIM:\ %-25.55F\ %a%r%m titlelen=70
filetype plugin indent on
set nocompatible
filetype on
set modeline

" Tabs
set smarttab
set tabstop=4       " Number of spaces that a <Tab> in the file counts for. 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set autoindent
set si
set preserveindent
set copyindent
set noexpandtab
set softtabstop=0
set textwidth=120
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

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'lilydjwg/colorizer'
Plugin 'lervag/vimtex'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
" Plugin 'junegunn/goyo.vim'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'itchyny/lightline.vim'
" Plugin 'ap/vim-buftabline'
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

" Ultisnips Snippets
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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

" Deoplete vimtex
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" vim-gutentag
" Enable
" let g:gutentag_enabled = 1
" Set cache dir
" let g:gutentags_cache_dir = '~/.cache/tags'

" Append modeline after last line in buffer.
function! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
		\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

let g:python_recommended_style = 0

set shell=/bin/bash
syntax on

" vim: set ts=4 sw=4 tw=80 noet :
