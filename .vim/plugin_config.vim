" RubyAndRails:
" Highlight ruby operators
let ruby_operators = 1
let g:ruby_heredoc_syntax_filetypes = {
        \ "graphql" : {
        \   "start" : "GRAPHQL",
        \},
  \}


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

""" Bgtags:
" Allow vendor/internal-gems but not anything else in vendor.
" Generate ctags in parallel. Sorting doesn't matter, since this is
" shuffling the tags file anyway and I've set notagbsearch.
" Use ripper-tags for ruby, gotags for go.
let g:bgtags_user_commands = {
  \ 'directories': {
    \ '.git': [
      \ 'git ls-files -c -o --exclude-standard '':^*.rb'' '':^*.rake'' '':^*.go'' '':^*.git'' | ' .
        \ 'egrep -v ''^vendor/[^i][^n][^t]'' | ' .
        \ 'parallel -j200\% -N 500 --pipe ''ctags -L - -f -'' > tags',
      \ 'eval "$(rbenv init -)" && rbenv shell $(rbenv global) && ' .
        \ 'git ls-files -c -o --exclude-standard ''*.rb'' ''*.rake'' | ' .
        \ 'egrep -v ''^vendor/[^i][^n][^t]'' | ' .
        \ 'parallel -X -L200 ''ripper-tags -f - {}'' >> tags',
      \ 'git ls-files -c -o --exclude-standard ''*.go'' | ' .
        \ 'parallel -X -L200 ''gotags -f - {}'' >> tags'
      \ ],
    \ 'default': 'ctags -R'
    \ },
  \ 'filetypes': {
    \ 'ruby': 'eval "$(rbenv init -)" && rbenv shell $(rbenv global) && ' .
        \ 'ripper-tags -f -',
    \ 'go': 'gotags -f -',
    \ 'default': 'ctags -f-'
    \}
\ }


""" Vim-markdown:
let g:markdown_fenced_languages=['css', 'sass', 'ruby', 'erb=eruby', 'javascript', 'html', 'sh', 'xml', 'sql']

""" Go:
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:go_autodetect_gopath = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"
