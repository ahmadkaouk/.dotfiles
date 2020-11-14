" vim: fdm=marker foldenable sw=4 ts=4 sts=4
if !exists('g:vscode')
" {{{ Plugins and Settings
" Vim-plug is used to handle plugins.

" {{{  Vim Plug Setup

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" }}}

call plug#begin('~/.config/nvim/autoload/plugged')

" {{{ Appearence
"     ========

    Plug 'sainnhe/gruvbox-material'
    Plug 'skielbasa/vim-material-monokai'
    Plug 'ryanoasis/vim-devicons'
    "Syntax Highliting
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" }}}

" {{{ Git
"     ========

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" }}}

" {{{ Intellisence
"     ========

Plug 'preservim/tagbar'

" }}}

" {{{ Search
"     ========

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

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

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}

" {{{ Tpope
"     ========

    " vim-surround: s is a text-object for delimiters; ss linewise
    " ys to add surround
    Plug 'tpope/vim-surround'
    
    " vim-commentary: gc is an operator to toggle comments; gcc linewise
    Plug 'tpope/vim-commentary'

" }}}

" {{{ NERDTree
"     ========

Plug 'scrooloose/nerdtree'

" OPTIONS:
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" Get rid of objects in C projects
let NERDTreeIgnore=['\~$', '.o$', 'bower_components', 'node_modules', '__pycache__']
augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end
" }}}

call plug#end()

" }}}

" Commands {{{
" Create the `tags` file  
command! MakeTags !ctags -R .
" }}}

" {{{ Syntax Highlighting

" Syntax hilighting
set noshowmode
set termguicolors
set background=dark

colorscheme material-monokai
hi Normal guibg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
hi LineNr guibg=NONE 
hi SignColumn ctermfg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE guifg=#171717

" }}}

" Airline  {{{

let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_y = ''
" Fancy Symbols!!

let g:webdevicons_enable = 1

" custom airline symbols
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '/'

" }}}

else
endif

" {{{ Basic Settings

" For clever completion with the :find command
set path+=**

" Searching
set ignorecase smartcase

" Appearence
set number relativenumber cursorline nowrap

set hidden                      " Required to keep multiple buffers open multiple buffers

" Formatting
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent

" Options
set mouse=a                             " Enable your mouse
set clipboard+=unnamedplus              " Copy paste between vim and everything else
set updatetime=300                      " Faster completion
set timeoutlen=300                     " By default timeoutlen is 1000 ms

" Backup
set nobackup noswapfile nowritebackup                      

" Don't redraw while executing macros (good performance config)
set lazyredraw

set encoding=UTF-8

" Persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" }}}

" Key Mappings {{{

" Esc Alternative inoremap jk <Esc>
inoremap kj <Esc>
inoremap jk <Esc>

" Newlines
nnoremap ,j o<ESC>k
nnoremap ,k O<ESC>j

" Change indent continuously
vmap < <gv
vmap > >gv

" Movement between tabs OR buffers
nnoremap <silent> L :call MyNext()<CR>
nnoremap <silent> H :call MyPrev()<CR>

" Redo last Ex command with bang
nnoremap ,! q:k0ea!<ESC>

let mapleader = " "

" Like Vscode
noremap <leader>o :Files<CR>
noremap <leader>p :History<CR>
noremap <leader>f :BLines<CR>
noremap <leader>F :Rg!<CR>
noremap <leader>g :GFiles<CR>
noremap ,e :NERDTreeToggle<CR>

" Split window
nmap <leader>b :split<Return><C-w>w
nmap <leader>v :vsplit<Return><C-w>w

" Move window
map <leader>h <C-w>h
map <leader>k <C-w>k
map <leader>j <C-w>j
map <leader>l <C-w>l

" Move Line Up and Down
nnoremap <C-j> :move +1<CR>
nnoremap <C-K> :move -2<CR>
xnoremap K :move '>-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

nnoremap <silent> <Leader>t :TagbarToggle<CR>

" Symbol-based navigation
nnoremap ,t :tjump /
nnoremap ,i [I
nnoremap ,d [D
" }}}

 " Custom Functions {{{
 
" MyNext() and MyPrev(): Movement between tabs OR buffers {{{
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction
" }}}

" }}}

