-- Leader
vim.g.mapleader = ',' -- make sure to set `mapleader` before lazy so your mappings are correct

require("config.plugins")
require("config.options")
require("config.plugins")
require("config.telescope")
require("config.lualine")
require("config.tabline")

vim.cmd[[colorscheme nord]]

vim.cmd('syntax on')

require("config.lsp").init()

require("config.keybindings")
