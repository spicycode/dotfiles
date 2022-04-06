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

require("telescope").setup({
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
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")

-- Settings
local buffer = { o, bo }
local window = { o, wo }

opt("infercase", true)

-- Disable backups
opt("backup", false)

-- Enable undofile
opt("undofile", true)
-- Set undodir to tmp directory
opt("undodir", vim.fn.stdpath("config") .. "/undo")

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

local nvim_lsp = require("lspconfig")

-- Neovim doesn't support snippets out of the box, so we need to mutate the
-- capabilities we send to the language server to let them know we want snippets.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_installer = require("nvim-lsp-installer")
require"fidget".setup{}


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { "solargraph" }
-- for _, lsp in ipairs(servers) do
-- 	nvim_lsp[lsp].setup({
-- 		on_attach = on_attach,
-- 		flags = {
-- 			debounce_text_changes = 150,
-- 		},
-- 	})
-- end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		--Enable completion triggered by <c-x><c-o>
		buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		local mappingOpts = { noremap = true, silent = true }

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", mappingOpts)
		buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", mappingOpts)
		buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", mappingOpts)
		buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", mappingOpts)
		buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", mappingOpts)
		buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", mappingOpts)
		buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", mappingOpts)
		buf_set_keymap(
			"n",
			"<space>wl",
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
			mappingOpts
		)
		buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", mappingOpts)
		buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", mappingOpts)
		buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", mappingOpts)
		buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", mappingOpts)
		buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", mappingOpts)
		buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", mappingOpts)
		buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", mappingOpts)
		buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", mappingOpts)
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", mappingOpts)
	end

	local opts = {
		-- on_attach: on_attach,
	}

	-- (optional) Customize the options passed to the server
	-- if server.name == "tsserver" then
	--     opts.root_dir = function() ... end
	-- end
	if server.name == "solargraph" then
		opts.flags = {
			debounce_text_changes = 150,
		}
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

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

