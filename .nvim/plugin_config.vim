" RubyAndRails:
" Highlight ruby operators
let ruby_operators = 1

" Turn off rails bits of statusbar
let g:rails_statusline=0

" Screen IMPL
let g:ScreenImpl = 'Tmux'

set tags=./.tags;,./tags

" Neocompletioncache:

" Disable AutoComplPop.

" Disable the automatic completion
let g:neocomplcache_disable_auto_complete = 1

let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
" let g:neocomplcache_force_overwrite_completefunc = 1

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}


" CtrlP:

" Silver surfer time
let g:ctrlp_cache_dir = '/tmp/ctrlp'
 
let g:ctrlp_user_command = 'ag %s --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 1

" Open files in existing buffers, ctrl-t opens in new tab
let g:ctrlp_switch_buffer = 'ET'

" let g:ctrlp_regexp = 1
