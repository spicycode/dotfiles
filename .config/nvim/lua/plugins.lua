local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim' end

  return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-vinegar'

    -- Async building & commands
    use {'tpope/vim-dispatch'}

    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rsi'}
    use {'tpope/vim-git'}
    use {'tpope/vim-sensible'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-rails'}


    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- PACKAGES: 

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'
    use 'folke/trouble.nvim'

    -- Color and Themes
    -- Highlight CSS Colors
    use 'norcalli/nvim-colorizer.lua'
    use 'ayu-theme/ayu-vim'

    -- Language Syntax/etc support
    use 'euclidianAce/BetterLua.vim'
    use 'vim-ruby/vim-ruby'

    use 'vim-erlang/vim-erlang-runtime'
    use 'vim-erlang/vim-erlang-compiler'
    use 'vim-erlang/vim-erlang-omnicomplete'
    use 'elixir-lang/vim-elixir'
    use 'slashmili/alchemist.vim'
    use 'avdgaag/vim-phoenix'

    -- Registers
    -- use 'junegunn/vim-peekaboo'

    -- use {'camspiers/snap', rocks = 'fzy'}

    -- Marks
    -- use {'kshenoy/vim-signature', config = [[require('config.signature')]], disable = true}

    -- Buffer management
    -- use {'mhinz/vim-sayonara', cmd = 'Sayonara'}

    -- Movement
    -- use {'chaoren/vim-wordmotion', 'justinmk/vim-sneak'}

    -- Quickfix
    -- use {'Olical/vim-enmasse', cmd = 'EnMasse'}
    -- use 'kevinhwang91/nvim-bqf'

    -- Indentation tracking
    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- Commenting
    -- use 'tomtom/tcomment_vim'

    -- Wrapping/delimiters
    -- use {
    --   'machakann/vim-sandwich',
    --   {'andymass/vim-matchup', setup = [[require('config.matchup')]], event = 'BufEnter'}
    -- }

    -- Search
    -- use 'romainl/vim-cool'

    -- Prettification
    -- use 'junegunn/vim-easy-align'
    -- use 'mhartington/formatter.nvim'

    -- Text objects
    -- use 'wellle/targets.vim'

    -- Search
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- Undo tree
    --  use {
    --    'mbbill/undotree',
    --    cmd = 'UndotreeToggle',
    --    config = [[vim.g.undotree_SetFocusWhenToggle = 1]]
    --  }

    -- Terminal
    use 'voldikss/vim-floaterm'


    -- Highlights
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor', 'nvim-treesitter/nvim-treesitter-textobjects'
      },
      run = ':TSUpdate'
    }

    -- Just for tracking progess until this is ready for use
    -- use 'mfussenegger/nvim-lint'

    use "hrsh7th/nvim-compe"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    --use {'hrsh7th/vim-vsnip', config = [[require('config.vsnip')]], event = 'InsertEnter *'}

    -- Debugger
    use {'mfussenegger/nvim-dap', opt = true}

    use {
      'puremourning/vimspector',
      setup = [[vim.g.vimspector_enable_mappings = 'HUMAN']],
      disable = true
    }

    -- Path navigation

    -- Profiling
    -- use {'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 10]]}

    -- Plugin development
    -- use 'folke/lua-dev.nvim'
  end)
