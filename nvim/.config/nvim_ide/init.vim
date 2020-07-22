source $HOME/.config/nvim/plug-config/plugins.vim
source $HOME/.config/nvim/plug-config/theme.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/coc.vim
" ============================================================================ "
" ===                           GENERAL OPTIONS                            === "
" ============================================================================ "
" Appearence
set number                              " Line numbers
set relativenumber                      " Relative Line numbers
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set cursorline                          " Enable highlighting of the current line
set ruler              			            " Show the cursor position all the time
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

" g is for Git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" c is for Coc
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

let g:which_key_map['s'] = [ ':w'                        , 'Save' ]
let g:which_key_map['q'] = [ ':q'                        , 'Quit' ]
let g:which_key_map['w'] = [ ':bw'                       , 'Close Tab' ]
let g:which_key_map['r'] = [ ':source %'                 , 'Reload' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'      , 'Explorer']
let g:which_key_map['S'] = [ ':Startify'                 , 'start screen' ]
let g:which_key_map['C'] = [ ':set hlsearch! hlsearch?'  , 'Clear search' ]
noremap <leader>C :set hlsearch! hlsearch?<cr>
" Register which key map
call which_key#register('<Space>', "g:which_key_map")

" ============================================================================ "
" ===                             Plug Config                              === "
" ============================================================================ "

" ==========            Startify               ============== "
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Files at '. getcwd()] },
          \  { 'type': function('helpers#startify#listcommits'), 'header': [ '   Recent Commits' ] },
          \ { 'type': 'files',     'header': ['   History']                        },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'd': '~/dev'},
            \ { 'g': '~/Google\ Drive'},
            \ ]

let g:startfy_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction


autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif 
source $HOME/.config/nvim/plug-config/statusline.vim
