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
Plug 'norcalli/nvim-colorizer.lua'
Plug 'uarun/vim-protobuf'
Plug 'jparise/vim-graphql'

" Python:
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'

" TypeScript:
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript']}

" https://github.com/autozimu/LanguageClient-neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'peitalin/vim-jsx-typescript'

" Erlang And Elixir:
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'avdgaag/vim-phoenix'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'rust-lang/rust.vim'
" Plug 'flowtype/vim-flow'
" Plug 'ElmCast/elm-vim'

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
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" :CocInstall coc-tsserver coc-json coc-html coc-css
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
 
" The Tim Pope section of the VIM config:
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-git'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
 
" Fix autoread 
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'editorconfig/editorconfig-vim'


Plug 'liuchengxu/vista.vim'


call plug#end()

