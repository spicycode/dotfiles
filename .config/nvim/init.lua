-- Leader
vim.g.mapleader = ',' -- make sure to set `mapleader` before lazy so your mappings are correct

require("config.plugins")
require("config.options")
require("config.plugins")
require("config.telescope")
require("config.lualine")
require("config.tabline")

require("nord").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
  borders = true, -- Enable the border between verticaly split windows visible
  errors = { mode = "bg" }, -- Display mode for errors and diagnostics
                            -- values : [bg|fg|none]
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = {},
    functions = { italic = true },
    variables = { bold = true },
  },
})

vim.cmd[[colorscheme nord]]
vim.cmd('syntax on')

require("config.lsp").init()

require("config.autocommands")
require("config.keybindings")
