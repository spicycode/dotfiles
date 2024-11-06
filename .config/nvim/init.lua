-- Leader
vim.g.mapleader = "," -- make sure to set `mapleader` before lazy so your mappings are correct

require("config.plugins")
require("config.theming")
require("config.options")
require("config.plugins")
require("config.telescope")
require("config.statusline")
require("config.tabline")
require("config.treesitter")
require("config.lsp")
require("config.formatting")
require("config.keybindings")
require("config.autocmds")
