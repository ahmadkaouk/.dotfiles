scriptencoding UTF-8

" [0] Vim Mode."
set statusline+=%{statusline#getMode()}   " Current mode"

" [1] Linter status, error and warnings count with Unicode symbols."
set statusline+=%{repeat('\ ',2)}

" Truncate lines to left if they are too long."
set statusline+=%<

" [2] Relative path to file's directory with trailing '/'."
set statusline+=%{statusline#fileprefix()}

" [3] File name for current buffer."
set statusline+=%t

" [4] FileType Unicode symbol."
set statusline+=%{repeat('\ ',1)}
set statusline+=%{statusline#filetypesymbol()}

" Align all items to right from this point on."
set statusline+=%=

" [5] Show an icon for common options if they are enabled."
set statusline+=%{statusline#spell()}
set statusline+=%{repeat('\ ',2)}

" [6] Line numbers and column numbers in <Line>:<Column> format."
set statusline+=%02l/%02L:%02c
set statusline+=%{repeat('\ ',2)}

" [7] Git HEAD status."
set statusline+=%{statusline#git()}
set statusline+=%{repeat('\ ',2)}

" [8] Show file size"
set statusline+=%{statusline#fileSize()}
set statusline+=%{repeat('\ ',2)}


" [10] COC status diagnostic"
if exists('*statusline#statusDiagnostic')
      set statusline+=%{statusline#statusDiagnostic()}
      set statusline+=%{repeat('\ ',2)}
endif
