" =============================================================================
" Filename: autoload/lightline/colorscheme/ayu.vim
" Author: yarisgutierrez
" License: MIT License
" Last Change: April 04, 2018, 10:10AM.
" =============================================================================
" ayu mirage theme
let s:black     = [ '#212733', 234 ]
let s:darkgray  = [ '#272d38', 236 ]
let s:gray      = [ '#303540', 242 ]
let s:text      = [ '#d9d7ce', 253 ]
let s:white     = [ '#c7c7c7', 251 ]
let s:blue      = [ '#5ccfe6', 75 ]
let s:cyan      = [ '#95e6cb', 116 ]
let s:green     = [ '#bae67e', 150 ]
let s:orange    = [ '#ffa759', 220 ]
let s:purple    = [ '#d4bfff', 183 ]
let s:red       = [ '#ff3333', 210 ]
let s:yellow    = [ '#ffdf80', 222 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:text, s:darkgray ], [ s:text, s:gray ] ]
let s:p.normal.right    = [ [ s:black, s:orange ], [ s:text, s:darkgray ] ]
let s:p.normal.middle   = [ [ s:green, s:black ] ]
let s:p.normal.error    = [ [ s:red, s:darkgray, 'bold' ] ]
let s:p.normal.warning  = [ [ s:yellow, s:darkgray, 'bold' ] ]

let s:p.normal.right    = [ [ s:text, s:darkgray, 'bold' ], [s:text, s:gray] ]

let s:p.insert.left     = [ [ s:black, s:blue ], [ s:white, s:gray ] ]
let s:p.replace.left    = [ [ s:text, s:red ], [ s:white, s:gray ] ]
let s:p.visual.left     = [ [ s:black, s:purple ], [ s:white, s:gray ] ]

let s:p.tabline.left    = [ [ s:text, s:darkgray ] ]
let s:p.tabline.tabsel  = [ [ s:black, s:orange, 'bold' ] ]

let g:lightline#colorscheme#ayu#palette = lightline#colorscheme#flatten(s:p)
