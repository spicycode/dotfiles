-- Leader
vim.g.mapleader = ',' -- make sure to set `mapleader` before lazy so your mappings are correct

require("config.plugins")

require("catppuccin").setup({
  cmp = true,
  fidget = true,
  markdown = true,
  mason = true,
  native_lsp = true,
  lsp_saga = true,
  lsp_trouble = true,
  treesitter = true
})

vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd.syntax = "on"

require("config.options")
require("config.plugins")
require("config.telescope")
require("config.lualine")
require("config.tabline")
require("config.lsp").init()
require("config.keybindings")
