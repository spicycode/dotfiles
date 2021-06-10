call plug#begin('~/.vim/plugged')

" Syntax: Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'

" Syntax: GoLang
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

" Syntax: Erlang And Elixir
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'avdgaag/vim-phoenix'

" Syntax: JavaScript And HTML:
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
Plug 'posva/vim-vue'


" Syntax: TypeScript:
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript']}
Plug 'peitalin/vim-jsx-typescript'

" Syntax: CSS and SCSS:
Plug 'JulesWang/css.vim'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'

" Syntax: Protobuf:
Plug 'uarun/vim-protobuf'

" Syntax: GraphQL:
Plug 'jparise/vim-graphql'

" NetRW Extensions:
Plug 'tpope/vim-vinegar'

" StatusBar:
Plug 'itchyny/lightline.vim'
Plug 'Shougo/echodoc.vim' " Echo method signatures in the status bar
Plug 'maximbaz/lightline-ale' " Show ALE status in lightline

" Themes:
Plug 'jacoborus/tender.vim'
Plug 'nanotech/jellybeans.vim'

" Enable Fancy TMUX Navigation:
Plug 'christoomey/vim-tmux-navigator' " Make Ctrl-jkl; navigate tmux panes as well
Plug 'tmux-plugins/vim-tmux-focus-events' " Fix autoread in tmux

" Finding: 
Plug 'watsoncj/vim-ripgrep' 
" Replace with below  when https://github.com/jremmen/vim-ripgrep/pull/28
" merges
" Plug 'jremmen/vim-ripgrep'
 
" AutoCompletion:
Plug 'roxma/nvim-yarp'
Plug '/opt/homebrew/opt/fzf' | Plug 'junegunn/fzf.vim'

" Linting:
Plug 'w0rp/ale'

" Git:
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Editorconfig Support For Vim:
Plug 'editorconfig/editorconfig-vim'

" Sensible Defaults:
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rsi' " Readline style insertion movements

" Fancy Commenting:
Plug 'tpope/vim-commentary'

call plug#end()
