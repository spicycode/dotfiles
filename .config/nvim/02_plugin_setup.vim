call plug#begin('~/.config/nvim/plugged')

" NetRW Extensions:
Plug 'tpope/vim-vinegar'

" Color Schemes:
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'fenetikm/falcon'

" Syntax Extensions:
Plug 'Shougo/echodoc.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'kewah/vim-stylefmt'
Plug 'fatih/vim-nginx'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
Plug 'JulesWang/css.vim'
Plug 'ap/vim-css-color'
Plug 'uarun/vim-protobuf'
Plug 'jparise/vim-graphql'

" TypeScript:
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript']}

" https://github.com/autozimu/LanguageClient-neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
Plug 'peitalin/vim-jsx-typescript'

" GoLang:
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

" Erlang And Elixir:
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'avdgaag/vim-phoenix'

" Plug 'rust-lang/rust.vim'
" Plug 'flowtype/vim-flow'
" Plug 'ElmCast/elm-vim'

" Show Git Status In Gutter:
Plug 'airblade/vim-gitgutter'
 
" Enable Fancy TMUX Navigation:
Plug 'christoomey/vim-tmux-navigator'
 
" Linter:
Plug 'w0rp/ale'
 
" StatusBar:
Plug 'itchyny/lightline.vim'
Plug 'yarisgutierrez/ayu-lightline'
Plug 'maximbaz/lightline-ale'

" Finding: 
Plug 'jremmen/vim-ripgrep'
 
" AutoCompletion:
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
 
" The Tim Pope section of the VIM config:
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-git'
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
" Plug 'tpope/vim-surround'
 
" Fix autoread 
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'editorconfig/editorconfig-vim'

call plug#end()
