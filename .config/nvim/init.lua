local utils = require("config.utils")
local nmap = utils.nmap
local home = vim.env.HOME

require("plugins") -- Install/Update plugins
require("config.telescope")
require("config.lualine")
require("config.tabline")

-- Leader
vim.g.mapleader = ','

-- Settings

-- Disable backups
vim.opt.backup = false

-- Enable undofile
vim.opt.undofile = true
vim.opt.undodir = home .. '/.config/nvim-undo' -- keep undo files out of the way

-- shell-like autocomplete to unambiguous portion
vim.opt.wildmode = "longest:full,full"

vim.opt.inccommand = "nosplit"

-- spaces per tab
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- don't always indent by multiple of shiftwidth
vim.opt.shiftround = false

-- spaces per tab (when shifting)
vim.opt.shiftwidth = 2

-- ignore annoying swapfile messages
vim.opt.shortmess = vim.opt.shortmess + 'A'

-- no splash screen
vim.opt.shortmess = vim.opt.shortmess + 'I'

-- file-read message overwrites previous
vim.opt.shortmess = vim.opt.shortmess + 'O'

-- truncate non-file messages in middle
vim.opt.shortmess = vim.opt.shortmess + 'T'

-- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess = vim.opt.shortmess + 'W'

-- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt.shortmess = vim.opt.shortmess + 'a'

-- completion messages
vim.opt.shortmess = vim.opt.shortmess + 'c'

-- overwrite file-written messages
vim.opt.shortmess = vim.opt.shortmess + 'o'

-- truncate file messages at start
vim.opt.shortmess = vim.opt.shortmess + 't'

-- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
vim.opt.showbreak = '↳ '

-- don't show extra info at end of command line
vim.opt.showcmd = false

-- sidescroll in jumps because terminals are slow
vim.opt.sidescroll = 0

-- same as scrolloff, but for columns
vim.opt.sidescrolloff = 3

-- <tab>/<BS> indent/dedent in leading whitespace
vim.opt.smarttab = true

-- try to reuse windows/tabs when switching buffers
vim.opt.switchbuf = 'usetab'

-- don't bother syntax highlighting long lines
vim.opt.synmaxcol = 200

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark"

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
vim.cmd(
  [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
vim.cmd(
  [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
vim.cmd(
  [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
vim.cmd(
  [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
vim.cmd(
  [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

require("config.lsp").init()

local map = vim.api.nvim_set_keymap

-- Telescope
nmap("<C-p>", ":Telescope find_files<CR>", { silent = true })
nmap("<C-]>", ":Telescope tags<CR>", { silent = true })
nmap("<leader>lb", ":Telescope buffers<CR>", { silent = true })
nmap("<leader>lt", ":Telescope help_tags<CR>", { silent = true })
nmap("<leader>lg", "<cmd>Telescope live_grep<cr>", { silent = true })
map("n", "<leader>co", "<CMD>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>", { noremap = true })
nmap("<leader>f", ":Rg ")

-- TABS: Navigation
nmap("<leader>tp", ":tabprevious<CR>", { silent = true })
nmap("<leader>tn", ":tabnext<CR>", { silent = true })
nmap("<leader>te", ":tabedit<space>")

-- Close buffers
nmap("<leader>b", ":bd<CR>")
