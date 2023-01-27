-- Leader
vim.g.mapleader = ',' -- make sure to set `mapleader` before lazy so your mappings are correct

require("config.plugins")
require("config.theming")
require("config.options")
require("config.plugins")
require("config.telescope")
require("config.lualine")
require("config.tabline")
require("config.treesitter")
require("config.lsp").init()
require("config.keybindings")
