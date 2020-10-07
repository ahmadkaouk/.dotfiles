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
Plug 'lifepillar/vim-solarized8'
Plug 'Morhetz/gruvbox'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" File Manager
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
call plug#end()

source $HOME/.config/nvim/autocommand.vim
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
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation

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
colorscheme gruvbox
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermfg=NONE guibg=NONE
hi SignColumn ctermfg=NONE guibg=NONE
hi StatusLine gui=NONE guibg=NONE
hi VertSplit gui=NONE guifg=#17252c guibg=NONE
hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#17252c

" === Vim Statusline==== "
set laststatus=2
" ============================================================================ "
" ===                             FZF Config                               === "
" ============================================================================ "
" FZF config
let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.7,
      \ 'highlight': 'Comment',
      \ 'rounded': v:true } }

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_COMMAND="rg --files --hidden"

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0) 
  \   'git grep --line-number '.shellescape(<q-args>), 0,


