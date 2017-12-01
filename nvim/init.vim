"setlocal spell spelllang=en_us
set title
set titlestring=NVIM:\ %-25.55F\ %a%r%m titlelen=70

" Tabs
set tabstop=4       " Number of spaces that a <Tab> in the file counts for. 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set autoindent
set si				" 
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
set showmode
" set nowrap

" Persistent undo
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000
set undoreload=10000

hi Normal ctermbg=none
set colorcolumn=81
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offsetset linespace=0
set linespace=0

" Leader and Keybind


nmap <silent><A-l> :bn<CR>
nmap <silent><A-h> :bp<CR>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

map <silent> <leader><cr> :noh<cr>
set pastetoggle=<F2>

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
map <F10> :NERDTreeToggle<CR>
" map <F9> :NERDTreeFind<CR>
set modifiable
Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/syntastic'
let g:syntastic_quiet_messages = { "level": "warnings" }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plugin 'roxma/nvim-completion-manager'
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

Plugin 'phpactor/phpactor' ,  {'do': 'composer install'}	" PHP
Plugin 'roxma/ncm-phpactor'
Plugin 'roxma/ncm-clang'		" CPP
Plugin 'calebeby/ncm-css'		" CSS
Plugin 'lilydjwg/colorizer'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'lervag/vimtex'
Plugin 'jiangmiao/auto-pairs'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Plugin 'tpope/vim-fugitive'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

call vundle#end()

set shell=/bin/bash
filetype plugin indent on
syntax on
