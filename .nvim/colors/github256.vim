" Vim color file -- with 256 colour support!
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
" Contributors: Lucas Tadeu <lucastadeuteixeira@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

set background=light
hi clear
syntax reset

let colors_name = "github256"

" General colors
hi Normal	      guifg=#333333   guibg=#f7f7f7   gui=none    
hi Cursor       guifg=#F7F7F7   guibg=#444454
hi Visual       guifg=#FFFFFF   guibg=#3465a3
hi VisualNOS    guifg=#FFFFFF   guibg=#204a87
hi Search       guifg=#000000   guibg=#FFFF8C   gui=bold
hi Folded       guifg=#808080   guibg=#ECECEC   gui=bold
hi Title        guifg=#ef5939

hi VertSplit    guifg=#bbbbbb   guibg=#DEDEDE   gui=none 
hi LineNr       guifg=#B3B3B3   guibg=NONE      gui=none
hi SpecialKey   guifg=#177F80                   gui=italic
hi WarningMsg   guifg=#ef5939
hi ErrorMsg     guifg=#ff1100   guibg=#f8f8ff   gui=undercurl
hi ColorColumn                  guibg=#e4e4e4
hi CursorLine                   guibg=#D8D8DD
hi MatchParen   guifg=#000000   guibg=#cdcdfd
hi Pmenu        guifg=#ffffff   guibg=#808080   gui=bold 
hi PmenuSel     guifg=#000000   guibg=#cdcdfd   gui=italic
hi PmenuSbar    guifg=#444444   guibg=#000000
hi PmenuThumb   guifg=#aaaaaa   guibg=#aaaaaa

" Diff highlighting:
hi DiffAdd      guifg=#003300   guibg=#DDFFDD   gui=none 
hi DiffChange                   guibg=#ECECEC   gui=none
hi DiffText     guifg=#000033   guibg=#DDDDFF   gui=none 
hi DiffDelete   guifg=#DDCCCC   guibg=#FFDDDD   gui=none

" Syntax highlighting:
hi Ignore       guifg=#808080
hi Identifier   guifg=#0086B3
hi PreProc      guifg=#333333   gui=bold
hi Comment      guifg=#998998   guibg=NONE      gui=italic   
hi Constant     guifg=#094e99   gui=NONE 
hi String       guifg=#df5000   
hi Function     guifg=#945277                   gui=bold
hi Statement    guifg=#000000   gui=bold 
hi Type         guifg=#445588   gui=bold   
hi Number       guifg=#1C9898   
hi Todo         guifg=#998998   guibg=#f7f7f7   gui=underline 
hi Special      guifg=#159828                   gui=bold   
hi Label        guifg=#000000                   gui=bold    
hi StorageClass guifg=#000000                   gui=bold   
hi Structure    guifg=#000000                   gui=bold  
hi TypeDef      guifg=#000000                   gui=bold 
hi rubySymbol   guifg=#8b467f
hi rubyPseudoVariable   guifg=#0086B3
hi rubyBlockParamater   guifg=#008080
hi rubyInstanceVariable guifg=#008080

" Links:
hi! link FoldColumn     Folded
hi! link CursorColumn   CursorLine
hi! link NonText        LineNr

" Aliases:
hi link cppSTL              Function
hi link cppSTLType          Type
hi link Character           Number
hi link htmlTag             htmlEndTag
hi link htmlLink            Underlined
hi link pythonFunction      Identifier
hi link Question            Type
hi link CursorIM            Cursor
hi link VisualNOS           Visual
hi link xmlTag              Identifier
hi link xmlTagName          Identifier
hi link shDeref             Identifier
hi link shVariable          Function
hi link rubySharpBang       Special
hi link perlSharpBang       Special
hi link schemeFunc          Statement
hi link rubyStringDelimiter String
" hi link rubyComment         Comment

" Tabs:
hi TabLine      guifg=#707070   guibg=#dedede    gui=none
hi TabLineFill  guifg=#707070   guibg=#dedede    gui=none
hi TabLineSel   guifg=#5c5c5c   guibg=NONE       gui=bold

" Spelling:
if has("spell")
    hi spellBad     guisp=#fcaf3e
    hi spellCap     guisp=#73d216
    hi spellRare    guisp=#fcaf3e
    hi spellLocal   guisp=#729fcf
endif

hi StatusLine     guifg=#333333  guibg=#CCEBD6 gui=bold
hi StatusLineNC   guifg=#333333  guibg=#DEDEDE   gui=NONE
au InsertEnter * hi StatusLine   guibg=#ccdc90
au InsertLeave * hi StatusLine   guibg=#ccebd6


