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
set undodir=~/.config/nvim/undo/undodir
set undofile

" Search
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

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

" Bindings for more efficient path-based file navigation
nnoremap ,f :find *
nnoremap ,v :vert sfind *
nnoremap ,F :find <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap ,V :vert sfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
" List all occurences in file
nnoremap ,g :g//#<Left><Left>

" Argslist navigation
nnoremap [a :previous<CR>
nnoremap ]a :next<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>

" Symbol-based navigation
nnoremap ,t :tjump /
nnoremap ,d :dlist /
nnoremap ,i :ilist /
" QuickFix list navigation
nnoremap ,n :cnext<CR>
nnoremap ,p :cprevious<CR>

" Overrrides "
let s:vimrc_local = $HOME . '/.vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif
