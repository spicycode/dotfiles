-- Based on: https://github.com/wbthomason/dotfiles
local g = vim.g
local cmd = vim.cmd
local o, bo = vim.o, vim.bo
local utils = require("config.utils")
local opt = utils.opt
local map, nmap = utils.map, utils.nmap

require("plugins") -- Install/Update plugins
require("config.telescope")

-- Leader/local leader
g.mapleader = [[,]] -- g.maplocalleader = [[ ]]

-- Settings
local buffer = { o, bo }

-- Disable backups
vim.opt.backup = false

-- Enable undofile
vim.opt.undofile = true

-- Set undodir to tmp directory
opt("undodir", vim.fn.stdpath("config") .. "/undo")

opt("wildmode", "longest,full")

vim.opt.inccommand = "nosplit"

opt("tabstop", 2, buffer)
opt("softtabstop", 2, buffer)
opt("expandtab", true, buffer)
opt("shiftwidth", 2, buffer)

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark"

cmd([[colorscheme ayu]])

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 3

-- Window Management

-- Open new horizontal split windows below current
vim.opt.splitbelow = true

-- Open new vertical split windows to the right
vim.opt.splitright = true

-- Buffers

-- Buffers become hidden when unloaded
vim.opt.hidden = true

-- Always show status bar
vim.opt.laststatus = 2

-- Enable transparency on floating windows
vim.opt.winblend = 10

-- Search:
-- show the `best match so far' as search strings are typed:
vim.opt.incsearch = true

-- Don't highlight search result.
vim.opt.hlsearch = false
-- Searches wrap around the end of the file
vim.opt.wrapscan = true

-- Ignore case on insert completion
vim.opt.infercase = true

-- Transparency on floating windows
vim.opt.winblend = 10

-- If lightline/airline is enabled, don't show mode under it
vim.opt.showmode = false

-- show completion menu (for nvim-cmp)
vim.opt.completeopt = 'menu'

-- show menu even if there is only one candidate (for nvim-cmp)
vim.opt.completeopt = vim.opt.completeopt + 'menuone'

-- don't automatically select candidate (for nvim-cmp)
vim.opt.completeopt = vim.opt.completeopt + 'noselect'

-- Commands
cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

require"fidget".setup{}

require("config.lsp").init()


-- Pretty QuickFix
require("pqf").setup()

-- Compe config
require("compe").setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "always",
	documentation = true,
	source = {
		calc = false,
		path = true,
		buffer = true,
		nvim_lsp = true,
		vsnip = false,
		nvim_lua = true,
		spell = false,
		tags = true,
		treesitter = true,
	},
})

local compeOpts = { noremap = true, silent = true, expr = true }
map("i", "<c-c>", [[compe#complete()]], compeOpts)
map("i", "<cr>", [[compe#confirm('<cr>')]], compeOpts)
map("i", "<c-e>", [[compe#close('<c-e>')]], compeOpts)

-- Telescope
nmap("<C-p>", ":Telescope find_files<CR>", { silent = true })
nmap("<C-]>", ":Telescope tags<CR>", { silent = true })
nmap("<leader>lb", ":Telescope buffers<CR>", { silent = true })
nmap("<leader>lt", ":Telescope help_tags<CR>", { silent = true })
nmap("<leader>lg", "<cmd>Telescope live_grep<cr>", { silent = true })
nmap("<leader>f", ":Rg ")

-- TABS: Navigation
nmap("<leader>tp", ":tabprevious<CR>", { silent = true })
nmap("<leader>tn", ":tabnext<CR>", { silent = true })
nmap("<leader>te", ":tabedit<space>")

-- Close buffers
nmap("<leader>b", ":bd<CR>")

