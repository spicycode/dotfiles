" RubyAndRails:
" Highlight ruby operators
let ruby_operators = 1

" Turn off rails bits of statusbar
let g:rails_statusline=0

" Screen IMPL
let g:ScreenImpl = 'Tmux'

" " <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
" function! s:check_back_space()"{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~ '\s'
" endfunction"}}


" CtrlP:
" ctrl-t opens in new tab
let g:ctrlp_switch_buffer = 'T'

" ==================== CtrlP ====================
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
    \ }
\ }

" CtrlP pymatcher because it's crazy more accurate
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Jump to the tag directly if only 1 found
let g:ctrlp_tjump_only_silent = 1

" TabCompletion:
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}

" RubyFold:
let g:ruby_fold_lines_limit = 500

" Use Deoplete:
let g:deoplete#enable_at_startup = 1

let g:neosnippet#enable_completed_snippet = 1

" Only use stylelint:
let g:neomake_css_enabled_makers = ['stylelint']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_scss_stylelint_maker = {
      \ 'exe': './node_modules/.bin/stylelint',
      \ 'args': ['--syntax', 'scss'],
      \ 'errorformat': 
            \ '%+P%f,' . 
                \ '%*\s%l:%c  %t  %m,' .
            \ '%-Q'
            \ }
let g:neomake_error_sign = {
      \ 'text': '👺'
      \ }

let g:neomake_javascript_enabled_makers = ['eslint']
let b:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'

let g:elm_format_autosave = 1

