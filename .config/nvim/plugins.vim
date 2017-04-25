call plug#begin('~/.config/nvim/plugged')

" NetRW Extensions:
Plug 'tpope/vim-vinegar'

" Color Schemes:
Plug 'chriskempson/base16-vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'whatyouhide/vim-gotham'

" Syntax Extensions:
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'slashmili/alchemist.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'fatih/vim-nginx'
Plug 'vim-ruby/vim-ruby'
Plug 'JulesWang/css.vim'
Plug 'ap/vim-css-color'
Plug 'flowtype/vim-flow'
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Enable Fancy TMUX Navigation:
Plug 'christoomey/vim-tmux-navigator'

" Graphical Undo Visualization:
Plug 'sjl/gundo.vim'

" Show ANSI color coded and hide escape sequences:
Plug 'powerman/vim-plugin-AnsiEsc'

" Enable Neomake:
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

" Finding: 
Plug 'jremmen/vim-ripgrep'

" Current function info for status bar
Plug 'vim-scripts/current-func-info.vim'

" Snippets:
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" VimWiki:
Plug 'vimwiki/vimwiki'

" AutoCompletion:
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" The Tim Pope section of the VIM config:
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-git'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-jdaddy'

Plug 'gerw/vim-HiLinkTrace'
Plug 'godlygeek/tabular'

" Fix autoread 
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()
