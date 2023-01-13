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
  { "tpope/vim-vinegar" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rsi" },
  { "tpope/vim-git" },
  { "tpope/vim-sensible" },
  { "tpope/vim-commentary" },
  -- Color and Themes
  -- Highlight CSS Colors
  { "norcalli/nvim-colorizer.lua" },
  { "shaunsingh/nord.nvim" },
  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    'glepnir/lspsaga.nvim',
    event = 'BufRead',
    config = function()
      require('lspsaga').setup({})
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
  {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    build = ":TSUpdate"
  },

  { "jparise/vim-graphql" },
  { "fladson/vim-kitty" },
  { "knubie/vim-kitty-navigator", build = "cp ./*.py ~/.config/kitty/" },

  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  { "jremmen/vim-ripgrep" },
  { "wincent/pinnacle" },

  -- For luasnip users.
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "kyazdani42/nvim-web-devicons" },
  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
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
})
