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

nnoremap <leader>f :CtrlPagLocate 
vnoremap <leader>f :CtrlPagVisual<cr>
" nnoremap <c-f> :CtrlPag<cr>
" vnoremap <c-f> :CtrlPagVisual<cr>
" nnoremap <leader>ca :CtrlPagLocate
" nnoremap <leader>cp :CtrlPagPrevious<cr>

" Close buffers
nmap <leader>q :Bclose<CR>
nmap <leader>b :bd<CR>

nnoremap <leader>lc :CtrlP<cr>
nnoremap <leader>lf :CtrlP<cr>
nnoremap <leader>lb :CtrlPBuffer<cr>
nnoremap <leader>lt :CtrlPTag<cr>
nnoremap <C-l> :CtrlPMRUFiles<CR>

nnoremap K :CtrlPag <C-R><C-W><CR>

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

" Use ctrlptjump for tags
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
