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

  {
    'mrjones2014/legendary.nvim',
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    dependencies = { 'kkharji/sqlite.lua' }
  },

  -- Color themes
  { "catppuccin/nvim",   name = "catppuccin" },

  { "tpope/vim-vinegar" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rsi" },
  { "tpope/vim-git" },
  { "tpope/vim-sensible" },

  -- Color and Themes
  --
  -- Highlight CSS Colors
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },

  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require('hover.providers.gh')
          require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.dap')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = 'single'
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
        mouse_providers = {
          'LSP'
        },
        mouse_delay = 1000
      }
      -- Enable mouse move events so we can bind to them for this
      vim.o.mousemoveevent = true
    end
  },

  --   keys = {
  --     {
  --             "K",
  --     function()
  --       require("hover").hover
  --     end,
  --     desc = "Show hover documentation"
  --     },
  --     {
  --             "gK",
  --     function()
  --             require("hover").hover_select
  --     end,
  --     desc = "Select hover documentation"
  --     },

  -- SchemaStore support for jsonls
  { "b0o/schemastore.nvim" },

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
    end,
    keys = {
      { "gh",         "<cmd>Lspsaga lsp_finder<CR>",            desc = "Find symbol definition (lsp)" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "v",                                  desc = "Show code actions (lsp)" },
      { "gr",         "<cmd>Lspsaga rename<CR>",                desc = "Rename (lsp)" },
      { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics (lsp)" },
      { "<leader>o",  "<cmd>Lspsaga outline<CR>",               desc = "Show outline (lsp)" },
    }
  },
  { "j-hui/fidget.nvim",                  tag = 'legacy' },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "petertriho/cmp-git" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-path" },
  { "ckipp01/stylua-nvim" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },

  -- Language Syntax/etc support
  { "vim-ruby/vim-ruby" },
  { "tpope/vim-rails" },
  { "gleam-lang/gleam.vim" },
  { 'dmmulroy/ts-error-translator.nvim' },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Search
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-p>",      "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<C-]>",      "<cmd>Telescope tags<CR>",       desc = "Find tags" },
      { "<leader>lb", "<cmd>Telescope buffers<CR>",    desc = "Find buffers" },
      { "<leader>lt", "<cmd>Telescope help_tags<CR>",  desc = "Find help tags" },
      { "<leader>lg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
    }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  -- Extension for telescope coauthor support
  {
    "cwebster2/github-coauthors.nvim",
    keys = {
      { "<leader>co", "<CMD>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>", desc = "Find git coauthor" }
    }
  },
  -- Highlights
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "jparise/vim-graphql" },
  {
    "folke/trouble.nvim",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {},
  },
  {
    "jremmen/vim-ripgrep",
    keys = {
      { "<leader>f", ":Rg ", desc = "Find with ripgrep" }
    }
  },
  { "kyazdani42/nvim-web-devicons" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    }
  },
  { "mcauley-penney/tidy.nvim",    event = "BufWritePre" },
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
  {
    "letieu/wezterm-move.nvim",
    keys = { -- Lazy loading, don't need call setup() function
      { "<C-h>", function() require("wezterm-move").move "h" end },
      { "<C-j>", function() require("wezterm-move").move "j" end },
      { "<C-k>", function() require("wezterm-move").move "k" end },
      { "<C-l>", function() require("wezterm-move").move "l" end },
    },
  }
})
