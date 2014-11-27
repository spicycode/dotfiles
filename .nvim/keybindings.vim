" Map Leader: Reset from \ to ,
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" TABS: Navigation
nmap <leader>tp :tabprevious<CR>
nmap <leader>tn :tabnext<CR>
nmap <leader>te :tabedit 

" Ag <leader>f to search
map <leader>f :Ag<Space>

" Close buffers
nmap <leader>q :Bclose<CR>
nmap <leader>b :bd<CR>

nnoremap <leader>lc :CtrlP<cr>
nnoremap <leader>lf :CtrlP<cr>
nnoremap <leader>lb :CtrlPBuffer<cr>
nnoremap <leader>lt :CtrlPTag<cr>

nnoremap K :Ag <C-R><C-W><CR>

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
