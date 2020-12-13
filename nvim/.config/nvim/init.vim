" vim: fdm=marker foldenable sw=4 ts=4 sts=4
" Basic Settings {{{
filetype plugin indent on    " Add filetype, plugin and indent support
syntax enable 
"}}}

" Variable Assignments {{{
let $MYVIMRC="~/.config/nvim/init.vim"
let $MYVIMDIR="~/.config/nvim"
" }}}

" {{{ Settings

set path=.,**                  " Search relative to current file + directory
set shell=/usr/local/bin/zsh
set ignorecase smartcase        " Faster Search
set relativenumber cursorline   " Appearence
set hidden                      " Required to keep multiple buffers open multiple buffers
set noswapfile                  " noswapefile period
set sw=4 ts=4 sts=4 expandtab   " Indentation default
set autoindent smartindent
set nowrap                      " Don't break line
set splitright splitbelow
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
" }}}

" Netrw {{{
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_winsize=15
let g:netrw_list_hide=netrw_gitignore#Hide()
" }}}

" {{{ Syntax Highlighting
set termguicolors
colorscheme molokai
hi VertSplit guibg=NONE
hi LineNr guibg=NONE guifg=#666467 
hi SignColumn ctermfg=NONE guibg=NONE
hi Normal ctermfg=NONE guibg=NONE
hi StatusLine guifg=#262226 guibg=#7D7D7D cterm=NONE
hi StatusLineNC guifg=#262226 guibg=#7D7D7D cterm=NONE
hi EndOfBuffer guibg=NONE guifg=#191919
" }}}

" Key Mappings {{{

" Esc Alternative inoremap jk <Esc>
inoremap kj <Esc>
inoremap jk <Esc>

" Faster buffer navigation
nnoremap ,b :b <C-d>

" Change indent continuously
vmap < <gv
vmap > >gv

" Command-line like search
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" Explorer
nnoremap ,e :Lexplore<CR>
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

let mapleader = " "

" Symbol-based navigation
nnoremap ,t :tjump /
nnoremap ,d :dlist /
nnoremap ,i :ilist /
" QuickFix list navigation
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>
" }}}

" Commands {{{
" Create the `tags` file  
command! MakeTags !ctags -R .  
" }}}

" Overrrides "
let s:vimrc_local = $HOME . '/.vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif
