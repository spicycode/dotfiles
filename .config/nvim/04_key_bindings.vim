" Map Leader: Reset from \ to ,
let mapleader = ","

" Fix ctrl-h neovim https://github.com/christoomey/vim-tmux-navigator#tmux
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" TABS: Navigation
nmap <leader>tp :tabprevious<CR>
nmap <leader>tn :tabnext<CR>
nmap <leader>te :tabedit 

nnoremap <leader>f :Rg<space>

" Close buffers
nmap <leader>q :Bclose<CR>
nmap <leader>b :bd<CR>

nnoremap K :Rg <C-R><C-W><CR>

" In command-line mode, C-a jumps to beginning (to match C-e)
cnoremap <C-a> <Home>

" yank to system clipboard
map <leader>y "*y

" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=

" Apple+R to run spec in Dispatch
nnoremap <leader>r :Dispatch<CR>
" Run GitHub tests
nnoremap <leader>gr :Dispatch testrb %<CR>

" Let us use jj to esc
imap jj <Esc>

" Map CtrlP to FZF
nnoremap <C-p> :FZF<CR>

" Make jump to tag open up FZF
nnoremap <c-]> :Tags <c-r><c-w><cr>

nnoremap <leader>lb :Buffers<CR>
nnoremap <leader>lt :Tags<CR>

" Create a search command that uses Ripgrep and offers previews
command! -bang -complete=file -nargs=* Search
  \ call fzf#vim#grep(
  \   'rg --smart-case --vimgrep --no-heading --color=always '.<q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" h/t @keithamus Run a macro over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
