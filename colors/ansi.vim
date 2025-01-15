" Clear highlights and reset syntax
highlight clear
if exists('syntax on')
	syntax reset
endif
let g:colors_name = 'ansi'

highlight LineNr cterm=NONE ctermfg=darkgrey ctermbg=NONE
highlight CursorLine cterm=NONE ctermbg=black
highlight CursorLineNr cterm=NONE ctermfg=darkyellow ctermbg=NONE

highlight StatusLineNC cterm=NONE ctermbg=black ctermfg=darkgrey
highlight StatusLine cterm=NONE ctermbg=darkcyan ctermfg=NONE

" popup menu basics
highlight Pmenu cterm=NONE ctermbg=darkmagenta
highlight PmenuSel cterm=NONE ctermbg=darkgrey

" popup menu scroll bar
highlight PmenuSbar cterm=NONE ctermbg=darkgrey
highlight PmenuThumb cterm=NONE ctermbg=lightgrey

highlight Comment cterm=italic ctermfg=darkgrey
" call the lua function
" lua require("averett").style()

