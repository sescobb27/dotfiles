" .vimrc
set nocompatible " don't need to be compatible with old vim

" load up pathogen and all bundles
call pathogen#infect()

autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
noremap <C-m> :tabnew <CR>
noremap <s-m> :tabclose <CR>
noremap <C-b> :tabNext <CR>
set fileencoding=utf-8
set encoding=utf-8
set autoindent " set auto indent
set ts=2 " set indent to 2 spaces
set sts=2
set sw=2
set backspace=indent,eol,start
set expandtab " use spaces, not tab characters
set shiftwidth=2
set number
set hlsearch " highlight all search matches
"set cursorline " highlight current line
set ttimeoutlen=100 " decrease timeout for faster insert with 'O'
set vb " enable visual bell (disable audio bell)
set ruler " show row and column in footer
set scrolloff=2 " minimum lines above/below cursor
set laststatus=2 " always show status bar
set guifont=PragmataPro
set clipboard=unnamed " use the system clipboard
set wildmenu " enable bash style tab completion
set wildmode=list:longest,full
syntax enable
colorscheme solarized
"let g:solarized_termcolors=256

" set up some custom colors
"highlight LineNr ctermbg=236 ctermfg=240
"highlight CursorLineNr ctermbg=236 "ctermfg=240
"highlight CursorLine ctermbg=236
highlight Comment ctermfg=DarkGrey
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine guifg=black guibg=gray
highlight Visual ctermbg=3 ctermfg=0

" map . in visual mode
vnoremap . :norm.<cr>

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

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

set runtimepath+=/home/simon/.vim/
autocmd FileType go compiler go
