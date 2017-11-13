" RubyAndRails:
" Highlight ruby operators
let ruby_operators = 1

" Turn off rails bits of statusbar
let g:rails_statusline=0

" Screen IMPL
let g:ScreenImpl = 'Tmux'

" RubyFold:
let g:ruby_fold_lines_limit = 500

" Use Deoplete:
let g:deoplete#enable_at_startup = 1

let g:elm_format_autosave = 1

" Markdown:
let g:markdown_fenced_languages=['css', 'sass', 'ruby', 'erb=eruby', 'javascript', 'html', 'sh', 'xml', 'sql']

" Go:
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:go_autodetect_gopath = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

" LightLine:

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ 
      \              [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }

" Completor:
let g:completor_auto_trigger = 0
inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
