if !exists('g:vscode')
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" Appearence
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'

" Intellisence
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'

" Themes
Plug 'Morhetz/gruvbox'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'

" Goyo
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()

source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/mapping.vim
" ============================================================================ "
" ===                           GENERAL OPTIONS                            === "
" ============================================================================ "
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Appearence
set number                              " display line numbers
set relativenumber                      " Relative Line numbers
set cursorline                          " highlight current line
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set splitbelow                          " Set preview window to appear at bottom

" Tab Control
set autoindent                          " Good auto indentv
set smartindent                         " Makes indenting smart
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation

"" Searching
set ignorecase                          " ignore case when searching
set smartcase                           " if the search string has an upper case letter in it, the search will be case sensitive

" Options
set mouse=a                             " Enable your mouse
set clipboard+=unnamedplus               " Copy paste between vim and everything else
set updatetime=300                      " Faster completion
set timeoutlen=300                     " By default timeoutlen is 1000 ms

" Backup
set nobackup                            " This is recommended by coc
set noswapfile                          " No Swap Files
set nowritebackup                       " This is recommended by coc

" Persistent undo
" Don't forget mkdir folder $HOME/.vim/undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '▏'
let g:indentLine_faster = 1

" Required:
filetype plugin indent on

" ============================================================================ "
" ===                             Theme Config                             === "
" ============================================================================ "

syntax enable
syntax on
set termguicolors
set background=dark


hi Normal guibg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr guifg=NONE guibg=NONE
hi SignColumn ctermfg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#111111


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:goyo_width = 100
let g:goyo_height = 150
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  hi SignColumn ctermfg=NONE guibg=NONE
  hi Normal ctermbg=NONE guibg=NONE
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif

source $HOME/.config/nvim/my-scheme.vim
