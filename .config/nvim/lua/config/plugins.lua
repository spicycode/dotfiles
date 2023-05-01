-- Setup lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  defaults = { version = "*" },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  { "catppuccin/nvim",                  name = "catppuccin" },
  { "tpope/vim-vinegar" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rsi" },
  { "tpope/vim-git" },
  { "tpope/vim-sensible" },
  { "tpope/vim-commentary" },
  -- Color and Themes
  -- Highlight CSS Colors
  { "norcalli/nvim-colorizer.lua" },
  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  { "neovim/nvim-lspconfig" },
  {
    'glepnir/lspsaga.nvim',
    event = 'BufRead',
    config = function()
      require('lspsaga').setup({
        ui = {
          colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
      })
    end
  },
  { "onsails/lspkind-nvim" },
  { "j-hui/fidget.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "petertriho/cmp-git" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-path" },
  { "ckipp01/stylua-nvim" },
  -- Language Syntax/etc support
  { "euclidianAce/BetterLua.vim" },
  { "vim-ruby/vim-ruby" },
  { "tpope/vim-rails" },
  -- Search
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  -- Extension for telescope coauthor support
  { "cwebster2/github-coauthors.nvim" },
  -- Registers
  { "junegunn/vim-peekaboo" },
  -- Highlights
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
  { "jparise/vim-graphql" },
  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  { "jremmen/vim-ripgrep" },
  { "kyazdani42/nvim-web-devicons" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    }
  },
  { "mcauley-penney/tidy.nvim", event = "BufWritePre" },
  {
    "pwntester/octo.nvim",
    config = function()
      require "octo".setup()
    end,
    cmd = "Octo"
  },
  -- Tab Bar
  { "nanozuki/tabby.nvim" },
  { "nicwest/vim-camelsnek" },
  -- Navigate between neovim and multiplexer
  {
    'numToStr/Navigator.nvim',
    config = function()
      require('Navigator').setup()
    end
  },
  {
    "james1236/backseat.nvim",
    config = function()
      require("backseat").setup({
        openai_model_id = 'gpt-3.5-turbo', --gpt-4 (If you do not have access to a model, it says "The model does not exist")
        split_threshold = 100,
        -- additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
        highlight = {
          icon = '', -- ''
          group = 'Comment',
        }
      })
    end
  },
  {
    'willothy/wezterm.nvim',
    config = true
  },
  {
    "L3MON4D3/LuaSnip"
  },
  {
    "saadparwaiz1/cmp_luasnip"
  }
})
