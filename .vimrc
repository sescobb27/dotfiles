" .vimrc
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()


syntax on " show syntax highlighting
syntax enable
filetype on
filetype plugin on
filetype indent on

set fileencoding=utf-8
set encoding=utf-8
set autoindent " set auto indent
set ts=2 " set indent to 2 spaces
set sts=2
set sw=2
set backspace=indent,eol,start
set expandtab " use spaces, not tab characters
set shiftwidth=2
set nocompatible " don't need to be compatible with old vim
set number
set showmatch " show bracket matches
set ignorecase " ignore case in search
set hlsearch " highlight all search matches
set cursorline " highlight current line
set smartcase " pay attention to case when caps are used
set incsearch " show search results as I type
set mouse=a " enable mouse support
set ttimeoutlen=100 " decrease timeout for faster insert with 'O'
set vb " enable visual bell (disable audio bell)
set ruler " show row and column in footer
set scrolloff=2 " minimum lines above/below cursor
set laststatus=2 " always show status bar
set list
set listchars=tab:»·,eol:¬" show extra space characters
set guifont=PragmataPro
set clipboard=unnamed " use the system clipboard
set wildmenu " enable bash style tab completion
set wildmode=list:longest,full
" set dark background and color scheme
set background=dark

" set up some custom colors
highlight LineNr ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 "ctermfg=240
highlight CursorLine ctermbg=236
highlight Comment ctermfg=DarkGrey
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine guifg=black guibg=gray
highlight Visual ctermbg=3 ctermfg=0

" set leader key to comma
let mapleader = ","

" map . in visual mode
vnoremap . :norm.<cr>

" delete all trailing whitespace in current file
map <leader>w :%s/\s\+$//gce \| w<cr>

" delete all trailing whitespace for each file in repo
map <leader>W :args `git grep -lI .` \| argdo %s/\s\+$//gce \| w<cr>
"
" map Silver Searcher
map <leader>a :Ag!<space>

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" map %% to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" multi-purpose tab key (auto-complete)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

:map <f9> :make    - map the F9 key to run make

set runtimepath+=/home/simon/.vim/
autocmd FileType go compiler go
