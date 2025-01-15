" Clear highlights and reset syntax
highlight clear
if exists('syntax on')
	syntax reset
endif
let g:colors_name = 'ansi'

highlight LineNr cterm=NONE ctermfg=darkgrey ctermbg=NONE
highlight CursorLineNr cterm=NONE ctermfg=darkyellow ctermbg=NONE

highlight CursorLine cterm=NONE ctermbg=black

highlight StatusLineNC cterm=NONE ctermbg=black ctermfg=darkgrey
highlight StatusLine cterm=NONE ctermbg=darkcyan

" popup menu basics
highlight Pmenu cterm=NONE ctermbg=darkmagenta
highlight PmenuSel cterm=NONE ctermbg=darkgrey

" popup menu scroll bar
highlight PmenuSbar cterm=NONE ctermbg=darkgrey
highlight PmenuThumb cterm=NONE ctermbg=lightgrey

highlight NormalFloat cterm=NONE ctermbg=black

highlight Visual cterm=NONE ctermbg=lightgrey

highlight @comment cterm=italic ctermfg=darkgrey
highlight @function cterm=NONE ctermfg=lightmagenta
highlight @constant cterm=bold
highlight @keyword cterm=bold ctermfg=lightred
highlight @variable cterm=NONE
highlight @string cterm=NONE ctermfg=darkgreen
" call the lua function
" lua require("averett").style()

