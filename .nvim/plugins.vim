call plug#begin('~/.nvim/plugged')

" NetRW Extensions:
Plug 'tpope/vim-vinegar'

" Color Schemes:
Plug 'chriskempson/base16-vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'whatyouhide/vim-gotham'

" Syntax Extensions:
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-ruby/vim-ruby'

" Enable Fancy TMUX Navigation:
Plug 'christoomey/vim-tmux-navigator'

" Graphical Undo Visualization:
Plug 'sjl/gundo.vim'

" The Silver Surfer: 
Plug 'rking/ag.vim'

" Close Buffers Keeping Panes Open:
Plug 'vadimr/bclose.vim'

" Change 1.8 -> 1.9 Hash Syntax:
Plug 'ck3g/vim-change-hash-syntax'

" RuboCop -> Quickfix (I like this better than always on syntastic):
Plug 'ngmy/vim-rubocop'

" Current function info for status bar
Plug 'vim-scripts/current-func-info.vim'

" Fuzzy Finding:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }

" AutoCompletion:
Plug 'Shougo/neocomplcache.vim'

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

Plug 'gerw/vim-HiLinkTrace'

" Fix autoread 
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()
