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
Plug 'ghifarit53/tokyonight-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'Morhetz/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Goyo
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Git
Plug 'tpope/vim-fugitive'

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

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermfg=NONE guibg=NONE
hi SignColumn ctermfg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#17252c

" === Vim Statusline==== "
set laststatus=2
set noshowmode
" Lightline Settings
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            ['zoom', 'githunks', 'gitbranch', 'readonly', 'filename', 'method']],
  \   'right': [['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'trailing', 'lineinfo'],
  \             ['percent'],
  \             ['filetype']]
  \ },
  \ 'tabline': {
  \   'left': [['buffers']],
  \   'right': [['']]
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_ok': 'lightline#ale#ok',
  \   'trailing': 'lightline#trailing_whitespace#component',
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \   'trailing': 'error',
  \   'buffers': 'tabsel'
  \ },
  \ 'component_function': {
  \   'zoom': 'zoom#statusline',
  \   'githunks': 'LightlineGitGutter',
  \   'gitbranch': 'LightlineGitFugitive',
  \   'filename': 'LightlineFilename',
  \   'method': 'NearestMethodOrFunction',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype'
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
  \ }

let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#min_buffer_count = 1
let g:lightline#bufferline#show_number      = 1
let g:lightline#bufferline#unicode_symbols  = 1
let g:lightline#trailing_whitespace#indicator = '¥'

function LightlineGitGutter()
    if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
        return ''
    endif
    let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction

function! LightlineGitFugitive()
    if empty(FugitiveHead())
        return ''
    endif
    return ' '.FugitiveHead()
endfunction

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' [+]' : ''
    return filename . modified
endfunction

function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
" Save last position
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
