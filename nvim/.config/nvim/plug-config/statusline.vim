" ====================================================================
" Make sure to:
" 1. source this file somewhere at the bottom of your config.
" 2. disable any statusline plugins, as they will override this.
" ====================================================================

" Do not show mode under the statusline since the statusline itself changes
" color depending on mode
set noshowmode
" ~~~~ Statusline configuration ~~~~
" ':help statusline' is your friend!
function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineAccent guifg=#56687E guibg=NONE
    hi MyStatuslineFilename guifg=#92B6F4 guibg=#3D4C5F
    hi MyStatuslineAccentBody guibg=#56687E guifg=#92B6F4
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineAccent guifg=#56687E guibg=NONE
    hi MyStatuslineFilename guifg=#F48FB1 guibg=#3D4C5F
    hi MyStatuslineAccentBody guibg=#56687E guifg=#F48FB1
  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineAccent guifg=#56687E guibg=NONE
    hi MyStatuslineFilename guifg=#F1FA8C guibg=#3D4C5F
    hi MyStatuslineAccentBody guibg=#56687E guifg=#F1FA8C
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineAccent guifg=#56687E guibg=NONE
    hi MyStatuslineFilename guifg=#BD99FF guibg=#3D4C5F
    hi MyStatuslineAccentBody guibg=#56687E guifg=#BD99FF
  " Command mode
  elseif a:mode == 'c'
    hi MyStatuslineAccent guifg=#56687E guibg=NONE
    hi MyStatuslineFilename guifg=#87DFEB guibg=#3D4C5F
    hi MyStatuslineAccentBody guibg=#56687E guifg=#87DFEB
  " Terminal mode
  elseif a:mode == 't'
    hi MyStatuslineAccent guifg=#56687E guibg=NONE
    hi MyStatuslineFilename guifg=#F48FB1 guibg=#3D4C5F
    hi MyStatuslineAccentBody guibg=#56687E guifg=#F48FB1
  endif
  " Return empty string so as not to display anything in the statusline return ''
endfunction
" }}}
function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi MyStatuslineModifiedBody guibg=#3D4C5F cterm=bold guifg=#F48FB1
    else
        hi MyStatuslineModifiedBody guibg=#3D4C5F cterm=bold guifg=#56687E
    endif
    return '●'
endfunction
" }}}
function! SetFiletype(filetype) " {{{
  if a:filetype == ''
      return '-'
  else
      return a:filetype
  endif
endfunction
" }}}

function!Gitbranchname()
  if empty(FugitiveHead())

hi MyStatuslineGit  guifg=none     guibg=NONE    
    hi MyStatuslineGitBody guifg=none guibg=none 
    hi MyStatuslineGit guifg=#30323E guibg=none 
    return ''
  endif
    hi MyStatuslineGitBody guifg=#EC5F67 guibg=#3D4C5F
    hi MyStatuslineGit guifg=#3D4C5F guibg=none
  return ' '.FugitiveHead()
endfunction

" Statusbar items
" ====================================================================

" This will not be displayed, but the function RedrawModeColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=
set statusline=%{RedrawModeColors(mode())}
" Left side items
" =======================
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentBody#\ 
" Filename
set statusline+=%#MyStatuslineFilename#\ %.t
set statusline+=%#MyStatuslineSeparator#\ 
" Modified status
set statusline+=%#MyStatuslineModified#
set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}
set statusline+=%#MyStatuslineModified#
set statusline+=\ 
" Git Status
set statusline+=%#MyStatuslineGit#
set statusline+=%#MyStatuslineGitBody#\ %{Gitbranchname()}
set statusline+=%#MyStatuslineGit#
" Right side items
" =======================
set statusline+=%=
" Line and Column
set statusline+=%#MyStatuslineLineCol#
set statusline+=%#MyStatuslineLineColBody#%2l
set statusline+=\/%#MyStatuslineLineColBody#%2c
set statusline+=%#MyStatuslineLineCol#
" Padding
set statusline+=\ 
" Current scroll percentage and total lines of the file
set statusline+=%#MyStatuslinePercentage#
set statusline+=%#MyStatuslinePercentageBody#%P
set statusline+=\/\%#MyStatuslinePercentageBody#%L
set statusline+=%#MyStatuslinePercentage#
" Padding
set statusline+=\ 
" Filetype
set statusline+=%#MyStatuslineFiletype#
set statusline+=%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}
set statusline+=%#MyStatuslineFiletype#

" Setup the colors
hi StatusLine          guifg=#30323E     guibg=NONE    
hi StatusLineNC        guifg=#30323E    guibg=NONE     cterm=bold

hi MyStatuslineSeparator guifg=#3D4C5F guibg=NONE

hi MyStatuslineModified guifg=#3D4C5F guibg=NONE

hi MyStatuslineFiletype guibg=NONE guifg=#3D4C5F
hi MyStatuslineFiletypeBody guifg=#BD99FF guibg=#3D4C5F cterm=italic gui=italic

hi MyStatuslinePercentage guifg=#3D4C5F guibg=NONE
hi MyStatuslinePercentageBody guibg=#3D4C5F guifg=#87DFEB

hi MyStatuslineLineCol guifg=#3D4C5F guibg=NONE
hi MyStatuslineLineColBody guibg=#3D4C5F guifg=#A1EFD3
