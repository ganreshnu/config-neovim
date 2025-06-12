" Store the following config under ~/.vim/colors/root-loops.vim
" then load it into vim via ':colorscheme root-loops' or by declaring
" it as your colorscheme in your .vimrc.

" root-loops.vim -- Root Loops Vim Color Scheme.
" Webpage:          https://rootloops.sh?sugar=6&colors=6&sogginess=0&flavor=1&fruit=10&milk=0
" Description:      A vim color scheme for cereal lovers

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "root loops"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    hi NonText ctermfg=0 guifg=#222222
    hi Comment ctermfg=8 cterm=italic guifg=#525252 gui=italic
    hi Constant ctermfg=3 guifg=#a47c40
    hi Error ctermfg=1 guifg=#c65f6a
    hi Identifier ctermfg=9 guifg=#d97780
    hi Function ctermfg=4 guifg=#5386c7
    hi Special ctermfg=13 guifg=#b77ed1
    hi Statement ctermfg=5 guifg=#a466bf
    hi String ctermfg=2 guifg=#689250
    hi Operator ctermfg=6 guifg=#439292
    hi Boolean ctermfg=3 guifg=#a47c40
    hi Label ctermfg=14 guifg=#52a9a9
    hi Keyword ctermfg=5 guifg=#a466bf
    hi Exception ctermfg=5 guifg=#a466bf
    hi Conditional ctermfg=5 guifg=#a466bf
    hi PreProc ctermfg=13 guifg=#b77ed1
    hi Include ctermfg=5 guifg=#a466bf
    hi Macro ctermfg=5 guifg=#a466bf
    hi StorageClass ctermfg=11 guifg=#bc904f
    hi Structure ctermfg=11 guifg=#bc904f
    hi Todo ctermbg=12 ctermfg=0 cterm=bold guibg=#6b9bd9 guifg=#080808 gui=bold
    hi Type ctermfg=11 guifg=#bc904f
    hi Underlined cterm=underline gui=underline
    hi Bold cterm=bold gui=bold
    hi Italic cterm=italic gui=italic
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi StatusLine ctermbg=0 ctermfg=15 cterm=NONE guibg=#222222 guifg=#e2e2e2 gui=NONE
    hi StatusLineNC ctermbg=0 ctermfg=15 cterm=NONE guibg=#080808 guifg=#f1f1f1 gui=NONE
    hi VertSplit ctermfg=8 guifg=#525252
    hi TabLine ctermbg=0 ctermfg=7 guibg=#222222 guifg=#b9b9b9
    hi TabLineFill ctermbg=NONE ctermfg=0 guibg=NONE guifg=#222222
    hi TabLineSel ctermbg=11 ctermfg=0 guibg=#bc904f guifg=#222222
    hi Title ctermfg=4 cterm=bold guifg=#5386c7 gui=bold
    hi CursorLine ctermbg=0 ctermfg=NONE guibg=#222222 guifg=NONE
    hi Cursor ctermbg=15 ctermfg=0 guibg=#e2e2e2 guifg=#080808
    hi CursorColumn ctermbg=0 guibg=#222222
    hi LineNr ctermfg=8 guifg=#525252
    hi CursorLineNr ctermfg=6 guifg=#439292
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    hi Visual ctermbg=8 ctermfg=15 cterm=bold guibg=#525252 guifg=#e2e2e2 gui=bold
    hi VisualNOS ctermbg=8 ctermfg=15 cterm=bold guibg=#525252 guifg=#e2e2e2 gui=bold
    hi Pmenu ctermbg=0 ctermfg=15 guibg=#222222 guifg=#e2e2e2
    hi PmenuSbar ctermbg=8 ctermfg=7 guibg=#525252 guifg=#b9b9b9
    hi PmenuSel ctermbg=8 ctermfg=15 cterm=bold guibg=#525252 guifg=#e2e2e2 gui=bold
    hi PmenuThumb ctermbg=7 ctermfg=NONE guibg=#b9b9b9 guifg=NONE
    hi FoldColumn ctermfg=7 guifg=#b9b9b9
    hi Folded ctermfg=12 guifg=#6b9bd9
    hi WildMenu ctermbg=0 ctermfg=15 cterm=NONE guibg=#222222 guifg=#e2e2e2 gui=NONE
    hi SpecialKey ctermfg=0 guifg=#222222
    hi IncSearch ctermbg=1 ctermfg=0 guibg=#c65f6a guifg=#080808
    hi CurSearch ctermbg=3 ctermfg=0 guibg=#a47c40 guifg=#080808
    hi Search ctermbg=11 ctermfg=0 guibg=#bc904f guifg=#080808
    hi Directory ctermfg=4 guifg=#5386c7
    hi MatchParen ctermbg=0 ctermfg=3 cterm=bold guibg=#222222 guifg=#a47c40 gui=bold
    hi SpellBad cterm=undercurl gui=undercurl guisp=#d97780
    hi SpellCap cterm=undercurl gui=undercurl guisp=#bc904f
    hi SpellLocal cterm=undercurl gui=undercurl guisp=#6b9bd9
    hi SpellRare cterm=undercurl gui=undercurl guisp=#7aa860
    hi ColorColumn ctermbg=8 guibg=#525252
    hi SignColumn ctermfg=7 guifg=#b9b9b9
    hi ModeMsg ctermbg=15 ctermfg=0 cterm=bold guibg=#f1f1f1 guifg=#222222 gui=bold
    hi MoreMsg ctermfg=4 guifg=#5386c7
    hi Question ctermfg=4 guifg=#5386c7
    hi QuickFixLine ctermbg=0 ctermfg=14 guibg=#222222 guifg=#52a9a9
    hi Conceal ctermfg=8 guifg=#525252
    hi ToolbarLine ctermbg=0 ctermfg=15 guibg=#222222 guifg=#f1f1f1
    hi ToolbarButton ctermbg=8 ctermfg=15 guibg=#525252 guifg=#f1f1f1
    hi debugPC ctermfg=7 guifg=#b9b9b9
    hi debugBreakpoint ctermfg=8 guifg=#525252
    hi ErrorMsg ctermfg=1 cterm=bold,italic guifg=#c65f6a gui=bold,italic
    hi WarningMsg ctermfg=11 guifg=#bc904f
    hi DiffAdd ctermbg=10 ctermfg=0 guibg=#7aa860 guifg=#080808
    hi DiffChange ctermbg=12 ctermfg=0 guibg=#6b9bd9 guifg=#080808
    hi DiffDelete ctermbg=9 ctermfg=0 guibg=#d97780 guifg=#080808
    hi DiffText ctermbg=14 ctermfg=0 guibg=#52a9a9 guifg=#080808
    hi diffAdded ctermfg=10 guifg=#7aa860
    hi diffRemoved ctermfg=9 guifg=#d97780
    hi diffChanged ctermfg=12 guifg=#6b9bd9
    hi diffOldFile ctermfg=11 guifg=#bc904f
    hi diffNewFile ctermfg=13 guifg=#b77ed1
    hi diffFile ctermfg=12 guifg=#6b9bd9
    hi diffLine ctermfg=7 guifg=#b9b9b9
    hi diffIndexLine ctermfg=14 guifg=#52a9a9

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16
    hi Normal ctermbg=NONE ctermfg=NONE
    hi NonText ctermfg=0
    hi Comment ctermfg=8 cterm=italic
    hi Constant ctermfg=3
    hi Error ctermfg=1
    hi Identifier ctermfg=9
    hi Function ctermfg=4
    hi Special ctermfg=13
    hi Statement ctermfg=5
    hi String ctermfg=2
    hi Operator ctermfg=6
    hi Boolean ctermfg=3
    hi Label ctermfg=14
    hi Keyword ctermfg=5
    hi Exception ctermfg=5
    hi Conditional ctermfg=5
    hi PreProc ctermfg=13
    hi Include ctermfg=5
    hi Macro ctermfg=5
    hi StorageClass ctermfg=11
    hi Structure ctermfg=11
    hi Todo ctermbg=12 ctermfg=0 cterm=bold
    hi Type ctermfg=11
    hi Underlined cterm=underline
    hi Bold cterm=bold
    hi Italic cterm=italic
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE
    hi StatusLine ctermbg=0 ctermfg=15 cterm=NONE
    hi StatusLineNC ctermbg=0 ctermfg=15 cterm=NONE
    hi VertSplit ctermfg=8
    hi TabLine ctermbg=0 ctermfg=7
    hi TabLineFill ctermbg=NONE ctermfg=0
    hi TabLineSel ctermbg=11 ctermfg=0
    hi Title ctermfg=4 cterm=bold
    hi CursorLine ctermbg=0 ctermfg=NONE
    hi Cursor ctermbg=15 ctermfg=0
    hi CursorColumn ctermbg=0
    hi LineNr ctermfg=8
    hi CursorLineNr ctermfg=6
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE
    hi Visual ctermbg=8 ctermfg=15 cterm=bold
    hi VisualNOS ctermbg=8 ctermfg=15 cterm=bold
    hi Pmenu ctermbg=0 ctermfg=15
    hi PmenuSbar ctermbg=8 ctermfg=7
    hi PmenuSel ctermbg=8 ctermfg=15 cterm=bold
    hi PmenuThumb ctermbg=7 ctermfg=NONE
    hi FoldColumn ctermfg=7
    hi Folded ctermfg=12
    hi WildMenu ctermbg=0 ctermfg=15 cterm=NONE
    hi SpecialKey ctermfg=0
    hi IncSearch ctermbg=1 ctermfg=0
    hi CurSearch ctermbg=3 ctermfg=0
    hi Search ctermbg=11 ctermfg=0
    hi Directory ctermfg=4
    hi MatchParen ctermbg=0 ctermfg=3 cterm=bold
    hi SpellBad cterm=undercurl
    hi SpellCap cterm=undercurl
    hi SpellLocal cterm=undercurl
    hi SpellRare cterm=undercurl
    hi ColorColumn ctermbg=8
    hi SignColumn ctermfg=7
    hi ModeMsg ctermbg=15 ctermfg=0 cterm=bold
    hi MoreMsg ctermfg=4
    hi Question ctermfg=4
    hi QuickFixLine ctermbg=0 ctermfg=14
    hi Conceal ctermfg=8
    hi ToolbarLine ctermbg=0 ctermfg=15
    hi ToolbarButton ctermbg=8 ctermfg=15
    hi debugPC ctermfg=7
    hi debugBreakpoint ctermfg=8
    hi ErrorMsg ctermfg=1 cterm=bold,italic
    hi WarningMsg ctermfg=11
    hi DiffAdd ctermbg=10 ctermfg=0
    hi DiffChange ctermbg=12 ctermfg=0
    hi DiffDelete ctermbg=9 ctermfg=0
    hi DiffText ctermbg=14 ctermfg=0
    hi diffAdded ctermfg=10
    hi diffRemoved ctermfg=9
    hi diffChanged ctermfg=12
    hi diffOldFile ctermfg=11
    hi diffNewFile ctermfg=13
    hi diffFile ctermfg=12
    hi diffLine ctermfg=7
    hi diffIndexLine ctermfg=14
endif

hi link EndOfBuffer NonText
hi link SpecialComment Special
hi link Define PreProc
hi link PreCondit PreProc
hi link Number Constant
hi link Float Number
hi link Typedef Type
hi link SpecialChar Special
hi link Debug Special
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link WinSeparator VertSplit
hi link WinBar StatusLine
hi link WinBarNC StatusLineNC
hi link lCursor Cursor
hi link CursorIM Cursor
hi link Terminal Normal

if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = [ '#222222', '#c65f6a', '#689250', '#a47c40', '#5386c7', '#a466bf', '#439292', '#b9b9b9', '#525252', '#d97780', '#7aa860', '#bc904f', '#6b9bd9', '#b77ed1', '#52a9a9', '#f1f1f1' ]
endif

