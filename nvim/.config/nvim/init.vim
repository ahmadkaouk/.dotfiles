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
" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Vim which Key
Plug 'liuchengxu/vim-which-key'
" Vim Snippets
Plug 'honza/vim-snippets'
call plug#end()

" ============================================================================ "
" ===                           GENERAL OPTIONS                            === "
" ============================================================================ "
" Appearence
set number                              " display line numbers
set relativenumber                      " Relative Line numbers
set cursorline                          " highlight current line
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set signcolumn=yes                     " Always show the signcolumn, otherwise it would shift the text each time
set termguicolors                       " Set true colors
set splitbelow                          " Set preview window to appear at bottom

" Tab Control
set expandtab                           " Converts tabs to spaces
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set autoindent                          " Good auto indent
set smartindent                         " Makes indenting smart
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation

" Options
set mouse=a                             " Enable your mouse
set encoding=utf-8                      " The encoding displayed 
set fileencoding=utf-8                  " The encoding written to file
set incsearch                           " Set Incremental search
set clipboard=unnamedplus               " Copy paste between vim and everything else
set ignorecase                          " ignore case when searching
set smartcase                           " if the search string has an upper case letter in it, the search will be case sensitive
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms

" Backup
set nobackup                            " This is recommended by coc
set noswapfile                          " No Swap Files
set nowritebackup                       " This is recommended by coc
set undofile
set undolevels=3000
set undoreload=10000


" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
let mapleader=" "

" Esc Alternati inoremap jk <Esc>
inoremap kj <Esc>
inoremap jk <Esc>
nnoremap <C-c> <ESC>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" set paste toggle
set pastetoggle=<leader>v

vnoremap < <gv
vnoremap > >gv

" Move Line Up and Down
nnoremap <C-j> :move +1<CR>
nnoremap <C-K> :move -2<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" scroll the viewport faster
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>


" Which key Plug Config
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = ''

let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" s is for search
let g:which_key_map.f = {
      \ 'name' : '+search' ,
      \ 'z' : [':FZF'          , 'FZF'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'f' : [':Files'        , 'files'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ '/' : [':History/'     , 'history'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'h' : [':History'      , 'file history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ }

let g:which_key_map['s'] = [ ':w'                        , 'Save' ]
let g:which_key_map['q'] = [ ':q'                        , 'Quit' ]
let g:which_key_map['w'] = [ ':bw'                       , 'Close Tab' ]
let g:which_key_map['r'] = [ ':source %'                 , 'Reload' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'      , 'Explorer']
let g:which_key_map['S'] = [ ':Startify'                 , 'start screen' ]
let g:which_key_map['C'] = [ ':set hlsearch! hlsearch?'  , 'Clear search' ]
noremap <leader>C :set hlsearch! hlsearch?<cr>
call which_key#register('<Space>', "g:which_key_map")


" ============================================================================ "
" ===                             Theme Config                             === "
" ============================================================================ "

syntax enable
syntax on
set termguicolors
let g:oceanic_next_terminal_italic = 1
colorscheme dracula
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermfg=NONE guibg=NONE
hi SignColumn ctermfg=NONE guibg=NONE
hi StatusLine gui=NONE guibg=NONE
hi StatusLineNC guifg=NONE guibg=#16252b
hi VertSplit gui=NONE guifg=#17252c guibg=NONE
hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#17252c

" === Vim Lightline ==== "
" Custom setup that removes filetype/whitespace from default vim airline bar
" Vim airline theme
let g:airline_theme='transparent'
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline#extensions#whitespace#enabled = 0

" ===                             FZF Config                               === "
" ============================================================================ "

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
