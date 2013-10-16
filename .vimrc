" .vimrc

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
set shiftwidth=2
set expandtab " use spaces, not tab characters
set nocompatible " don't need to be compatible with old vim
set number
set cc=80 " show column 80
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
"set nofoldenable " disable code folding
set guifont=PragmataPro
set clipboard=unnamed " use the system clipboard
set wildmenu " enable bash style tab completion
set wildmode=list:longest,full
set runtimepath^=~/.vim/bundle/ctrlp.vim
" set dark background and color scheme
set background=dark
"colorscheme base16-railscasts
colorscheme solarized
au BufRead, BufNewFile *.ru setfiletype ruby
" set up some custom colors
highlight clear SignColumn
highlight VertSplit ctermbg=236
highlight ColorColumn ctermbg=237
highlight LineNr ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine ctermbg=3 ctermfg=235
highlight IncSearch ctermbg=0 ctermfg=3
highlight Search ctermbg=0 ctermfg=9
highlight Visual ctermbg=3 ctermfg=0
highlight Pmenu ctermbg=240 ctermfg=12
highlight PmenuSel ctermbg=0 ctermfg=3
highlight SpellBad ctermbg=0 ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" set leader key to comma
let mapleader = ","

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" unmap F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" map . in visual mode
vnoremap . :norm.<cr>

" die hash rockets, die!
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" delete all trailing whitespace in current file
map <leader>w :%s/\s\+$//gce \| w<cr>

" delete all trailing whitespace for each file in repo
map <leader>W :args `git grep -lI .` \| argdo %s/\s\+$//gce \| w<cr>

" map markdown preview
map <leader>m :!open -a Marked %<cr><cr>

" map git commands
map <leader>b :Gblame<cr>
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" check code complexity
map <leader>x :!clear && flog %<cr>

" open scratchpad
map <leader>s :e /Users/chris/Dropbox/Notational\ Data/Scratchpad.txt<cr>

" open gist after it's been created
let g:gist_open_browser_after_post = 1

" shortcuts for going next/previous in quickfix (for git log spelunking)
nmap [q :cprevious<cr>
nmap ]q :cnext<cr>

" map Silver Searcher
map <leader>a :Ag!<space>

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" map %% to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" jump to last position in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif

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

" Run specs with ',t' via Gary Bernhardt
function! RunTests(filename)
" Write the file and run tests for the given filename
  :w
  :silent !clear
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  elseif match(a:filename, '_test\.rb$') != -1
    exec ":!ruby -Itest " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
" Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

" Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
