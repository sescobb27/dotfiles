" .vimrc
filetype off
execute pathogen#infect()
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
set shiftwidth=2
set nowrap
set ignorecase
set smartcase
set number
set hlsearch " highlight all search matches
set vb " enable visual bell (disable audio bell)
set ruler " show row and column in footer
set scrolloff=2 " minimum lines above/below cursor
set laststatus=2 " always show status bar
set guifont=PragmataPro
set wildmenu " enable bash style tab completion
set wildmode=list:longest,full
syntax enable
syntax on
filetype plugin indent on

highlight Comment ctermfg=DarkGrey


map <C-n> :NERDTreeToggle<CR>
let g:multi_cursor_start_key='<C-d>'

autocmd vimenter * if !argc() | NERDTree | endif
noremap <C-m> :tabnew <CR>
noremap <s-m> :tabclose <CR>
noremap <C-b> :tabNext <CR>
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
set runtimepath+=/root/.vim/

" set leader key to comma
let mapleader = ","

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>r :GoRun %<CR>

au BufRead,BufNewFile *.go set filetype=go

"xmpfilter
autocmd FileType ruby nmap <buffer> <F5> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <F5> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <F5> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <F4> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <F4> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <F4> <Plug>(xmpfilter-run)

