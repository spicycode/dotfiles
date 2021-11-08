-- Based on: https://github.com/wbthomason/dotfiles
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require("config.utils")
local opt = utils.opt
local autocmd = utils.autocmd
local map, nmap = utils.map, utils.nmap
require("plugins") -- Install/Update plugins
-- Leader/local leader
g.mapleader = [[,]] -- g.maplocalleader = [[ ]]

local telescope = require("telescope")
telescope.setup({
	defaults = {
		layout_strategy = "flex",
		scroll_strategy = "cycle",
	},
	pickers = {
		find_files = {
			disable_devicons = true,
			previewer = false,
		},
		file_browser = {
			disable_devicons = true,
			previewer = false,
		},
	},
})

-- Settings
local buffer = { o, bo }
local window = { o, wo }

opt("wildmode", "longest,full")

opt("inccommand", "nosplit")

opt("tabstop", 2, buffer)
opt("softtabstop", 2, buffer)
opt("expandtab", true, buffer)
opt("shiftwidth", 2, buffer)

-- Colorscheme
opt("termguicolors", true)
opt("background", "dark")
cmd([[colorscheme ayu]])

-- Numbers
opt("number", true)
opt("numberwidth", 3)

-- Window Management

-- Open new horizontal split windows below current
opt("splitbelow", true)

-- Open new vertical split windows to the right
opt("splitright", true)

-- Buffers

-- Buffers become hidden when unloaded
opt("hidden", true)

-- Always show status bar
opt("laststatus", 2)

-- Enable transparency on floating windows
opt("winblend", 10)

-- Search:
-- show the `best match so far' as search strings are typed:
opt("incsearch", true)

-- Don't highlight search result.
opt("hlsearch", false)
--set nohlsearch

-- Searches wrap around the end of the file
opt("wrapscan", true)

-- Ignore case on insert completion
opt("infercase", true)

-- Stylin:
-- Enable transparency on floating windows
opt("winblend", 10)

-- If lightline/airline is enabled, don't show mode under it
opt("showmode", false)

-- Commands
cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

local lspconfig = require("lspconfig")

-- Pretty QuickFix
require("pqf").setup()

-- Neovim doesn't support snippets out of the box, so we need to mutate the
-- capabilities we send to the language server to let them know we want snippets.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
nmap("<leader>f", "<cmd>Telescope live_grep<cr>", { silent = true })

-- TABS: Navigation
nmap("<leader>tp", ":tabprevious<CR>", { silent = true })
nmap("<leader>tn", ":tabnext<CR>", { silent = true })
nmap("<leader>te", ":tabedit<space>")

-- Close buffers
nmap("<leader>b", ":bd<CR>")
