filetype plugin indent on    " Add filetype, plugin and indent support
syntax enable 

set path=.,**                  " Search relative to current file + directory
set shell=/usr/local/bin/zsh
set number
set ignorecase smartcase        " Faster Search
set cursorline                  " Appearence
set hidden                      " Required to keep multiple buffers open multiple buffers
set noswapfile                  " noswapefile period
set sw=4 ts=4 sts=4 expandtab   " Indentation default
set autoindent smartindent
set nowrap                      " Don't break line
set splitright splitbelow
set undodir=~/.undo/undodir
set undofile

" Navigation
set wildmenu                    " Show file options above the cmd
set wildmode=longest:full,full
set wildignorecase
set wildignore=.git/,.tags,tags,*/node_modules/*

" Options
set mouse=a                     " Enable your mouse
set clipboard+=unnamedplus      " Copy paste between vim and everything else
set updatetime=300              " Faster completion
set timeoutlen=300              " By default timeoutlen is 1000 ms

set termguicolors
inoremap kj <Esc>
inoremap jk <Esc>
" Faster buffer navigation
nnoremap ,b :b <C-d> 
" Change indent continuously
vmap < <gv
vmap > >gv

" Overrrides "
let s:vimrc_local = $HOME . '/.vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif
