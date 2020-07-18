set termguicolors
syntax enable
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme oceanicnext
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermfg=NONE guibg=NONE
hi SignColumn ctermfg=NONE guibg=NONE
hi StatusLine guifg=#16252b guibg=#6699CC
hi StatusLineNC guifg=#16252b guibg=#16252b
hi VertSplit gui=NONE guifg=#17252c guibg=NONE
hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#17252c

" === Vim Lighline ==== "
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
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
let g:lightline#bufferline#enable_devicons  = 1
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
