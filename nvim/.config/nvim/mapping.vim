" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
let mapleader=","

"" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" Like Vscode
noremap <leader>s :w<CR>
noremap <leader>q :q<CR>
noremap <leader>o :Files<CR>
noremap <leader>p :History<CR>
noremap <leader>f :BLines<CR>
noremap <leader>F :Rg<CR>
noremap <leader>g :GFiles<CR>
noremap <leader>n :vnew<CR>

" Split window
nmap <leader>b :split<Return><C-w>w
nmap <leader>v :vsplit<Return><C-w>w
" Move window
map <leader>h <C-w>h
map <leader>k <C-w>k
map <leader>j <C-w>j
map <leader>l <C-w>l

" Resize window
nnoremap <leader>H <C-w><
nnoremap <leader>L <C-w>>
nnoremap <leader>K <C-w>+
nnoremap <leader>J <C-w>-

" Esc Alternative inoremap jk <Esc>
inoremap kj <Esc>
inoremap jk <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-Tab>:bprevious<CR>

" set paste toggle
set pastetoggle=<leader>v

" TAB indentation
vnoremap <S-TAB> <gv
vnoremap <TAB> >gv

" Move Line Up and Down
nnoremap <C-j> :move +1<CR>
nnoremap <C-K> :move -2<CR>
" Move selected line / block of text in visual mode
xnoremap K :move '>-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" scroll the viewport faster
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>

nnoremap <silent> <Leader>b :TagbarToggle<CR>
