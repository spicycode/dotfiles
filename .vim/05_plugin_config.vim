" Ale:
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" Lightline:
function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:lightline#ale#indicator_warnings = '⚠️  '
let g:lightline#ale#indicator_errors = '🚫 '
let g:lightline#ale#indicator_ok = ''
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


" Screen Implementation:
let g:ScreenImpl = 'Tmux'

" RubyAndRails:
let ruby_operators = 1 " Highlight ruby operators
let g:rails_statusline = 0 " Turn off rails bits of statusbar

" RubyHereDoc:
let g:ruby_heredoc_syntax_filetypes = {
  \ "graphql" : {
  \   "start" : "GRAPHQL",
  \},
  \}

" PythonLand:
let g:pymode_python = 'python3'


" Salesforce:

" Examples:
" let g:apex_backup_folder = expand("$HOME/code/projects/sfdc/backup")
" let g:apex_temp_folder = expand("$HOME/code/projects/sfdc/temp")
" let g:apex_properties_folder = expand("$HOME/code/projects/sfdc/properties")
" let g:apex_tooling_force_dot_com_path = expand("$HOME/code/projects/sfdc/jar")

let g:apex_backup_folder = expand("")
let g:apex_temp_folder = expand("")
let g:apex_properties_folder = expand("")
let g:apex_tooling_force_dot_com_path = expand("")

