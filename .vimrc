" .vimrc
execute pathogen#infect()

syntax enable
syntax on
filetype plugin indent on

set nocompatible " don't need to be compatible with old vim
set fileencoding=utf-8
set cursorline
set encoding=utf-8
"set clipboard=unnamed
set clipboard=unnamedplus
set autoindent " set auto indent
set ts=2 " set indent to 2 spaces
set sts=2
set sw=2
set backspace=indent,eol,start
set expandtab " use spaces, not tab characters
set shiftwidth=2 "number of space chars for indentation
set softtabstop=2 "number of space chars a tab counts for
set tabstop=2 "space chars inserted when tab key is pressed
set nowrap
set ignorecase
set smartcase
set hlsearch " highlight all search matches
set ruler " show row and column in footer
set scrolloff=2 " minimum lines above/below cursor
set laststatus=2 " always show status bar
set guifont=PragmataPro
set wildmenu " enable bash style tab completion
set wildmode=list:longest,full

highlight Comment ctermfg=DarkGrey


map <C-n> :NERDTreeToggle<CR>
let g:multi_cursor_start_key='<C-d>'

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
noremap <C-l> :nohlsearch<CR>
function! InsertTabWrapper()
    let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
      else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" set leader key to comma
let mapleader = ","

