local utils = require("config.utils")
local nmap = utils.nmap
local home = vim.env.HOME

require("plugins") -- Install/Update plugins
require("config.telescope")
require("config.lualine")

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

local _M = {}
_M.colors = {
  bg = "#2e3440",
  fg = "#ECEFF4",
  red = "#bf616a",
  orange = "#d08770",
  yellow = "#ebcb8b",
  blue = "#5e81ac",
  green = "#a3be8c",
  cyan = "#88c0d0",
  magenta = "#b48ead",
  pink = "#FFA19F",
  grey1 = "#f8fafc",
  grey2 = "#f0f1f4",
  grey3 = "#eaecf0",
  grey4 = "#d9dce3",
  grey5 = "#c4c9d4",
  grey6 = "#b5bcc9",
  grey7 = "#929cb0",
  grey8 = "#8e99ae",
  grey9 = "#74819a",
  grey10 = "#616d85",
  grey11 = "#464f62",
  grey12 = "#3a4150",
  grey13 = "#333a47",
  grey14 = "#242932",
  grey15 = "#1e222a",
  grey16 = "#1c1f26",
  grey17 = "#0f1115",
  grey18 = "#0d0e11",
  grey19 = "#020203"
}

require('onenord').setup({
  borders = true,
  fade_nc = false,
  styles = {
    comments = "italic",
    strings = "NONE",
    keywords = "NONE",
    functions = "italic",
    variables = "bold",
    diagnostics = "underline"
  },
  disable = { background = false, cursorline = false, eob_lines = true },
  custom_highlights = {
    VertSplit = { fg = _M.colors.grey14 },
    BufferLineIndicatorSelected = { fg = _M.colors.cyan, bg = _M.colors.bg },
    BufferLineFill = { fg = _M.colors.fg, bg = _M.colors.grey14 },
    NvimTreeNormal = { fg = _M.colors.grey5, bg = _M.colors.grey14 },
    WhichKeyFloat = { bg = _M.colors.grey14 },
    GitSignsAdd = { fg = _M.colors.green },
    GitSignsChange = { fg = _M.colors.orange },
    GitSignsDelete = { fg = _M.colors.red },
    NvimTreeFolderIcon = { fg = _M.colors.grey9 },
    NvimTreeIndentMarker = { fg = _M.colors.grey12 },

    NormalFloat = { bg = _M.colors.grey14 },
    FloatBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },

    TelescopePromptPrefix = { bg = _M.colors.grey14 },
    TelescopePromptNormal = { bg = _M.colors.grey14 },
    TelescopeResultsNormal = { bg = _M.colors.grey15 },
    TelescopePreviewNormal = { bg = _M.colors.grey16 },

    TelescopePromptBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
    TelescopeResultsBorder = { bg = _M.colors.grey15, fg = _M.colors.grey15 },
    TelescopePreviewBorder = { bg = _M.colors.grey16, fg = _M.colors.grey16 },

    TelescopePromptTitle = { fg = _M.colors.grey14 },
    TelescopeResultsTitle = { fg = _M.colors.grey15 },
    TelescopePreviewTitle = { fg = _M.colors.grey16 },

    PmenuSel = { bg = _M.colors.grey12 },
    Pmenu = { bg = _M.colors.grey14 },
    PMenuThumb = { bg = _M.colors.grey16 },

    LspFloatWinNormal = { fg = _M.colors.fg, bg = _M.colors.grey14 },
    LspFloatWinBorder = { fg = _M.colors.grey14 }
  }
})

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
