call plug#begin('~/.nvim/plugged')

" Color Schemes:
Plug 'noahfrederick/vim-hemisu'
Plug 'whatyouhide/vim-gotham'

" For Debugging Color Schemes:
Plug 'gerw/vim-HiLinkTrace'

" Language And Better Syntax Support:
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'wting/rust.vim'

" NetRW extensions:
Plug 'tpope/vim-vinegar'

" Enable fancy tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" RuboCop -> Quickfix (I like this better than always on syntastic):
Plug 'ngmy/vim-rubocop'

" Current function info for status bar
Plug 'vim-scripts/current-func-info.vim'

" The Silver Surfer: 
Plug 'rking/ag.vim'

" Close Buffers Keeping Panes Open:
Plug 'vadimr/bclose.vim'

" The Tim Pope section of the VIM config:
Plug 'tpope/vim-git'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'


" Fuzzy Finding:
Plug 'ctrlpvim/ctrlp.vim'

" AutoCompletion:
Plug 'Shougo/neocomplcache.vim'

call plug#end()
